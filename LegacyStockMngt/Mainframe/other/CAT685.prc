//CAT685  PROC CARDLIB='BISG.CARDLIB',                                          
//             DB2SYS='DB2PROD',                   DB2PROD/DB2TEST              
//             DB2SYS1='DB2PROD',                     DB2PROD/DB2TEST           
//             DUMP=Y,                                                          
//             GEN0='(0)',                                                      
//             HNB=,                                                            
//             PLAN='ACTBTCH',                                                  
//             REG=4M,                                                          
//             RUNDATE=                                                         
//*                                                                             
//**********************************************************************        
//* CREATE RESCIND BLOCK TYPE=F ROWS FOR SETTLED FRV RCVR SIDE ASSETS           
//**********************************************************************        
//CAT685  EXEC PGM=CAT685,                                                      
//             REGION=&REG                                                      
//STEPLIB  DD  DSN=&RUNDATE.ADP.DATELIB,DISP=SHR                                
//         DD  DSN=DBSYS.CAF.LOADLIB,DISP=SHR                                   
//         DD  DSN=&DB2SYS..SDSNEXIT,DISP=SHR                                   
//         DD  DSN=&DB2SYS1..SDSNLOAD,DISP=SHR                                  
//AFFOPCA  DD  DSN=OPCA.AFFCARD,DISP=SHR                                        
//DSNPLAN  DD  DSN=&CARDLIB(&PLAN),DISP=SHR                                     
//IPEND    DD  DSN=&HNB..CAT650SP.ACATPEND&GEN0,                                
//             DISP=SHR                                                         
//SYSOUT   DD  SYSOUT=*                                                         
//SYSPRINT DD  SYSOUT=&DUMP                                                     
//SPIESNAP DD  SYSOUT=&DUMP                                                     
//ABENDAID DD  SYSOUT=&DUMP                                                     
//SYSUDUMP DD  SYSOUT=&DUMP                                                     
//*                                                                             
