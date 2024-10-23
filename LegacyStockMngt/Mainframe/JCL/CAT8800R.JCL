//CAT8800R JOB (BR0P,0000),'ACAT BALANCE RPT',                                  
//             CLASS=1,MSGCLASS=W,                                              
//  SECLABEL=BISG,SCHENV=STREAMR,                                               
//             USER=BR0P                                                        
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//**********************************************************************        
//CA11    EXEC CA11                                                             
//**********************************************************************        
//STEP1   EXEC CAT880,                                                          
//             B1FIL='BZZZ.B1FL',                                               
//             CARDLIB='BISG.CARDLIB',                                          
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//             HNB=BRRR,                                                        
//             HNB1='S5.RRR',                                                   
//             PLAN='ACTBTCH',                                                  
//             RUNDATE=,                                                        
//             STREAM=R                                                         
//CAT880.STEPLIB   DD                                                           
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
//CAT880C.INFILE DD DUMMY                                                       
//CAT880C.RPTPI  DD DUMMY                                                       
