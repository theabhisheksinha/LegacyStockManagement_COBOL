//CAT5009Y JOB (BY0P,DY00),'ACAT NSCC EXTRACT',USER=BY0P,                       
//         SCHENV=STREAMY,                                                      
//             CLASS=2,MSGCLASS=W,PRTY=15,                                      
//  SECLABEL=BISG                                                               
//*NODNOT SYSTEMCD                                                              
//*JOBNOT SYSTEMCD                                                              
//**********************************************************************        
//CA11    EXEC CA11                                                             
//**********************************************************************        
//STEP10  EXEC CAT500,                                                          
//             B1FIL='BZZZ.B1FL.PROD',                                          
//             CARDLIB='BISG.CARDLIB',                                          
//             DB2SYS='DB2PROD.GROUP',                                          
//             DB2SYS1='DB2PROD.GROUP',                                         
//             HNB=BYYY,                                                        
//             HNB1=S3.YYY,                                                     
//             HNB2=BYYY,                *O/P CAT500.ACATACT          *         
//             HNO=BB,                                                          
//             PLAN='ACTBTCH',                                                  
//             STRM1=Y,                                                         
//             STRM2=YYY,                                                       
//             STRM3=CAT500                                                     
//CAT500.STEPLIB  DD                                                            
//         DD                                                                   
//         DD  DSN=&DB2SYS..SDSNEXIT,DISP=SHR                                   
//         DD  DSN=&DB2SYS1..SDSNLOAD,DISP=SHR                                  
//CAT501.STEPLIB  DD                                                            
//         DD                                                                   
//         DD  DSN=&DB2SYS..SDSNEXIT,DISP=SHR                                   
//         DD  DSN=&DB2SYS1..SDSNLOAD,DISP=SHR                                  
