//CAT914 PROC RUNDATE=,HNB=BZZZ,UNIT=BATCH                                      
//*                                                                             
//BR1410  EXEC PGM=IEFBR14                                                      
//DD1 DD DISP=(MOD,DELETE,DELETE),SPACE=(TRK,(1,1)),                            
//       DSN=&HNB..NSCC.PMRO                                                    
//*                                                                             
//CAT914 EXEC PGM=CAT914                                                        
//STEPLIB  DD  DSN=&RUNDATE.ADP.DATELIB,DISP=SHR                                
//*                                                                             
//P103FILE DD  DSN=BZZZ.SIAC103.CAT.ACTVTYBU(-1),DISP=SHR                       
//S103FILE DD  DSN=BZZZ.SIAC103.CAT.ACTVTYBU(0),DISP=SHR                        
//NSCCFILE DD  DSN=&HNB..NSCC.PMRO,                                             
//      DISP=(,CATLG,DELETE),                                                   
//      UNIT=&UNIT,SPACE=(CYL,(5,5),RLSE)                                       
//SYSABOUT DD  SYSOUT=Y                                                 00004*1 
//SYSOUT   DD  SYSOUT=*                                                         
//SYSUDUMP DD  SYSOUT=Y                                                         
//**** END OF PROC                                                              
