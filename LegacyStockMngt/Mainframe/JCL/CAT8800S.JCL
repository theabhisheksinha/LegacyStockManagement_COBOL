//CAT8800S JOB (BS0P,0000),'ACAT NSCC EXTRACT',                                 
//             CLASS=1,MSGCLASS=W,                                              
//  SECLABEL=BISG,SCHENV=STREAMS,                                               
//             USER=BS0P                                                        
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//**********************************************************************        
//CA11    EXEC CA11                                                             
//**********************************************************************        
//STEP1   EXEC CAT880,                                                          
//             B1FIL='BZZZ.B1FL',                                               
//             CARDLIB='BISG.CARDLIB',                                          
//             HNB=BSSS,                                                        
//             HNB1='S6.SSS',                                                   
//             PLAN='ACTBTCH',                                                  
//             RUNDATE=,                                                        
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//             STREAM=S                                                         
//CAT880.STEPLIB   DD                                                           
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
//CAT880C.INFILE DD DUMMY                                                       
//CAT880C.RPTPI  DD DUMMY                                                       
