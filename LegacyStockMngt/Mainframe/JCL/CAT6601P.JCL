//CAT6601P JOB (BP0P,DY00),'ACATS MFRS MF TRAN',CLASS=1,MSGCLASS=W,             
//         SCHENV=STREAMP,                                                      
//        USER=BP0P,PRTY=15,                                                    
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//STEP1   EXEC CAT659,                                                          
//             STREAM=P,                                                        
//             HNB=BPPP,                                                        
//             HNB1=BPPP                                                        
//STEP2   EXEC CAT660,                                                          
//             HNB1='BPPP',               *O/P .CAT660.ACATPEND   GDG *         
//             HNB2='BPPP',               *O/P .CAT660.ACATPENS   GDG *         
//             HNB3='BPPP',               *O/P .CAT660.BNWTRAN    GDG *         
//             HNB4='BPPP',               *I/P .CAT650DB.ACATPEND GDG *         
//             GEN00A='(+1)',             *I/P .CAT659.ACATPEND   GDG *         
//             HNO1='SP.PPP',             *I/P .BNW50.NTWREGOP    VSAM*         
//             HNO2='BNAPPP',             *I/P .BNA34.NAFILE      VSAM*         
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//             HNO3='SP.PPP'                                                    
//CAT660.STEPLIB   DD                                                           
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
