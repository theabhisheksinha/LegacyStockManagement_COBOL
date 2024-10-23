//CAT6850T JOB (BT0P,DY00),'ACAT: CRE RESCIND',CLASS=O,MSGCLASS=W,              
//         SCHENV=STREAMT,                                                      
//         USER=BT0P,PRTY=9,                                                    
//  SECLABEL=BISG                                                               
//*NODAFF BALANCEO                                                              
//*JOBAFF BALANCEO                                                              
//*                                                                             
//CA11STEP EXEC CA11                                                            
//*                                                                             
//STEP10  EXEC CAT685,                                                          
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//             HNB=BTTT                                                         
//CAT685.STEPLIB   DD                                                           
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
