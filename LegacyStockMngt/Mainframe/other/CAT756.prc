//CAT756  PROC STREAM=Z,                  * CAT756 PARM BATCH STREAM  *         
//             B1FIL='BZZZ.B1FL',                                               
//             CARDLIB='BISG.CARDLIB',    * DB2                       *         
//             DB2SYS='DB2PROD',          * DB2PROD/DB2TEST           *         
//             DB2SYS1='DB2PROD',         * DB2PROD/DB2TEST           *         
//             PLAN='ACTBTCH',            * DB2                       *         
//             HNB='BZZZ',                * .CAT756.WIRES      OUTPUT *         
//             NAV=,                      * NAME/ADDRESS VSAM FILE    *         
//             GENP='(+1)',               * .CAT756.WIRES      OUTPUT *         
//             GDG='GDG,',                * .CAT756.WIRES      OUTPUT *         
//             UNIT=BATCH,                * .CAT756.WIRES      OUTPUT *         
//             REG=4M,                                                          
//             DUMP=Y,                                                          
//             RUNDATE=                                                         
//*-------------------------------------------------------------------*         
//* CREATE AUTOWIRES FEED AFTER EOD PROCESSING.  STEP CONTAINS DB2    *         
//* UPDATE, WHICH IS RSTARTABLE WITH NO CHANGES.                      *         
//*-------------------------------------------------------------------*         
//CAT756 EXEC PGM=CAT756,PARM=&STREAM,REGION=&REG                               
//STEPLIB   DD DSN=&RUNDATE.ADP.DATELIB,DISP=SHR                                
//          DD DSN=DBSYS.CAF.LOADLIB,DISP=SHR                                   
//          DD DSN=&DB2SYS..SDSNEXIT,DISP=SHR                                   
//          DD DSN=&DB2SYS1..SDSNLOAD,DISP=SHR                                  
//AFFOPCA   DD DSN=OPCA.AFFCARD,DISP=SHR                                        
//DSNPLAN   DD DSN=&CARDLIB(&PLAN),DISP=SHR                                     
//B1FIL     DD DSN=&B1FIL,DISP=SHR                                              
//NAFILEA   DD DSN=&NAV..BNA34.NAFILEA,                             I/P         
//             DISP=SHR,                                                        
//             AMP=('BUFNI=2,BUFND=12')                                         
//NAFILEI   DD DSN=&NAV..BNA34.NAFILEI,                             I/P         
//             DISP=SHR,                                                        
//             AMP=('BUFNI=2,BUFND=12')                                         
//WIRES     DD DSN=&HNB..CAT756.WIRES&GENP,                         O/P         
//             DISP=(NEW,CATLG),                                                
//             UNIT=&UNIT,                                                      
//             SPACE=(CYL,(2,5),RLSE),                                          
//             DCB=(&GDG.BUFNO=5)                                               
//SYSOUT    DD SYSOUT=*                                                         
//ABENDAID  DD SYSOUT=&DUMP                                                     
//SYSPRINT  DD SYSOUT=&DUMP                                                     
//SYSUDUMP  DD SYSOUT=&DUMP                                                     
//SYSABOUT  DD SYSOUT=&DUMP                                                     
//SPIESNAP  DD SYSOUT=&DUMP                                                     
