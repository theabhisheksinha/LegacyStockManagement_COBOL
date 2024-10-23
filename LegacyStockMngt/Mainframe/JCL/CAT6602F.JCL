//CAT6602F JOB (BF0P,DY00),'ACATS PNC/MF TRAN',CLASS=1,MSGCLASS=W,              
//         SCHENV=STREAMF,                                                      
//        USER=BF0P,PRTY=15,                                                    
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//CAT660P EXEC CAT660P,                                                         
//             STREAM=F,                                                        
//             HNB3='BFFF',               *O/P .CAT660.BNWTRAN    GDG *         
//             HNB4='BZZZ',               *I/P .CAT650DB.ACATSHAD GDG *         
//             HNO1='SF.FFF',             *I/P .BNW50.NTWREGOP    VSAM*         
//             HNO2='BNAFFF',             *I/P .BNA34.NAFILE      VSAM*         
//             HNO3='SF.FFF',             *I/P .MFRS.MFRRNM       VSAM*         
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP'    *DB2                                  
//CAT660P.STEPLIB   DD                                                          
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
