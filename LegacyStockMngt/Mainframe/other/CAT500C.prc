//CAT500C PROC B1FIL='BZZZ.B1FL.PROD',                                          
//             CARDLIB='BISG.CARDLIB',                                          
//             DB2SYS='DB2PROD',         *DB2 SYSTEM DB2PROD/DB2TEST *          
//             DB2SYS1='DB2PROD',        *DB2 DB2PROD/DB2TEST        *          
//             PLAN='ACTBTCH',           *DB2 PLAN CARDLIB MEMBER    *          
//             DUMP=Y,                                                          
//             GDG='GDG,',                                                      
//             GENP='(+1)',              *&STRM3..NSCCIN&GENP,        *         
//             HNB=,                                                            
//             REG=4M,                                                          
//             RUNDATE='RERUN.EARLY.',                                          
//             UNIT=BATCH                                                       
//**********************************************************************        
//*CAT500C: SELECTS ACTITRF ROWS MARKED AS REJECT FOR CLIENT 6        *         
//**********************************************************************        
//CAT500C  EXEC PGM=CAT500C,                                                    
//         REGION=&REG                                                          
//STEPLIB  DD  DSN=&RUNDATE.ADP.DATELIB,                                        
//             DISP=SHR                                                         
//         DD  DSN=DBSYS.CAF.LOADLIB,                                           
//             DISP=SHR                                                         
//         DD  DSN=&DB2SYS..SDSNEXIT,                                           
//             DISP=SHR                                                         
//         DD  DSN=&DB2SYS1..SDSNLOAD,                                          
//             DISP=SHR                                                         
//AFFOPCA  DD  DSN=OPCA.AFFCARD,                                                
//             DISP=SHR                                                         
//DSNPLAN  DD  DSN=&CARDLIB(&PLAN),                                             
//             DISP=SHR                                                         
//B1FIL    DD  DSN=&B1FIL,                                                      
//             DISP=SHR                                                         
//EXTR     DD  DSN=&HNB..CAT500C.EXTR&GENP,                       O/P           
//             DISP=(NEW,CATLG,DELETE),                                         
//             SPACE=(CYL,(2,5),RLSE),                                          
//             UNIT=&UNIT,                                                      
//             DCB=(&GDG.DSORG=PS,LRECL=770,RECFM=FB)                           
//SYSOUT   DD  SYSOUT=*                                                         
//SYSPRINT DD  SYSOUT=*                                                         
//SYSUDUMP DD  SYSOUT=&DUMP                                                     
//SPIESNAP DD  SYSOUT=&DUMP                                                     
//SYSABOUT DD  SYSOUT=&DUMP                                                     
//**********************************************************************        
//*CAT500CV: UPDATES RECEIVER ACCOUNT ON ACTITRF BASED ON CONVERSION   *        
//**********************************************************************        
//CAT500CV EXEC PGM=CAT500CV,                                                   
//         REGION=&REG                                                          
//STEPLIB  DD  DSN=&RUNDATE.ADP.DATELIB,                                        
//             DISP=SHR                                                         
//         DD  DSN=DBSYS.CAF.LOADLIB,                                           
//             DISP=SHR                                                         
//         DD  DSN=&DB2SYS..SDSNEXIT,                                           
//             DISP=SHR                                                         
//         DD  DSN=&DB2SYS1..SDSNLOAD,                                          
//             DISP=SHR                                                         
//AFFOPCA  DD  DSN=OPCA.AFFCARD,                                                
//             DISP=SHR                                                         
//DSNPLAN  DD  DSN=&CARDLIB(&PLAN),                                             
//             DISP=SHR                                                         
//EXTR     DD  DSN=&HNB..CAT500C.EXTR&GENP,                       I/P           
//             DISP=SHR                                                         
//SYSOUT   DD  SYSOUT=*                                                         
//SYSPRINT DD  SYSOUT=*                                                         
//SYSUDUMP DD  SYSOUT=&DUMP                                                     
//SPIESNAP DD  SYSOUT=&DUMP                                                     
//SYSABOUT DD  SYSOUT=&DUMP                                                     
