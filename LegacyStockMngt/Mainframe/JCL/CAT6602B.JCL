//CAT6602B JOB (BB0P,DY00),'ACATS DST/MF TRAN',CLASS=1,MSGCLASS=W,              
//         SCHENV=STREAMB,                                                      
//        USER=BB0P,                                                            
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//CAT660P EXEC CAT660P,                                                         
//             STREAM=B,                                                        
//             HNB3='BBBB',               *O/P .CAT660.BNWTRAN    GDG *         
//             HNB4='BZZZ',               *I/P .CAT650DB.ACATFNDS GDG *         
//             HNO1='SB.BBB',             *I/P .BNW50.NTWREGOP    VSAM*         
//             HNO2='BNABBB',             *I/P .BNA34.NAFILE      VSAM*         
//             HNO3='SB.BBB',             *I/P .MFRS.MFRRNM       VSAM*         
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP'    *DB2                                  
//CAT660P.STEPLIB   DD                                                          
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
//CAT660P.IPEND   DD  DSN=&HNB4..CAT650DB.ACATFNDS&GEN00A,DISP=SHR              
//CAT660P.NSCCIN  DD  DSN=BBBB.CAT502.NSCCFL(0),DISP=SHR                        
//         DD  DSN=BBBB.CAT502.NSCCFL(-1),DISP=SHR                              
//         DD  DSN=BBBB.CAT502.NSCCFL(-2),DISP=SHR                              
//         DD  DSN=BBBB.CAT502.NSCCFL(-3),DISP=SHR                              
//         DD  DSN=BBBB.CAT502.NSCCFL(-4),DISP=SHR                              
