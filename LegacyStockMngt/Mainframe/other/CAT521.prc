//CAT521  PROC STREAM=Z,                  * STREAM INDICATOR          *         
//             BYP1=0,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=0,                    * 1=BYPASS FILE CHECK       *         
//             B1HDR='BZZZ.B1FL.PROD',    *I/P B1 VSAM FILE           *         
//             CARDLIB='BISG.CARDLIB',    *DB2 PLAN CARDLIB           *         
//             DB2SYS='DB2PROD',          *DB2PROD/DB2QA/DB2TEST      *         
//             GEN00A='(+1)',             *I/P .CAT511.ACATTRNS       *         
//             HNB1='BAAA',               *I/P .CAT511.ACATTRNS   GDG *         
//             WM=,                       * WM FOR WEALTH MNGT RUN    *         
//             PLAN='ACTBTCH',            *DB2 PLAN CARDLIB MEMBER    *         
//             PRTCL1='*',                                            *         
//             PRTCL2='Y',                                            *         
//             REGSIZE=8M,                                            *         
//             RUNDATE='RERUN.EARLY.'                                 *         
//*********************************************************************         
//* SUBMIT ASSETS FOR SIAC SHORTEN CYCLES                             *         
//* OUTPUT = DB2 ACATS TABLES                                         *         
//*********************************************************************         
//CAT521  EXEC PGM=CAT521,                                                      
//             PARM='&STREAM&BYP1&BYP2',                                        
//             REGION=&REGSIZE                                                  
//STEPLIB   DD DSN=&RUNDATE.ADP.DATELIB,                                        
//             DISP=SHR                                                         
//          DD DSN=DBSYS.CAF.LOADLIB,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS..GROUP.SDSNEXIT,                                     
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS..GROUP.SDSNLOAD,                                     
//             DISP=SHR                                                         
//AFFOPCA   DD DSN=OPCA.AFFCARD,                               *FOR DB2         
//             DISP=SHR                                                         
//DSNPLAN   DD DSN=&CARDLIB(&PLAN),                            *FOR DB2         
//             DISP=SHR                                                         
//B1FIL     DD DSN=&B1HDR,                                      I/P             
//             DISP=SHR                                                         
//INFILE   DD  DSN=&HNB1..CAT511.&WM.ACATTRNS&GEN00A,           I/P             
//             DISP=SHR                                                         
//SYSOUT    DD SYSOUT=&PRTCL1                                                   
//SYSPRINT  DD SYSOUT=&PRTCL1                                                   
//SYSUDUMP  DD SYSOUT=&PRTCL2                                                   
//SYSABOUT  DD SYSOUT=&PRTCL2                                                   
