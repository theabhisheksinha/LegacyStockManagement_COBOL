//*-------------------------------------------------------------------*         
//* THE FOLLOWING PROGRAM WILL COPY CLIENT 63 QA P2 RECS TO CLIENT 166          
//*    IN THE T STREAM.                                                         
//*-------------------------------------------------------------------*         
//CAT901BK  EXEC PGM=CAT901BK,PARM='063,166'                                    
//STEPLIB DD DSN=ADP.DATELIB,DISP=SHR                                           
//*                                                                             
//INP2FROM DD  DSN=BQQQ.CAT650.P2IPT(0),                       I/P              
//             DISP=SHR                                                         
//INP2ORIG DD  DSN=BTTT.CAT650.P2IPT(+1),                      I/P              
//             DISP=SHR                                                         
//OUTP2    DD  DSN=BTTT.CAT650.P2IPT(+2),                      O/P              
//             DISP=(NEW,CATLG,DELETE),                                         
//             UNIT=BATCH,                                                      
//             SPACE=(CYL,(5,5),RLSE),                                          
//             DCB=(DSORG=PS,RECFM=FB,LRECL=120)                                
//*                                                                             
//SYSOUT    DD SYSOUT=*                                                         
//SYSPRINT  DD SYSOUT=*                                                         
//SYSUDUMP  DD SYSOUT=Y                                                         
//SYSABOUT  DD SYSOUT=Y                                                         
