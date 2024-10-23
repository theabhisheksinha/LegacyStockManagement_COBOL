//CAT8800P JOB (BP0P,DY00),'ACAT BALNACE RPT',                                  
//         SCHENV=STREAMP,                                                      
//             CLASS=5,MSGCLASS=W,USER=BP0P,                                    
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE5                                                              
//*JOBAFF BALANCE5                                                              
//**********************************************************************        
//CA11    EXEC CA11                                                             
//**********************************************************************        
//STEP1   EXEC CAT880,                                                          
//             B1FIL='BZZZ.B1FL',                                               
//             CARDLIB='BISG.CARDLIB',                                          
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//             HNB=BPPP,                                                        
//             HNB1='SP.PPP',                                                   
//             PLAN='ACTBTCH',                                                  
//             RUNDATE=,                                                        
//             STREAM=P                                                         
//CAT880.STEPLIB   DD                                                           
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
