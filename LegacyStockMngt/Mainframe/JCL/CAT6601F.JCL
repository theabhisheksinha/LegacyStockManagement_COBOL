//CAT6601F JOB (BF0P,DY00),'ACATS MFRS MF TRAN',CLASS=1,MSGCLASS=W,             
//         SCHENV=STREAMF,                                                      
//        USER=BF0P,PRTY=15,                                                    
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//STEP1   EXEC CAT659,                                                          
//             STREAM=F,                                                        
//             HNB=BFFF,                                                        
//             HNB1=BFFF                                                        
//STEP2   EXEC CAT660,                                                          
//             HNB1='BFFF',               *O/P .CAT660.ACATPEND   GDG *         
//             HNB2='BFFF',               *O/P .CAT660.ACATPENS   GDG *         
//             HNB3='BFFF',               *O/P .CAT660.BNWTRAN    GDG *         
//             HNB4='BFFF',               *I/P .CAT650DB.ACATPEND GDG *         
//             GEN00A='(+1)',             *I/P .CAT659.ACATPEND   GDG *         
//             HNO1='SF.FFF',             *I/P .BNW50.NTWREGOP    VSAM*         
//             HNO2='BNAFFF',             *I/P .BNA34.NAFILE      VSAM*         
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//             HNO3='SF.FFF'                                                    
//CAT660.STEPLIB   DD                                                           
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
