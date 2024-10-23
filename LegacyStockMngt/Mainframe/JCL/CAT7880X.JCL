//CAT7880X JOB (BX0P,DY00),'TAXLOT FL EXTRACT',USER=BX0P,CLASS=1,               
//         SCHENV=STREAMX,                                                      
//        MSGCLASS=W,                                                           
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//*                                                                             
//STPE10  EXEC CAT788,                                                          
//             BYP1=0,                    * 1=BYPASS DATE CHECK       *         
//             STREAM=X,                                                        
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//             HNB2=BXXX                                                        
//CAT788.STEPLIB   DD                                                           
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
