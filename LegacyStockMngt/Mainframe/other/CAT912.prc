//CAT912 PROC RUNDATE=,HNB=BZZZ,UNIT=BATCH                                      
//*                                                                             
//BR1410  EXEC PGM=IEFBR14                                                      
//DD1 DD DISP=(MOD,DELETE,DELETE),SPACE=(TRK,(1,1)),                            
//       DSN=&HNB..NSCC.MMRO3                                                   
//*                                                                             
//CAT912 EXEC PGM=CAT912                                                        
//STEPLIB  DD  DSN=&RUNDATE.ADP.DATELIB,DISP=SHR                                
//*                                                                             
//S103FILE DD  DSN=BZZZ.SIAC103.CAT.ACTVTYBU(0),DISP=SHR                        
//NSCCFILE DD  DSN=&HNB..NSCC.MMRO3,                                            
//      DISP=(,CATLG,DELETE),                                                   
//      UNIT=&UNIT,SPACE=(CYL,(50,50),RLSE),                                    
//      DCB=(LRECL=4004,RECFM=VB,BLKSIZE=27998)                                 
//SYSABOUT DD  SYSOUT=Y                                                 00004*1 
//SYSOUT   DD  SYSOUT=*                                                         
//SYSUDUMP DD  SYSOUT=Y                                                         
//**** END OF PROC                                                              
