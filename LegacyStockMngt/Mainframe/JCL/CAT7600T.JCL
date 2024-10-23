//CAT7600T JOB (BT0P,DY00),'ACAT REVIEW RPT',CLASS=O,MSGCLASS=W,                
//         SCHENV=STREAMT,                                                      
//        USER=BT0P,PRTY=9,                                                     
//  SECLABEL=BISG                                                               
//*NODAFF BALANCEO                                                              
//*JOBAFF BALANCEO                                                              
//CA11    EXEC CA11                                                             
//CAT760  EXEC CAT760,                                                          
//             HNB=BTTT,                  *STREAM IND                 *         
//             CL=T,                      *STREAM IND                 *         
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//             PLAN='ACTBTCH'             *DB2 PLAN CARDLIB MEMBER    *         
//CAT760.STEPLIB   DD                                                           
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
