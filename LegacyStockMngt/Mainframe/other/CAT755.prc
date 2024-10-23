//CAT755  PROC STREAM=,                                                         
//             CARDLIB='BISG.CARDLIB',    *DB2 PLAN CARDLIB          *          
//             DB2SYS='DB2PROD',          *DB2 SYSTEM DB2PROD/DB2TEST *         
//             DB2SYS1='DB2PROD',         *DB2 SYSTEM DB2PROD/DB2TEST *         
//             PLAN='ACTBTCH',            *DB2 PLAN CARDLIB MEMBER    *         
//             HNB=,                                                            
//             GEN='(0)',                                                       
//             B1FIL='BZZZ.B1FL',                                               
//             REGSIZE=4M,                                                      
//             RUNDATE=                                                         
//*                                                                             
//*********************************************************************         
//*     ADD CONTRA SECURITIES TO VRSTSEC DATABASE                     *         
//*********************************************************************         
//*                                                                             
//CAT755    EXEC PGM=CAT755,PARM='&STREAM',                                     
//             REGION=&REGSIZE                                                  
//STEPLIB   DD DSN=&RUNDATE.ADP.DATELIB,                                        
//             DISP=SHR                                                         
//          DD DSN=DBSYS.CAF.LOADLIB,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS..SDSNEXIT,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS1..SDSNLOAD,                                          
//             DISP=SHR                                                         
//AFFOPCA   DD DSN=OPCA.AFFCARD,                               *FOR DB2         
//             DISP=SHR                                                         
//DSNPLAN   DD DSN=&CARDLIB(&PLAN),                            *FOR DB2         
//             DISP=SHR                                                         
//B1FIL    DD  DSN=&B1FIL,                                    I/P               
//             DISP=SHR                                                         
//REORGFL  DD  DSN=&HNB..BRE99B.REOANNDA&GEN,                 I/P               
//             DISP=SHR                                                         
//SYSOUT    DD SYSOUT=*                                                         
//SYSPRINT  DD SYSOUT=*                                                         
//SYSUDUMP  DD SYSOUT=Y                                                         
//SPIESNAP  DD SYSOUT=Y                                                         
//SYSABOUT  DD SYSOUT=Y                                                         
