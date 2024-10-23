//CAT918 PROC RUNDATE=,HNB=BZZZ,UNIT=BATCH                                      
//*                                                                             
//BR1410  EXEC PGM=IEFBR14                                                      
//DD1 DD DISP=(MOD,DELETE,DELETE),SPACE=(TRK,(1,1)),                            
//       DSN=&HNB..NSCC.FRMRO                                                   
//*                                                                             
//CAT918 EXEC PGM=CAT918                                                        
//STEPLIB  DD  DSN=&RUNDATE.ADP.DATELIB,DISP=SHR                                
//*                                                                             
//MFRGFILE DD  DSN=BAAA.CAT14.AMFRFL(0),DISP=SHR                                
//  DD DSN=BBBB.CAT14.AMFRFL(0),DISP=SHR                                        
//  DD DSN=BIII.CAT14.AMFRFL(0),DISP=SHR                                        
//  DD DSN=BLLL.CAT14.AMFRFL(0),DISP=SHR                                        
//  DD DSN=BPPP.CAT14.AMFRFL(0),DISP=SHR                                        
//  DD DSN=BUUU.CAT14.AMFRFL(0),DISP=SHR                                        
//  DD DSN=BXXX.CAT14.AMFRFL(0),DISP=SHR                                        
//  DD DSN=BYYY.CAT14.AMFRFL(0),DISP=SHR                                        
//  DD DSN=BSSS.CAT14.AMFRFL(0),DISP=SHR                                        
//  DD DSN=BRRR.CAT14.AMFRFL(0),DISP=SHR                                        
//NSCCFILE DD  DSN=&HNB..NSCC.FRMRO,                                            
//         DISP=(,CATLG,DELETE),                                                
//         UNIT=&UNIT,SPACE=(CYL,(50,50),RLSE),                                 
//         DCB=(LRECL=3272,RECFM=VB,BLKSIZE=27998)                              
//SYSABOUT DD  SYSOUT=Y                                                 00004*1 
//SYSOUT   DD  SYSOUT=*                                                         
//SYSUDUMP DD  SYSOUT=Y                                                         
//**** END OF PROC                                                              
