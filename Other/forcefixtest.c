#include <stdio.h>
#include <string.h>  

/*
  * Gamall Wednesday Ida
  * Workaround Force crash
  * License GPL.
  *
  * Test cases for the two fixes
  */

// if the force string is incorrect, this one will be used
char  *SgaGENERIC_FORCE   = "7 BOGUS";
// masks: no values outside these boundaries will be accepted
char  *SgaFORCE_LOWER    = "0-1-000000000000000000";
char  *SgaFORCE_UPPER    = "7-2-333333333333333333";

char* SgaCheckForceString(char* s) {
    char *p = s, *pu = SgaFORCE_UPPER, *pl = SgaFORCE_LOWER;
    if (!s || strlen(s) != 22) return SgaGENERIC_FORCE;
    while(*p) {if (*p > *pu++ || *p++ < *pl++) {return SgaGENERIC_FORCE;}}
    return s;   
}
      
       

/*
 * Version modified to allow 'tweaked" settings
 * like "g_maxforcerank 200".
 */
 


char  *gaGENERIC_FORCE    = "200 BOGUS";
char  *gaFORCE_LOWER     = "-1-000000000000000000";
char  *gaFORCE_UPPER     = "-2-333333333333333333";


char* gaCheckForceStringTail(char* s, char* S) {
    char *p = s, *pu = gaFORCE_UPPER, *pl = gaFORCE_LOWER;
    if (!s || strlen(s) != 21) return gaGENERIC_FORCE;
    while(*p) {if (*p > *pu++ || *p++ < *pl++) {return gaGENERIC_FORCE;}}
    return S;    
}

char* gaCheckForceString(char* S) {
    int i, l; char *p = S;
    if (!S || (l = strlen(S)) > 24 || l < 22  || *S < '0' || *S > '9') return gaGENERIC_FORCE;
    for(i = 1 ; i <= 3 ; i++) {
        if (S[i] == '-') return gaCheckForceStringTail(S+i, S);
        if (S[i] < '0' || S[i] > '9') break;
    } return gaGENERIC_FORCE;
}

// GWI: End Force Crash workaround. 
          
// Testing the workaround
int main()
{
  int i;
  char * tests[] =
  {
    "7-1-033330000000000333",
    "I am so obviously bogus",
    "-1-033330100000020333",
    "1-033330010002000333",
    "-033330000200000333",
    "033330020000100333",
    "a-1-033330000000000333",
    "8-1-033330000000000333",
    "0-1-033330000000000333",
    "7-0-033330000000000333",
    "7-4-033330000000000333",
    "5-c-033330000000000333",
    "1-2-033330000000000333",
    "1-2-03333000000000333",
    "1-2-033330040000000333",
    "4-2-012030201010202010",
    "4-2-111111111122223310",
    "----------------------",
    "200-2-111111111122223310",
    "445-2-111111111122223310",
    "199-2-111111111122223310",
    "-4-2-111111111122223310",
    "-14-2-111111111122223310",
    "-94-2-111111111122223310",
    "-994-2-111111111122223310",
    "20.-2-111111111122223310",
    "20a-2-111111111122223310",
    ""
  };
  
  printf("\n\nMAX FORCE RANK FIXES TESTS\n\n");
  i = -1;
  while(*tests[++i])
  {
    printf("(%2d) %25s    ---> %25s   ---> %25s\n", i, tests[i], 
           gaCheckForceString(tests[i]),  SgaCheckForceString(tests[i]));
  }

  
};
