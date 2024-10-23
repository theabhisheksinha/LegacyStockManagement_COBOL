//CAT6601I JOB (BI0P,DY00),'ACATS MFRS MF TRAN',CLASS=1,MSGCLASS=W,             
//         SCHENV=STREAMI,                                                      
//        USER=BI0P,PRTY=15,                                                    
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//STEP1   EXEC CAT659,                                                          
//             STREAM=I,                                                        
//             HNB=BIII,                                                        
//             HNB1=BIII                                                        
//STEP2   EXEC CAT660,                                                          
//             HNB1='BIII',               *O/P .CAT660.ACATPEND   GDG *         
//             HNB2='BIII',               *O/P .CAT660.ACATPENS   GDG *         
//             HNB3='BIII',               *O/P .CAT660.BNWTRAN    GDG *         
//             HNB4='BIII',               *I/P .CAT650DB.ACATPEND GDG *         
//             GEN00A='(+1)',             *I/P .CAT659.ACATPEND   GDG *         
//             HNO1='SI.III',             *I/P .BNW50.NTWREGOP    VSAM*         
//             HNO2='BNAIII',             *I/P .BNA34.NAFILE      VSAM*         
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//             HNO3='SI.III'                                                    
//CAT660.STEPLIB   DD                                                           
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
