//CAT8800N JOB (BN1P,DAC0),'ACAT BALANCE RPT',                                  
//         SCHENV=STREAMN,                                                      
//             CLASS=5,MSGCLASS=W,USER=BN1P,                                    
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE5                                                              
//*JOBAFF BALANCE5                                                              
//**********************************************************************        
//CA11    EXEC CA11,                                                            
//             RMSPARM=P                                                        
//**********************************************************************        
//STEP1   EXEC CAT880,                                                          
//             B1FIL='BZZZ.B1FL',                                               
//             CARDLIB='BISG.CARDLIB',                                          
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//             DISP1='(,CATLG,DELETE)',                                         
//             DUMP=Y,                                                          
//             GDG='GDG,',                                                      
//             GENP='(+1)',                                                     
//             HNB=BNNN,                                                        
//             HNB1='SN.NNN',                                                   
//             PLAN='ACTBTCH',                                                  
//             REG=2M,                                                          
//             RUNDATE=,                                                        
//             STREAM=N,                                                        
//             UNIT=BATCH                                                       
//CAT880.STEPLIB   DD                                                           
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
