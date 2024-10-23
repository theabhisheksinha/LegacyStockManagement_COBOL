//CAT5009H JOB (BH0P,DY00),'ACAT NSCC EXTRACT',                                 
//         SCHENV=STREAMH,                                                      
//             CLASS=2,MSGCLASS=W,USER=BH0P,PRTY=15,                            
//  SECLABEL=BISG                                                               
//*NODNOT SYSTEMCD                                                              
//*JOBNOT SYSTEMCD                                                              
//CA11    EXEC CA11,                                                            
//             RMSPARM=P                                                        
//STEP10  EXEC CAT500,                                                          
//             ATA=1400,                                                        
//             ATCD=1400,                                                       
//             B1FIL='BZZZ.B1FL.PROD',                                          
//             CARDLIB='BISG.CARDLIB',                                          
//             COND1=,                                                          
//             DB2SYS='DB2PROD.GROUP',                                          
//             DB2SYS1='DB2PROD.GROUP',                                         
//             DISP='(,CATLG,DELETE)',                                          
//             DUMMY=,                                                          
//             DUMMY2=,                                                         
//             DUMP=Y,                                                          
//             FRA=1600,                                                        
//             GDG='GDG,',                                                      
//             GENP='(+1)',                                                     
//             HNB=BHHH,                                                        
//             HNB1=SH.HHH,                                                     
//             HNB2=BHHH,                *O/P CAT500.ACATACT          *         
//             HNO=BB,                                                          
//             PLAN='ACTBTCH',                                                  
//             REG=2M,                                                          
//             RUNDATE=RERUN.EARLY.,                                            
//             STRM1=H,                                                         
//             STRM2=HHH,                                                       
//             STRM3=CAT500,                                                    
//             TIA=1200,                                                        
//             TIC=1600,                                                        
//             TIRD=1400,                                                       
//             TIRR=1600,                                                       
//             TIX=1600,                                                        
//             UNIT=BATCH                                                       
//CAT500.STEPLIB  DD                                                            
//         DD                                                                   
//         DD  DSN=&DB2SYS..SDSNEXIT,DISP=SHR                                   
//         DD  DSN=&DB2SYS1..SDSNLOAD,DISP=SHR                                  
//CAT501.STEPLIB  DD                                                            
//         DD                                                                   
//         DD  DSN=&DB2SYS..SDSNEXIT,DISP=SHR                                   
//         DD  DSN=&DB2SYS1..SDSNLOAD,DISP=SHR                                  
