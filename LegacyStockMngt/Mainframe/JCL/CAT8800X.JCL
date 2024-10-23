//CAT8800X JOB (BX0P,DY00),'ACAT BALANCE RPT',USER=BX0P,                        
//         SCHENV=STREAMX,                                                      
//             CLASS=5,MSGCLASS=W,                                              
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
//             HNB=BXXX,                                                        
//             HNB1='S2.XXX',                                                   
//             PLAN='ACTBTCH',                                                  
//             RUNDATE=,                                                        
//             STREAM=X                                                         
//CAT880.STEPLIB   DD                                                           
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
