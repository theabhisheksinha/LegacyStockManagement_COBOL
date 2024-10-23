//CAT916H PROC STREAM=H,                  * STREAM INDICATOR          *         
//             CLIENT=012,                * CLIENT TO BE LOADED       *         
//             CARDLIB='BISG.CARDLIB',    *DB2 PLAN CARDLIB           *         
//             DB2SYS='DB2PROD',          *DB2 SYSTEM DB2PROD/DB2TEST *         
//             DB2SYS1='DB2PROD',         *DB2 SYSTEM DB2PROD/DB2TEST *         
//             PLAN='ACTBTCH',            *DB2 PLAN CARDLIB MEMBER    *         
//             NAV='BNAHHH',              *I/P .BNA34.NAFILEA    VSAM *         
//             DLET=D,                    *CLIENT HSTY DELETE  YES=D            
//             PRTCL1='*',                                                      
//             PRTCL2='Y',                                                      
//             REGSIZE=8M,                                                      
//             RUNDATE=                                                         
//*                                                                             
//*********************************************************************         
//*                                                                   *         
//* LOAD ACAT HISTORY FILE INTO ACATS DB2 HISTORY TABLE               *         
//*                                                                   *         
//*********************************************************************         
//*                                                                             
//CAT916H EXEC PGM=CAT916H,                                                     
//             PARM='&STREAM&CLIENT&DLET',                                      
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
//NAFILEA   DD DSN=&NAV..BNA34.NAFILEA,                             I/P         
//             DISP=SHR,                                                        
//             AMP='BUFNI=50,BUFND=90'                                          
//NAFILEI   DD DSN=&NAV..BNA34.NAFILEI,                             I/P         
//             DISP=SHR,                                                        
//             AMP='BUFNI=50,BUFND=90'                                          
//ACATHST  DD  DSN=BIOS.C012.INP.ACATSUM.DATA,                    I/P           
//             DISP=SHR                                                         
//SYSOUT    DD SYSOUT=&PRTCL1                                                   
//SYSPRINT  DD SYSOUT=&PRTCL1                                                   
//SYSUDUMP  DD SYSOUT=&PRTCL2                                                   
//SPIESNAP  DD SYSOUT=&PRTCL2                                                   
//SYSABOUT  DD SYSOUT=&PRTCL2                                                   
//*                                                                             
