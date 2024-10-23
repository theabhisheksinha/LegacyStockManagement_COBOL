//CAT5009S JOB (BS0P,0000),'ACAT NSCC EXTRACT',CLASS=2,MSGCLASS=W,              
//         USER=BS0P,SCHENV=STREAMS,SECLABEL=BISG,PRTY=15                       
//*NODNOT SYSTEMCD                                                              
//*JOBNOT SYSTEMCD                                                              
//**********************************************************************        
//CA11STEP EXEC CA11                                                            
//**********************************************************************        
//STEP10  EXEC CAT500,                                                          
//             B1FIL='BZZZ.B1FL.PROD',                                          
//             CARDLIB='BISG.CARDLIB',                                          
//             DB2SYS='DB2PROD.GROUP',                                          
//             DB2SYS1='DB2PROD.GROUP',                                         
//             HNB=BSSS,                                                        
//             HNB1=S3.YYY,                                                     
//             HNB2=BSSS,                *O/P CAT500.ACATACT          *         
//             HNO=BB,                                                          
//             PLAN='ACTBTCH',                                                  
//             STRM1=S,                                                         
//             STRM2=SSS,                                                       
//             STRM3=CAT500                                                     
//CAT500.STEPLIB  DD                                                            
//         DD                                                                   
//         DD  DSN=&DB2SYS..SDSNEXIT,DISP=SHR                                   
//         DD  DSN=&DB2SYS1..SDSNLOAD,DISP=SHR                                  
//CAT501.STEPLIB  DD                                                            
//         DD                                                                   
//         DD  DSN=&DB2SYS..SDSNEXIT,DISP=SHR                                   
//         DD  DSN=&DB2SYS1..SDSNLOAD,DISP=SHR                                  
