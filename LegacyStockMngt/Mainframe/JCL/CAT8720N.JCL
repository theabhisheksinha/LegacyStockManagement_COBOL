//CAT8720N JOB (BN1P,DAC0),'ACATS ACTIVITY ',CLASS=3,MSGCLASS=W,                
//         SCHENV=STREAMN,                                                      
//         USER=BN1P,                                                           
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE3                                                              
//*JOBAFF BALANCE3                                                              
//*                                                                             
//CA11    EXEC CA11,                                                            
//             RMSPARM=P                                                        
//*                                                                             
//STEP10  EXEC CAT872,                    *DB2 SYSTEM DB2PROD/DB2TEST *         
//             B1HDR='BZZZ.B1FL',         *DB2 PLAN CARDLIB MEMBER    *         
//             CARDLIB='BISG.CARDLIB',                                          
//             CAT872=,                                                         
//             DB2SYS='DB2PROD.GROUP',    *DB2 SYSTEM DB2PROD/DB2TEST *         
//             DB2SYS1='DB2PROD.GROUP',   *DB2 SYSTEM DB2PROD/DB2TEST *         
//             GEN='(0)',                                                       
//             GENP='(+1)',                                                     
//             HNB=BNNN,                                                        
//             HNB1=PBSN,                                                       
//             PARM872='N',                                                     
//             PLAN='ACTBTCH',                                                  
//             PLYD='Y',                                                        
//             REG=2M,                                                          
//             RUNDATE=,                                                        
//             STREAM=N,                                                        
//             TMP=TMP,                                                         
//             UNIT=BATCH                                                       
//CAT872.STEPLIB   DD DSN=&RUNDATE.ADP.DATELIB,                                 
//             DISP=SHR                                                         
//          DD DSN=DBSYS.CAF.LOADLIB,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS..SDSNEXIT,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS1..SDSNLOAD,                                          
//             DISP=SHR                                                         
//*                                                                             
