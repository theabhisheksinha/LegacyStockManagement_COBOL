//CAT7600H JOB (BH0P,DY00),'ACAT REVIEW RPT',CLASS=1,MSGCLASS=W,                
//         SCHENV=STREAMH,                                                      
//        USER=BH0P,                                                            
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11,                                                            
//             RMSPARM=P                                                        
//CAT760  EXEC CAT760,                    *STREAM IND                 *         
//             ABND='Y',                  *STREAM IND                 *         
//             B1HDR='BZZZ.B1FL',         *DB2 SYSTEM DB2PROD/DB2TEST *         
//             CARDLIB='BISG.CARDLIB',    *DB2 PLAN CARDLIB MEMBER    *         
//             CL=H,                                                            
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//             HNB=BHHH,                                                        
//             MSDPRE='BB.ZZZ',                                                 
//             MSDSUF='.DUPE',                                                  
//             PRTCL1='*',                                                      
//             PRTCL2='Y',                                                      
//             REGSIZE=8M,                                                      
//             RUNDATE=                                                         
//CAT760.STEPLIB   DD                                                           
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
