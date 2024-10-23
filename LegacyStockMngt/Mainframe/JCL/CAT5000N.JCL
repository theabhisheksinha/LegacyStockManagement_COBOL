//CAT5000N JOB (BN1P,DAC0),'ACAT NSCC EXTRACT',                                 
//         SCHENV=STREAMN,                                                      
//             CLASS=2,MSGCLASS=W,USER=BN1P,PRTY=15,                            
//  SECLABEL=BISG                                                               
//*NODNOT SYSTEMD                                                               
//*JOBNOT SYSTEMD                                                               
//**********************************************************************        
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
//             HNB=BNNN,                                                        
//             HNB1=SN.NNN,                                                     
//             HNB2=BNNN,                *O/P CAT500.ACATACT          *         
//             HNO=BB,                                                          
//             PLAN='ACTBTCH',                                                  
//             REG=2M,                                                          
//             RUNDATE='RERUN.EARLY.',                                          
//             STRM1=N,                                                         
//             STRM2=NNN,                                                       
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
