//CATUPLDI PROC CARDLIB='BISG.CARDLIB',   *DB2 PLAN CARDLIB           *         
//             DB2SYS='DB2PROD',          *DB2 SYSTEM DB2PROD/DB2TEST *         
//             DB2SYS1='DB2PROD',                                               
//             DSNLOAD='SDSNLOAD',                                              
//             PLAN='ACTBTCH',            *DB2 PLAN CARDLIB MEMBER    *         
//             GEN='(0)',                 *I/P .CATEXTR.EXTRACT       *         
//             HNB='BZZZ',                *I/P .CAT650.EXTRACT    GDG *         
//             PRTCL1='*',                                                      
//             PRTCL2='Y',                                                      
//             REGSIZE=16M                                                      
//*                                                                             
//*********************************************************************         
//*                                                                   *         
//* UPLOAD  4 DB2 TABLES FROM CATEXTR FILE.                           *         
//*   (1) ACTITRF - INITAIL TRANSFER TABLE                            *         
//*   (2) ACTIAST - INITAIL ASSET TABLE                               *         
//*   (3) ACTIMF  - INITAIL MUTUAL FUND TABLE                         *         
//*   (4) ACTIOPN - INITAIL OPTION TABLE                              *         
//*                                                                   *         
//*********************************************************************         
//*                                                                             
//CATUPLDI  EXEC PGM=CATUPLDI,                                                  
//             REGION=&REGSIZE                                                  
//STEPLIB   DD DSN=ADP.DATELIB,                                                 
//             DISP=SHR                                                         
//          DD DSN=DBSYS.CAF.LOADLIB,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS..SDSNEXIT,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS1..&DSNLOAD,                                          
//             DISP=SHR                                                         
//AFFOPCA   DD DSN=OPCA.AFFCARD,                               *FOR DB2         
//             DISP=SHR                                                         
//DSNPLAN   DD DSN=&CARDLIB(&PLAN),                            *FOR DB2         
//             DISP=SHR                                                         
//EXTR      DD DSN=&HNB..CATEXTR.CAT800.DB2FLAT&GEN,            I/P             
//             DISP=SHR                                                         
//SYSOUT    DD SYSOUT=&PRTCL1                                                   
//SYSPRINT  DD SYSOUT=&PRTCL1                                                   
//SYSUDUMP  DD SYSOUT=&PRTCL2                                                   
//SPIESNAP  DD SYSOUT=&PRTCL2                                                   
//SYSABOUT  DD SYSOUT=&PRTCL2                                                   
//*                                                                     00521000
