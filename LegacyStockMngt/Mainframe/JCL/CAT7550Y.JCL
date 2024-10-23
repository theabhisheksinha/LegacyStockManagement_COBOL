//CAT7550Y JOB (BY0P,DY00),'ADD CONTRA CUSIP',USER=BY0P,CLASS=1,                
//         SCHENV=STREAMY,                                                      
//             MSGCLASS=W,                                                      
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//*                                                                             
//CA11    EXEC CA11                                                             
//*                                                                             
//*********************************************************************         
//*    ADD CONTRA CUSIP FROM REORG FILE TO VRSTSEC DATABASE           *         
//*********************************************************************         
//STEP10  EXEC CAT755,                                                          
//             STREAM=Y,                                                        
//             HNB=BYYY,                                                        
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP'    *DB2                                  
//CAT755.STEPLIB   DD                                                           
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
