//CAT6601T JOB (BT0P,DY00),'ACATS MFRS MF TRAN',CLASS=O,MSGCLASS=W,             
//         SCHENV=STREAMT,                                                      
//        USER=BT0P,PRTY=9,                                                     
//  SECLABEL=BISG                                                               
//*NODAFF BALANCEO                                                              
//*JOBAFF BALANCEO                                                              
//JOBLIB DD DSN=BTTT.ADP.DATELIB,DISP=SHR                                       
//PROCLIB DD DSN=BISG.T3.PROCLIB,DISP=SHR                                       
//CA11    EXEC CA11                                                             
//STEP1   EXEC CAT659,                                                          
//             STREAM=T,                                                        
//             HNB=BTTT,                                                        
//             HNB1=BTTT                                                        
//STEP2   EXEC CAT660,                                                          
//             HNB1='BTTT',               *O/P .CAT660.ACATPEND   GDG *         
//             HNB2='BTTT',               *O/P .CAT660.ACATPENS   GDG *         
//             HNB3='BTTT',               *O/P .CAT660.BNWTRAN    GDG *         
//             HNB4='BTTT',               *I/P .CAT650DB.ACATPEND GDG *         
//             GEN00A='(+1)',             *I/P .CAT659.ACATPEND   GDG *         
//             HNO1='S1.TTT',             *I/P .BNW50.NTWREGOP    VSAM*         
//             HNO2='BNATTT',             *I/P .BNA34.NAFILE      VSAM*         
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//             HNO3='S1.TTT'                                                    
//CAT660.STEPLIB   DD                                                           
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
