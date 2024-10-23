//CAT6601Y JOB (BY0P,DY00),'ACATS MFRS MF TRAN',USER=BY0P,CLASS=1,              
//         SCHENV=STREAMY,                                                      
//             MSGCLASS=W,                                                      
//         PRTY=15,                                                             
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//STEP1   EXEC CAT659,                                                          
//             STREAM=Y,                                                        
//             HNB=BYYY,                                                        
//             HNB1=BYYY                                                        
//STEP2   EXEC CAT660,                                                          
//             HNB1='BYYY',               *O/P .CAT660.ACATPEND   GDG *         
//             HNB2='BYYY',               *O/P .CAT660.ACATPENS   GDG *         
//             HNB3='BYYY',               *O/P .CAT660.BNWTRAN    GDG *         
//             HNB4='BYYY',               *I/P .CAT650DB.ACATPEND GDG *         
//             GEN00A='(+1)',             *I/P .CAT659.ACATPEND   GDG *         
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//             HNO1='S3.YYY',             *I/P .BNW50.NTWREGOP    VSAM*         
//             HNO2='BNAYYY',             *I/P .BNA34.NAFILE      VSAM*         
//             HNO3='S3.YYY'                                                    
//CAT660.STEPLIB   DD                                                           
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
