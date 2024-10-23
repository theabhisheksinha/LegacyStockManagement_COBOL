//CAT6601U JOB (BU1P,DY00),'ACATS MFRS MF TRAN',CLASS=1,MSGCLASS=W,             
//         SCHENV=STREAMU,                                                      
//        USER=BU1P,PRTY=15,                                                    
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//STEP1   EXEC CAT659,                                                          
//             STREAM=U,                                                        
//             HNB=BUUU,                                                        
//             HNB1=BUUU                                                        
//STEP2   EXEC CAT660,                                                          
//             HNB1='BUUU',               *O/P .CAT660.ACATPEND   GDG *         
//             HNB2='BUUU',               *O/P .CAT660.ACATPENS   GDG *         
//             HNB3='BUUU',               *O/P .CAT660.BNWTRAN    GDG *         
//             HNB4='BUUU',               *I/P .CAT650DB.ACATPEND GDG *         
//             GEN00A='(+1)',             *I/P .CAT659.ACATPEND   GDG *         
//             HNO1='SU.UUU',             *I/P .BNW50.NTWREGOP    VSAM*         
//             HNO2='BNAUUU',             *I/P .BNA34.NAFILE      VSAM*         
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//             HNO3='SU.UUU'                                                    
//CAT660.STEPLIB   DD                                                           
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
