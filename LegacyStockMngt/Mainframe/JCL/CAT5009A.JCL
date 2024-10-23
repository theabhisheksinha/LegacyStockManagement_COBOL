//CAT5009A JOB (BA0P,DY00),'ACAT NSCC EXTRACT',                                 
//         SCHENV=STREAMA,                                                      
//             CLASS=2,MSGCLASS=W,USER=BA0P,PRTY=15,                            
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
//             HNB=BAAA,                                                        
//             HNB1=S1.AAA,                                                     
//             HNB2=BAAA,                *O/P CAT500.ACATACT          *         
//             HNO=BB,                                                          
//             PLAN='ACTBTCH',                                                  
//             STRM1=A,                                                         
//             STRM2=AAA,                                                       
//             STRM3=CAT500                                                     
//CAT500.STEPLIB  DD                                                            
//         DD                                                                   
//         DD  DSN=&DB2SYS..SDSNEXIT,DISP=SHR                                   
//         DD  DSN=&DB2SYS1..SDSNLOAD,DISP=SHR                                  
//CAT501.STEPLIB  DD                                                            
//         DD                                                                   
//         DD  DSN=&DB2SYS..SDSNEXIT,DISP=SHR                                   
//         DD  DSN=&DB2SYS1..SDSNLOAD,DISP=SHR                                  
