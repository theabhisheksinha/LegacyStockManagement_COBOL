//CAT6602Y JOB (BY0P,DY00),'ACATS DST/MF TRAN',CLASS=1,MSGCLASS=W,              
//         SCHENV=STREAMY,                                                      
//        USER=BY0P,PRTY=15,                                                    
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//CAT660P EXEC CAT660P,                                                         
//             STREAM=Y,                                                        
//             HNB3='BYYY',               *O/P .CAT660.BNWTRAN    GDG *         
//             HNB4='BZZZ',               *I/P .CAT650DB.ACATSHAD GDG *         
//             HNO1='S3.YYY',             *I/P .BNW50.NTWREGOP    VSAM*         
//             HNO2='BNAYYY',             *I/P .BNA34.NAFILE      VSAM*         
//             HNO3='S3.YYY',             *I/P .MFRS.MFRRNM       VSAM*         
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP'    *DB2                                  
//CAT660P.STEPLIB   DD                                                          
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
//CAT660P.IPEND   DD  DSN=&HNB4..CAT650DB.ACATFNDS&GEN00A,DISP=SHR              
//CAT660P.NSCCIN  DD  DSN=BSSS.CAT502.NSCCFL(0),DISP=SHR                        
//         DD  DSN=BSSS.CAT502.NSCCFL(-1),DISP=SHR                              
//         DD  DSN=BSSS.CAT502.NSCCFL(-2),DISP=SHR                              
//         DD  DSN=BSSS.CAT502.NSCCFL(-3),DISP=SHR                              
//         DD  DSN=BSSS.CAT502.NSCCFL(-4),DISP=SHR                              
