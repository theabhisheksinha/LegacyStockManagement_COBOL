//CAT8800F JOB (BF0P,DY00),'ACAT BALANCE RPT',                                  
//         SCHENV=STREAMF,                                                      
//             CLASS=5,MSGCLASS=W,USER=BF0P,                                    
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
//             HNB=BFFF,                                                        
//             HNB1='SF.FFF',                                                   
//             PLAN='ACTBTCH',                                                  
//             RUNDATE=,                                                        
//             STREAM=F                                                         
//CAT880.STEPLIB   DD                                                           
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
