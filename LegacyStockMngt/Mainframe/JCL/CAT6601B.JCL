//CAT6601B JOB (BB0P,DY00),'ACATS MFRS MF TRAN',CLASS=1,MSGCLASS=W,             
//         SCHENV=STREAMB,                                                      
//        USER=BB0P,PRTY=15,                                                    
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//STEP1   EXEC CAT659,                                                          
//             STREAM=B,                                                        
//             HNB=BBBB,                                                        
//             HNB1=BBBB                                                        
//STEP2   EXEC CAT660,                                                          
//             HNB1='BBBB',               *O/P .CAT660.ACATPEND   GDG *         
//             HNB2='BBBB',               *O/P .CAT660.ACATPENS   GDG *         
//             HNB3='BBBB',               *O/P .CAT660.BNWTRAN    GDG *         
//             HNB4='BBBB',               *I/P .CAT650DB.ACATPEND GDG *         
//             GEN00A='(+1)',             *I/P .CAT659.ACATPEND   GDG *         
//             HNO1='SB.BBB',             *I/P .BNW50.NTWREGOP    VSAM*         
//             HNO2='BNABBB',             *I/P .BNA34.NAFILE      VSAM*         
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//             HNO3='SB.BBB'                                                    
//CAT660.STEPLIB   DD                                                           
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
