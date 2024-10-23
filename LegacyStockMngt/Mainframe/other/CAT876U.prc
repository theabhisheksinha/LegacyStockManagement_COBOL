//CAT876  PROC HNB='BFFF',                                                      
//             HNB1='BZZZ',                                                     
//             PARM876='N ',                                                    
//             B1HDR='BZZZ.B1FL',                                               
//             GEN='(0)',                                                       
//             GENP='(+1)',                                                     
//             UNIT=BATCH,                                                      
//             DUMP=Y,                                                          
//             RUNDATE=                                                         
//*                                                                             
//CAT876U  EXEC PGM=CAT876U                                                     
//STEPLIB   DD DSN=&RUNDATE.ADP.DATELIB,DISP=SHR                                
//INFILE    DD DSN=&HNB1..SIAC0720.ACAT.FUND(0),DISP=SHR                        
//IMFACTAN  DD DSN=&HNB..CAT876.TRANS&GEN,DISP=SHR                              
//OMFACTAN  DD DSN=&HNB..CAT876U.TRANS&GENP,DISP=(,CATLG,DELETE),               
//    UNIT=&UNIT,SPACE=(CYL,(5,5),RLSE),DCB=GDG                                 
//SYSOUT    DD SYSOUT=*                                                         
//SYSUDUMP  DD SYSOUT=&DUMP                                                     
//*                                                                             
//CAT876A EXEC PGM=CAT876A,PARM='&PARM876'                                      
//STEPLIB   DD DSN=&RUNDATE.ADP.DATELIB,DISP=SHR                                
//B1FIL     DD DSN=&B1HDR,DISP=SHR                                              
//IMFPEND   DD DSN=&HNB..CAT876U.TRANS&GENP,DISP=OLD                            
//CBALINQ   DD DSN=&HNB..MGR02.CUSBAL(0),                                       
//             DISP=SHR                                                         
//OBALRPT   DD DSN=&&DETRPT,DISP=(,PASS,DELETE),                                
//    UNIT=SYSDA,SPACE=(CYL,(5,5),RLSE)                                         
//ODETRPT   DD DSN=&&DETRPT,DISP=(,PASS,DELETE),                                
//    UNIT=SYSDA,SPACE=(CYL,(5,5),RLSE)                                         
//OMFREPT   DD DSN=&HNB..CAT876.REPID&GENP,DISP=(,CATLG,DELETE),                
//    UNIT=&UNIT,SPACE=(CYL,(5,5),RLSE),DCB=GDG                                 
//SYSOUT    DD SYSOUT=*                                                         
//SYSUDUMP  DD SYSOUT=&DUMP                                                     
//*** EDN OF PROC                                                               
