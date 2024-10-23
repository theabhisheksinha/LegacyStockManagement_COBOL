//CAT838  PROC STREAM=Z,                                                03/04/24
//             B1HDR='BZZZ.B1FL.PROD',                                  CAT838  
//             CARDLIB='BISG.CARDLIB',    * DB2                       * CAT838  
//             DB2SYS='DB2PROD',          * DB2PROD/DB2TEST           * CAT838  
//             DB2SYS1='DB2PROD',        * DB2PROD/DB2TEST           *  CAT838  
//             PLAN='DB2PBTCH',           * DB2                       * CAT838  
//             NAV=,                      * N&A FILES          INPUT  * CAT838  
//             HNB='BZZZ',                * 1ST NODE STREAM ID        * CAT838  
//             GENP='(+1)',                                             CAT838  
//             GDG='GDG,',                                              CAT838  
//             UNIT=BATCH,                                              CAT838  
//             SPACE='(CYL,(5,1),RLSE)',                                CAT838  
//             REG=6M,                                                  CAT838  
//             DUMP=Y,                                                  CAT838  
//             RUNDATE='RERUN.EARLY.'                                   CAT838  
//*                                                                     CAT838  
//*******************************************************************   CAT838  
//*  EXTRACT ACAT ACCOUNT NAMES THAT MATCH WITH NAMES IN OFAC LIST      CAT838  
//*******************************************************************   CAT838  
//CAT838  EXEC PGM=CAT838,PARM=&STREAM,REGION=&REG                      CAT838  
//STEPLIB   DD DSN=&RUNDATE.ADP.DATELIB,DISP=SHR                        CAT838  
//          DD DSN=DBSYS.CAF.LOADLIB,DISP=SHR                           CAT838  
//          DD DSN=&DB2SYS..SDSNEXIT,DISP=SHR                           CAT838  
//          DD DSN=&DB2SYS1..SDSNLOAD,DISP=SHR                          CAT838  
//AFFOPCA   DD DSN=OPCA.AFFCARD,DISP=SHR                                CAT838  
//DSNPLAN   DD DSN=&CARDLIB(&PLAN),DISP=SHR                             CAT838  
//B1FIL     DD DSN=&B1HDR,DISP=SHR                                      CAT838  
//NAFILEA   DD DSN=&NAV..BNA34.NAFILEA,                         I/P     CAT838  
//             DISP=SHR,                                                CAT838  
//             AMP=('BUFNI=2,BUFND=12')                                 CAT838  
//NAFILEI   DD DSN=&NAV..BNA34.NAFILEI,                         I/P     CAT838  
//             DISP=SHR,                                                CAT838  
//             AMP=('BUFNI=2,BUFND=12')                                 CAT838  
//OFACFL    DD DSN=&HNB..CAT838.OFACFL&GENP,                    O/P     CAT838  
//             DISP=(NEW,CATLG,DELETE),                                 CAT838  
//             UNIT=&UNIT,                                              CAT838  
//             SPACE=&SPACE,                                            CAT838  
//             DCB=(&GDG.BUFNO=15)                                      CAT838  
//SYSOUT    DD SYSOUT=*                                                 CAT838  
//ABENDAID  DD SYSOUT=&DUMP                                             CAT838  
//SYSPRINT  DD SYSOUT=&DUMP                                             CAT838  
//SYSUDUMP  DD SYSOUT=&DUMP                                             CAT838  
//SYSABOUT  DD SYSOUT=&DUMP                                             CAT838  
//*                                                                     CAT838  
//*******************************************************************   CAT838  
//*  SORT ACAT OFAC LIST FILE IN CLT, MATCH-IND, BR, ACCT  SEQUENCE     CAT838  
//*******************************************************************   CAT838  
//SORT10  EXEC PGM=SORT,REGION=&REG                                     CAT838  
//SORTIN   DD DSN=&HNB..CAT838.OFACFL&GENP,                    I/P      CAT838  
//            DISP=SHR                                                  CAT838  
//SORTOUT  DD DSN=&HNB..CAT838.OFACFL.SORTED&GENP,             O/P      CAT838  
//            DISP=(NEW,CATLG,DELETE),                                  CAT838  
//            UNIT=&UNIT,                                               CAT838  
//            SPACE=&SPACE,                                             CAT838  
//            DCB=(&GDG.BUFNO=15)                                       CAT838  
//SYSPRINT DD SYSOUT=*                                                  CAT838  
//SORTLIST DD SYSOUT=*                                                  CAT838  
//SYSOUT   DD SYSOUT=*                                                  CAT838  
//SYSIN    DD DSN=BISG.CARDLIB(CAT838S1),DISP=SHR                       CAT838  
//** SORT FIELDS=(1,4,A,5,1,A,6,03,A,9,5,A),FORMAT=BI                   CAT838  
//**  CLT > MATCH-IND > BRANCH > ACCT >                                 CAT838  
//*                                                                     CAT838  
//*******************************************************************   CAT838  
//*         CREATE ACAT OFAC NAME LIST REPORT                           CAT838  
//*******************************************************************   CAT838  
//CAT839  EXEC PGM=CAT839,PARM=&STREAM,REGION=&REG                      CAT838  
//STEPLIB   DD DSN=&RUNDATE.ADP.DATELIB,DISP=SHR                        CAT838  
//B1FIL     DD DSN=&B1HDR,DISP=SHR                                      CAT838  
//OFACFL    DD DSN=&HNB..CAT838.OFACFL.SORTED&GENP,           I/P       CAT838  
//             DISP=SHR                                                 CAT838  
//REPTFL    DD DSN=&HNB..CAT839.OFCPI&GENP,                             CAT838  
//             DISP=(,CATLG,DELETE),                                    CAT838  
//             UNIT=&UNIT,                                              CAT838  
//             SPACE=&SPACE,                                            CAT838  
//             DCB=(&GDG.RECFM=FBA,LRECL=143)                           CAT838  
//SYSOUT    DD SYSOUT=*                                                 CAT838  
//ABENDAID  DD SYSOUT=&DUMP                                             CAT838  
//SYSPRINT  DD SYSOUT=&DUMP                                             CAT838  
//SYSUDUMP  DD SYSOUT=&DUMP                                             CAT838  
//SYSABOUT  DD SYSOUT=&DUMP                                             CAT838  
//*                                                                     CAT838  
