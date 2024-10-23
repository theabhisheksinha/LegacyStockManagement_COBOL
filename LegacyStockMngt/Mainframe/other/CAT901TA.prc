//CAT901TA PROC PARMFR=063,PARMTO=166                                           
//*-------------------------------------------------------------------*         
//* THE FOLLOWING PROGRAM WILL COPY CLIENT 63 QA P2 RECS TO CLIENT 166          
//*    IN THE T STREAM.                                                         
//*-------------------------------------------------------------------*         
//CAT901TA  EXEC PGM=CAT901TA,PARM='&PARMFR,&PARMTO'                            
//STEPLIB DD DSN=ADP.DATELIB,DISP=SHR                                           
//*                                                                             
//ITACFROM DD  DSN=BQQQ.CAT820.TACTL(0),                       I/P              
//             DISP=SHR                                                         
//ITACORIG DD  DSN=BTTT.CAT820.TACTL(0),                       I/P              
//             DISP=SHR                                                         
//OUTTACT  DD  DSN=BTTT.CAT820.TACTL(+2),                      O/P              
//             DISP=(NEW,CATLG,DELETE),                                         
//             UNIT=BATCH,                                                      
//             SPACE=(CYL,(1,2),RLSE),                                          
//             DCB=(RECFM=VB,LRECL=8004)                                        
//*                                                                             
//SYSOUT    DD SYSOUT=*                                                         
//SYSPRINT  DD SYSOUT=*                                                         
//SYSUDUMP  DD SYSOUT=Y                                                         
//SYSABOUT  DD SYSOUT=Y                                                         
