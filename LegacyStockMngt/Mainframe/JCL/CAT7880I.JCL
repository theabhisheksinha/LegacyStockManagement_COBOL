//CAT7880I JOB (BI0P,DY00),'TAXLOT FL EXTRACT',CLASS=1,MSGCLASS=W,              
//         SCHENV=STREAMI,                                                      
//         USER=BI0P,                                                           
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//*                                                                             
//STPE10  EXEC CAT788,                                                          
//             BYP1=0,                    * 1=BYPASS DATE CHECK       *         
//             STREAM=I,                                                        
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//             HNB2=BIII                                                        
//CAT788.STEPLIB   DD                                                           
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
