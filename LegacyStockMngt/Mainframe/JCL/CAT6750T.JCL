//CAT6750T JOB (BT0P,DY00),'ACATS P2 A000928 ',CLASS=O,MSGCLASS=W,              
//         USER=BT0P,SECLABEL=BISG,SCHENV=STREAMT,PRTY=9                        
//*NODAFF BALANCEO                                                              
//*JOBAFF BALANCEO                                                              
//CA11    EXEC CA11                                                             
//**                                                                            
//STEP10  EXEC CAT675,                                                          
//             CL=T,                      * CLIENT STREAM             *         
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//             HNB='BTTT',                *O/P .CAT675.AIPP2       GDG*         
//             HNB1='BB.TTT',             *I/P .BSU40.SRMAS       VSAM*         
//             HNB2='BTTT'                *I/P .CAT610.ACCTDEL     GDG*         
//CAT675.STEPLIB   DD                                                           
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
