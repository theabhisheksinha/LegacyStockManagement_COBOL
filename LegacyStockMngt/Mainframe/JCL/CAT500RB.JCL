//CAT500RB JOB (BB0P,DY00),'ACAT NSCC REPORTS',                                 
//         SCHENV=STREAMB,                                                      
//             CLASS=1,MSGCLASS=W,USER=BB0P,PRTY=15,                            
//  SECLABEL=BISG                                                               
//*NODAFF VALANCE1                                                              
//*JOBAFF VALANCE1                                                              
//**********************************************************************        
//CA11    EXEC CA11                                                             
//**********************************************************************        
//*STEP10 RUNS CAT500R PGM TO CREATE FUND REGISTRATION RPT FOR RECEIVER*        
//**********************************************************************        
//STEP10  EXEC CAT500R,                                                         
//             B1FIL='BZZZ.B1FL',                                               
//             CARDLIB='BISG.CARDLIB',                                          
//             CAT500=R,                                                        
//             HNB=BBBB,                                                        
//             NAV=BNABBB,                                                      
//             PLAN='ACTBTCH',                                                  
//             DB2SYS='DB2PROD.GROUP',                                          
//             DB2SYS1='DB2PROD.GROUP',                                         
//             RUNDATE=                                                         
//CAT500R.STEPLIB  DD                                                           
//         DD                                                                   
//         DD  DSN=&DB2SYS..SDSNEXIT,DISP=SHR                                   
//         DD  DSN=&DB2SYS1..SDSNLOAD,DISP=SHR                                  
//**********************************************************************        
//*STEP20 RUNS CAT500R PGM TO CREATE MUTAL FUNDS PRT FOR DELIVERER     *        
//**********************************************************************        
//STEP20  EXEC CAT500R,                                                         
//             B1FIL='BZZZ.B1FL',                                               
//             CARDLIB='BISG.CARDLIB',                                          
//             CAT500=D,                                                        
//             DB2SYS='DB2PROD.GROUP',                                          
//             DB2SYS1='DB2PROD.GROUP',                                         
//             HNB=BBBB,                                                        
//             NAV=BNABBB,                                                      
//             PLAN='ACTBTCH',                                                  
//             RUNDATE=                                                         
//CAT500R.STEPLIB  DD                                                           
//         DD                                                                   
//         DD  DSN=&DB2SYS..SDSNEXIT,DISP=SHR                                   
//         DD  DSN=&DB2SYS1..SDSNLOAD,DISP=SHR                                  
