//CAT993A PROC INFILE='RCV',                                                    
//       B1FL='BZZZ.B1FL',                                                      
//       RPTID='RCV',                                                           
//       PLY='Y',                                                               
//       HNB=BZZZ,                                                              
//       UNIT=BATCH                                                             
//CAT993A EXEC PGM=CAT993                                                       
//STEPLIB  DD DSN=ADP.DATELIB,DISP=SHR                                          
//B1FIL    DD DSN=&B1FL,DISP=SHR                                                
//INFILE   DD DSN=&INFILE,DISP=SHR                                              
//OUTFILE  DD DSN=&HNB..CAT993.&RPTID.PI(+1),DISP=(,CATLG,DELETE),              
//  UNIT=&UNIT,SPACE=(CYL,(5,5),RLSE),DCB=GDG                                   
//SYSOUT   DD SYSOUT=*                                                          
//SYSUDUMP DD SYSOUT=&PLY                                                       
//********* END OF PROCEDURE                                                    
