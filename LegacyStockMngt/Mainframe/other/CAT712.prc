//CAT712  PROC DUMP=Y,                                                          
//          STREAM=,                                                            
//          B1HDR='BZZZ.B1FL',                                                  
//          REG=2M,                                                             
//          DB2SYS='DB2PROD',           DB2PROD/DB2TEST                         
//          DB2SYS1='DB2PROD',         *DB2 SYSTEM DB2PROD/DB2TEST *            
//          CARDLIB='BISG.CARDLIB',                                             
//          PLAN='ACTBTCH',                                                     
//          RUNDATE=                                                            
//*                                                                             
//CAT712  EXEC PGM=CAT712,PARM='&STREAM',                                       
//             REGION=&REG                                                      
//*                                                                             
//B1FIL    DD  DSN=&B1HDR,DISP=SHR                                              
//SYSOUT   DD  SYSOUT=*                                                         
//*                                                                             
//STEPLIB  DD  DSN=&RUNDATE.ADP.DATELIB,DISP=SHR                I/P             
//         DD  DSN=DBSYS.CAF.LOADLIB,DISP=SHR                                   
//         DD  DSN=&DB2SYS..SDSNEXIT,DISP=SHR                                   
//         DD  DSN=&DB2SYS1..SDSNLOAD,DISP=SHR                                  
//AFFOPCA  DD  DSN=OPCA.AFFCARD,DISP=SHR                                        
//DSNPLAN  DD  DSN=&CARDLIB(&PLAN),DISP=SHR                                     
//*                                                                             
//SPIESNAP DD  SYSOUT=&DUMP                                                     
//ABENDAID DD  SYSOUT=&DUMP                                                     
//SYSUDUMP DD  SYSOUT=&DUMP                                                     
//****** END OF PROCEDURE                                                       
