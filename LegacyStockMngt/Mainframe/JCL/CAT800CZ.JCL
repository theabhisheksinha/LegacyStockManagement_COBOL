//CAT800CZ JOB (BP00,DY00),'ACATS CLIENT 10/210',CLASS=1,MSGCLASS=W,            
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//********PRTY=13                                                               
//CA11    EXEC CA11                                                             
//STEP05  EXEC CATEXT10,                                                        
//             HNB=BZZZ,                                                        
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//             PLAN='ACTBTCH',            *DB2 PLAN CARDLIB MEMBER    *         
//             PRTCL1='*',                                                      
//             PRTCL2='Y',                                                      
//             REGSIZE=8M                                                       
//CATEXT10.STEPLIB   DD                                                         
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
//CATEXT10.EXTR DD SPACE=(CYL,(1000,40),RLSE)                                   
