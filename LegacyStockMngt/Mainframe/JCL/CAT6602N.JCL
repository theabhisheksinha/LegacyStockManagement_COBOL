//CAT6602N JOB (BN1P,DY00),'ACATS DST/MF TRAN',CLASS=1,MSGCLASS=W,              
//         SCHENV=STREAMN,                                                      
//        USER=BN1P,                                                            
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//CAT660P EXEC CAT660P,                                                         
//             STREAM=N,                                                        
//             HNB3='BNNN',               *O/P .CAT660.BNWTRAN    GDG *         
//             HNB4='BZZZ',               *I/P .CAT650DB.ACATSHAD GDG *         
//             HNO1='SN.NNN',             *I/P .BNW50.NTWREGOP    VSAM*         
//             HNO2='BNANNN',             *I/P .BNA34.NAFILE      VSAM*         
//             HNO3='SN.NNN',             *I/P .MFRS.MFRRNM       VSAM*         
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP'    *DB2                                  
//CAT660P.STEPLIB   DD                                                          
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
//CAT660P.IPEND   DD  DSN=&HNB4..CAT650DB.ACATFNDS&GEN00A,DISP=SHR              
//CAT660P.NSCCIN  DD  DSN=BNNN.CAT502.NSCCFL(0),DISP=SHR                        
//         DD  DSN=BNNN.CAT502.NSCCFL(-1),DISP=SHR                              
//         DD  DSN=BNNN.CAT502.NSCCFL(-2),DISP=SHR                              
//         DD  DSN=BNNN.CAT502.NSCCFL(-3),DISP=SHR                              
//         DD  DSN=BNNN.CAT502.NSCCFL(-4),DISP=SHR                              
