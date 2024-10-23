//CAT876  PROC HNB='BFFF',                                              03/04/24
//             B1HDR='BZZZ.B1FL',                                       CAT838  
//             GENP='(+1)',                                             CAT838  
//             UNIT=BATCH,                                              CAT838  
//             BYPASS='N',                                              CAT838  
//             DUMP=Y,                                                  CAT838  
//             RUNDATE=                                                 CAT838  
//*                                                                     CAT838  
//CAT876  EXEC PGM=CAT876,                                                      
//             PARM='&BYPASS'                                                   
//STEPLIB   DD DSN=&RUNDATE.ADP.DATELIB,DISP=SHR                                
//B1FIL     DD DSN=&B1HDR,DISP=SHR                                              
//B204IN    DD DSN=&HNB..BPU50.B204(0),DISP=SHR                                 
//IMFPEND   DD DSN=&HNB..CAT660.ACATPEND(-0),DISP=SHR                           
//MFACTAN   DD DSN=&HNB..CAT876.TRANS&GENP,DISP=(,CATLG,DELETE),                
//    UNIT=&UNIT,SPACE=(CYL,(5,5),RLSE),DCB=GDG                                 
//SYSOUT    DD SYSOUT=*                                                         
//SYSUDUMP  DD SYSOUT=&DUMP                                                     
//*                                                                             
//CAT876A EXEC PGM=CAT876A                                                      
//STEPLIB   DD DSN=&RUNDATE.ADP.DATELIB,DISP=SHR                                
//B1FIL     DD DSN=&B1HDR,DISP=SHR                                              
//IMFPEND   DD DSN=&HNB..CAT876.TRANS&GENP,DISP=OLD                             
//CBALINQ   DD DSN=&HNB..MGR02.CUSBAL(0),                                       
//             DISP=SHR                                                         
//OBALRPT   DD DSN=&&DETRPT,DISP=(,PASS,DELETE),                                
//    UNIT=SYSDA,SPACE=(CYL,(5,5),RLSE)                                         
//ODETRPT   DD DSN=&&DETRPT,DISP=(,PASS,DELETE),                                
//    UNIT=SYSDA,SPACE=(CYL,(5,5),RLSE)                                         
//OMFREPT   DD DSN=&HNB..CAT876.REPRT&GENP,DISP=(,CATLG,DELETE),                
//    UNIT=&UNIT,SPACE=(CYL,(5,5),RLSE),DCB=GDG                                 
//SYSOUT    DD SYSOUT=*                                                         
//SYSUDUMP  DD SYSOUT=&DUMP                                                     
//*** EDN OF PROC                                                               
