//CAT6601J JOB (BJ0P,DY00),'ACATS MFRS MF TRAN',CLASS=1,MSGCLASS=W,             
//         SCHENV=STREAMJ,                                                      
//        USER=BJ0P,PRTY=15,                                                    
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//STEP1   EXEC CAT659,                                                          
//             STREAM=J,                                                        
//             HNB=BJJJ,                                                        
//             HNB1=BJJJ                                                        
//STEP2   EXEC CAT660,                                                          
//             HNB1='BJJJ',               *O/P .CAT660.ACATPEND   GDG *         
//             HNB2='BJJJ',               *O/P .CAT660.ACATPENS   GDG *         
//             HNB3='BJJJ',               *O/P .CAT660.BNWTRAN    GDG *         
//             HNB4='BJJJ',               *I/P .CAT650DB.ACATPEND GDG *         
//             GEN00A='(+1)',             *I/P .CAT659.ACATPEND   GDG *         
//             HNO1='SJ.JJJ',             *I/P .BNW50.NTWREGOP    VSAM*         
//             HNO2='BNAJJJ',             *I/P .BNA34.NAFILE      VSAM*         
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//             HNO3='SJ.JJJ'                                                    
//CAT660.STEPLIB   DD                                                           
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
