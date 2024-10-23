//CAT7880P JOB (BP0P,DY00),'TAXLOT FL EXTRACT',CLASS=1,MSGCLASS=W,              
//         SCHENV=STREAMP,                                                      
//         USER=BP0P,                                                           
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//*                                                                             
//STPE10  EXEC CAT788,                                                          
//             BYP1=0,                    * 1=BYPASS DATE CHECK       *         
//             STREAM=P,                                                        
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//             HNB2=BPPP                                                        
//CAT788.STEPLIB   DD                                                           
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
