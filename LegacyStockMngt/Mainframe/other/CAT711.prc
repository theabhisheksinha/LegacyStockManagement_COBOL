//CAT711  PROC CARDLIB='BISG.CARDLIB',    *DB2 PLAN CARDLIB           *         
//             DB2SYS='DB2PROD',          *DB2 SYSTEM DB2PROD/DB2TEST *         
//             DB2SYS1='DB2PROD',         *DB2 SYSTEM DB2PROD/DB2TEST *         
//             PLAN='ACTBTCH',            *DB2 PLAN CARDLIB MEMBER    *         
//             REG=4M,                                                          
//             RUNDATE='RERUN.EARLY.'                                           
//*                                                                             
//CAT711  EXEC PGM=CAT711,                                                      
//             REGION=&REG                                                      
//STEPLIB  DD  DSN=&RUNDATE.ADP.DATELIB,DISP=SHR                                
//         DD  DSN=DBSYS.CAF.LOADLIB,DISP=SHR                                   
//         DD  DSN=&DB2SYS..SDSNEXIT,DISP=SHR                                   
//         DD  DSN=&DB2SYS1..SDSNLOAD,DISP=SHR                                  
//AFFOPCA  DD  DSN=OPCA.AFFCARD,DISP=SHR                                        
//DSNPLAN  DD  DSN=&CARDLIB(&PLAN),DISP=SHR                                     
//SYSOUT   DD  SYSOUT=*                                                         
//SYSPRINT DD  SYSOUT=*                                                         
//SYSUDUMP DD  SYSOUT=Y                                                         
//SYSABOUT DD  SYSOUT=Y                                                         
//CEEDUMP  DD  SYSOUT=Y,CHARS=GT15                                              
