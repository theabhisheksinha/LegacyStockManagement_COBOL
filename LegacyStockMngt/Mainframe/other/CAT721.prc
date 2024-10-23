//CAT721  PROC DUMP=Y,                                                          
//          REG=2M,                                                             
//          PARM721=N,                                                          
//          DB2SYS='DB2PROD',           DB2PROD/DB2TEST                         
//          DB2SYS1='SYS1',            *DB2 SYSTEM DB2PROD/DB2TEST *            
//          CARDLIB='BISG.CARDLIB',                                             
//          PLAN='ACTBTCH',                                                     
//          RUNDATE=                                                            
//*                                                                             
//CAT721  EXEC PGM=CAT721,                                                      
//             PARM='ROLBACK=&PARM721',                                         
//             REGION=&REG                                                      
//STEPLIB  DD  DSN=&RUNDATE.ADP.DATELIB,DISP=SHR                I/P             
//         DD  DSN=DBSYS.CAF.LOADLIB,DISP=SHR                                   
//         DD  DSN=&DB2SYS..DSNEXIT,DISP=SHR                                    
//         DD  DSN=&DB2SYS1..SDSNLOAD,DISP=SHR                                  
//AFFOPCA  DD  DSN=OPCA.AFFCARD,DISP=SHR                                        
//DSNPLAN  DD  DSN=&CARDLIB(&PLAN),DISP=SHR                                     
//SYSOUT   DD  SYSOUT=*                                                         
//SPIESNAP DD  SYSOUT=&DUMP                                                     
//ABENDAID DD  SYSOUT=&DUMP                                                     
//SYSUDUMP DD  SYSOUT=&DUMP                                                     
//****** END OF PROCEDURE                                                       
