//CAT8800B JOB (BB0P,DY00),'ACAT BALANCE RPT',                                  
//         SCHENV=STREAMB,                                                      
//             CLASS=5,MSGCLASS=W,USER=BB0P,                                    
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
//             HNB=BBBB,                                                        
//             HNB1='SB.BBB',                                                   
//             PLAN='ACTBTCH',                                                  
//             RUNDATE=,                                                        
//             STREAM=B                                                         
//CAT880.STEPLIB   DD                                                           
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
