//CAT5000X JOB (BX0P,DY00),'ACAT NSCC EXTRACT',USER=BX0P,                       
//         SCHENV=STREAMX,                                                      
//             CLASS=2,MSGCLASS=W,PRTY=15,                                      
//  SECLABEL=BISG                                                               
//*NODNOT SYSTEMD                                                               
//*JOBNOT SYSTEMD                                                               
//**********************************************************************        
//CA11    EXEC CA11                                                             
//**********************************************************************        
//STEP10  EXEC CAT500,                                                          
//             B1FIL='BZZZ.B1FL.PROD',                                          
//             CARDLIB='BISG.CARDLIB',                                          
//             DB2SYS='DB2PROD.GROUP',                                          
//             DB2SYS1='DB2PROD.GROUP',                                         
//             HNB=BXXX,                                                        
//             HNB1=S2.XXX,                                                     
//             HNB2=BXXX,                *O/P CAT500.ACATACT          *         
//             HNO=BB,                                                          
//             PLAN='ACTBTCH',                                                  
//             STRM1=X,                                                         
//             STRM2=XXX,                                                       
//             STRM3=CAT500                                                     
//CAT500.STEPLIB  DD                                                            
//         DD                                                                   
//         DD  DSN=&DB2SYS..SDSNEXIT,DISP=SHR                                   
//         DD  DSN=&DB2SYS1..SDSNLOAD,DISP=SHR                                  
//CAT501.STEPLIB  DD                                                            
//         DD                                                                   
//         DD  DSN=&DB2SYS..SDSNEXIT,DISP=SHR                                   
//         DD  DSN=&DB2SYS1..SDSNLOAD,DISP=SHR                                  
