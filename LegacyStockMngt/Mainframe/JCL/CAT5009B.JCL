//CAT5009B JOB (BB0P,DY00),'ACAT NSCC EXTRACT',                                 
//         SCHENV=STREAMB,                                                      
//             CLASS=2,MSGCLASS=W,USER=BB0P,PRTY=15,                            
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
//             HNB=BBBB,                                                        
//             HNB1=SB.BBB,                                                     
//             HNB2=BBBB,                *O/P CAT500.ACATACT          *         
//             HNO=BB,                                                          
//             PLAN='ACTBTCH',                                                  
//             STRM1=B,                                                         
//             STRM2=BBB,                                                       
//             STRM3=CAT500                                                     
//CAT500.STEPLIB  DD                                                            
//         DD                                                                   
//         DD  DSN=&DB2SYS..SDSNEXIT,DISP=SHR                                   
//         DD  DSN=&DB2SYS1..SDSNLOAD,DISP=SHR                                  
//CAT501.STEPLIB  DD                                                            
//         DD                                                                   
//         DD  DSN=&DB2SYS..SDSNEXIT,DISP=SHR                                   
//         DD  DSN=&DB2SYS1..SDSNLOAD,DISP=SHR                                  
