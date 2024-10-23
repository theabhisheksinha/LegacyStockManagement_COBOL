//CAT5009P JOB (BP0P,DY00),'ACAT NSCC EXTRACT',                                 
//         SCHENV=STREAMP,                                                      
//             CLASS=2,MSGCLASS=W,USER=BP0P,PRTY=15,                            
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
//             HNB=BPPP,                                                        
//             HNB1=SP.PPP,                                                     
//             HNB2=BPPP,                *O/P CAT500.ACATACT          *         
//             HNO=BB,                                                          
//             PLAN='ACTBTCH',                                                  
//             STRM1=P,                                                         
//             STRM2=PPP,                                                       
//             STRM3=CAT500                                                     
//CAT500.STEPLIB  DD                                                            
//         DD                                                                   
//         DD  DSN=&DB2SYS..SDSNEXIT,DISP=SHR                                   
//         DD  DSN=&DB2SYS1..SDSNLOAD,DISP=SHR                                  
//CAT501.STEPLIB  DD                                                            
//         DD                                                                   
//         DD  DSN=&DB2SYS..SDSNEXIT,DISP=SHR                                   
//         DD  DSN=&DB2SYS1..SDSNLOAD,DISP=SHR                                  
