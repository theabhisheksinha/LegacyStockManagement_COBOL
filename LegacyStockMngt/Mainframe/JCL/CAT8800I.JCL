//CAT8800I JOB (BI0P,DY00),'ACAT BALANCE RPT',                                  
//         SCHENV=STREAMI,                                                      
//             CLASS=5,MSGCLASS=W,USER=BI0P,                                    
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
//             HNB=BIII,                                                        
//             HNB1='SI.III',                                                   
//             PLAN='ACTBTCH',                                                  
//             RUNDATE=,                                                        
//             STREAM=I                                                         
//CAT880.STEPLIB   DD                                                           
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
