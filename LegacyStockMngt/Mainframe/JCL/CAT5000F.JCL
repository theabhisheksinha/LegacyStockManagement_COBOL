//CAT5000F JOB (BF0P,DY00),'ACAT NSCC EXTRACT',                                 
//         SCHENV=STREAMF,                                                      
//             CLASS=2,MSGCLASS=W,USER=BF0P,PRTY=15,                            
//  SECLABEL=BISG                                                               
//*NODNOT SYSTEMD                                                               
//*JOBNOT SYSTEMD                                                               
//**********************************************************************        
//CA11    EXEC CA11                                                             
//**********************************************************************        
//*-------------------------------------------------------------------*         
//* THE FOLLOWING PROC FROM SSR 54901 CHANGES THE RECEIVER ACCOUNT NBR          
//* TO THE ORIGINAL VALUE ON THE REJECT TRANSFER FOR CLIENT 6 ONLY.             
//* THIS IS TEMPORARY FOR SEVERAL MONTHS FOLLOWING THE CONVERSION.              
//*-------------------------------------------------------------------*         
//STEP05  EXEC CAT500C,                                                         
//             CARDLIB='BISG.CARDLIB',                                          
//             DB2SYS='DB2PROD.GROUP',                                          
//             DB2SYS1='DB2PROD.GROUP',                                         
//             HNB=BFFF,                                                        
//             PLAN='ACTBTCH'                                                   
//CAT500C.STEPLIB  DD                                                           
//         DD                                                                   
//         DD  DSN=&DB2SYS..SDSNEXIT,DISP=SHR                                   
//         DD  DSN=&DB2SYS1..SDSNLOAD,DISP=SHR                                  
//CAT500CV.STEPLIB  DD                                                          
//         DD                                                                   
//         DD  DSN=&DB2SYS..SDSNEXIT,DISP=SHR                                   
//         DD  DSN=&DB2SYS1..SDSNLOAD,DISP=SHR                                  
//STEP10  EXEC CAT500,                                                          
//             B1FIL='BZZZ.B1FL.PROD',                                          
//             CARDLIB='BISG.CARDLIB',                                          
//             DB2SYS='DB2PROD.GROUP',                                          
//             DB2SYS1='DB2PROD.GROUP',                                         
//             HNB=BFFF,                                                        
//             HNB1=SF.FFF,                                                     
//             HNB2=BFFF,                *O/P CAT500.ACATACT          *         
//             HNO=BB,                                                          
//             PLAN='ACTBTCH',                                                  
//             STRM1=F,                                                         
//             STRM2=FFF,                                                       
//             STRM3=CAT500                                                     
//CAT500.STEPLIB  DD                                                            
//         DD                                                                   
//         DD  DSN=&DB2SYS..SDSNEXIT,DISP=SHR                                   
//         DD  DSN=&DB2SYS1..SDSNLOAD,DISP=SHR                                  
//CAT501.STEPLIB  DD                                                            
//         DD                                                                   
//         DD  DSN=&DB2SYS..SDSNEXIT,DISP=SHR                                   
//         DD  DSN=&DB2SYS1..SDSNLOAD,DISP=SHR                                  
