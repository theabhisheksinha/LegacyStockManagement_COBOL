//CAT724  PROC DUMP=Y,                                                          
//          REG=4M,                                                             
//          DB2SYS='DB2PROD',           DB2PROD/DB2TEST                         
//          DB2SYS1='DB2PROD',         *DB2 SYSTEM DB2PROD/DB2TEST *            
//          CARDLIB='BISG.CARDLIB',                                             
//          PLAN='ACTBTCH',                                                     
//          RUNDATE=                                                            
//*                                                                             
//*********************************************************************         
//* SELECT FULL RECEIVES IN REVIEW AND PTR DELIVERY TRANSERS IN MEMO  *         
//* REQUEST, WHICH WERE FOUND BY BATCH TO HAVE AN ACCOUNT FREEZE.     *         
//* WHEN A REJECT ROW EXISTS ON HOLD, UPD IT TO BE ELIGABLE TO SUBMIT,*         
//* AND WILL GO OUT ON CYCLE 1 OF NEXT BUSINESS DAY.                  *         
//* THIS IS AN UPDATE JOB AND IS RESTARTABLE.                         *         
//*********************************************************************         
//CAT724  EXEC PGM=CAT724,                                                      
//             REGION=&REG                                                      
//*                                                                             
//STEPLIB  DD  DSN=&RUNDATE.ADP.DATELIB,DISP=SHR                I/P             
//         DD  DSN=DBSYS.CAF.LOADLIB,DISP=SHR                                   
//         DD  DSN=&DB2SYS..SDSNEXIT,DISP=SHR                                   
//         DD  DSN=&DB2SYS1..SDSNLOAD,DISP=SHR                                  
//AFFOPCA  DD  DSN=OPCA.AFFCARD,DISP=SHR                                        
//DSNPLAN  DD  DSN=&CARDLIB(&PLAN),DISP=SHR                                     
//SYSOUT   DD  SYSOUT=*                                                         
//SPIESNAP DD  SYSOUT=&DUMP                                                     
//ABENDAID DD  SYSOUT=&DUMP                                                     
//SYSUDUMP DD  SYSOUT=&DUMP                                                     
//****** END OF PROCEDURE                                                       
