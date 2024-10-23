//CAT992 PROC INFILE='EOD',                                                     
//       B1FL='BZZZ.B1FL',                                                      
//       RPTID='EOD',                                                           
//       CYCLE='0',                                                             
//       PLY='Y',                                                               
//       HNB=BZZZ,                                                              
//       UNIT=BATCH,                                                            
//       PM992=' ',                                                             
//       CL992='XXXXX',   *** CLIENT EXTRACT CL###'                             
//       DMSK='X',        *** CREATE MASKED REPORT VERSION 'M'                  
//       DUMREG=,         *** CLIENT EXTRACT 'DUMMY,'                           
//       DUMCLT='DUMMY,'  *** CLIENT EXTRACT ''                                 
//CAT992  EXEC PGM=CAT992,PARM='&PM992.&CYCLE.&CL992.&DMSK'                     
//STEPLIB  DD DSN=ADP.DATELIB,DISP=SHR                                          
//B1FIL    DD DSN=&B1FL,DISP=SHR                                                
//INFILE   DD DSN=&INFILE,DISP=SHR                                              
//OUTFILE  DD &DUMREG.DSN=&HNB..CAT992.&RPTID.PI(+1),                           
//  DISP=(,CATLG,DELETE),                                                       
//  UNIT=&UNIT,SPACE=(CYL,(5,5),RLSE),DCB=GDG                                   
//OUTCLT   DD &DUMCLT.DSN=&HNB..CAT992.&CL992..&RPTID.PI(+1),                   
//  DISP=(,CATLG,DELETE),                                                       
//  UNIT=&UNIT,SPACE=(CYL,(5,5),RLSE),DCB=GDG                                   
//SYSOUT   DD SYSOUT=*                                                          
//SYSUDUMP DD SYSOUT=&PLY                                                       
//********* END OF PROCEDURE                                                    
