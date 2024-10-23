//CAT6601X JOB (BX0P,DY00),'ACATS MFRS MF TRAN',USER=BX0P,CLASS=1,              
//         SCHENV=STREAMX,                                                      
//             MSGCLASS=W,                                                      
//         PRTY=15,                                                             
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//STEP1   EXEC CAT659,                                                          
//             STREAM=X,                                                        
//             HNB=BXXX,                                                        
//             HNB1=BXXX                                                        
//STEP2   EXEC CAT660,                                                          
//             HNB1='BXXX',               *O/P .CAT660.ACATPEND   GDG *         
//             HNB2='BXXX',               *O/P .CAT660.ACATPENS   GDG *         
//             HNB3='BXXX',               *O/P .CAT660.BNWTRAN    GDG *         
//             HNB4='BXXX',               *I/P .CAT650DB.ACATPEND GDG *         
//             GEN00A='(+1)',             *I/P .CAT659.ACATPEND   GDG *         
//             HNO1='S2.XXX',             *I/P .BNW50.NTWREGOP    VSAM*         
//             HNO2='BNAXXX',             *I/P .BNA34.NAFILE      VSAM*         
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//             HNO3='S2.XXX'                                                    
//CAT660.STEPLIB   DD                                                           
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
