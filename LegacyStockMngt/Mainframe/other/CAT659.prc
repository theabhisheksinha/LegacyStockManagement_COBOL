//CAT659   PROC HNB1=,                                                          
//             HNB2=BZZZ,                                                       
//             HNB=,                                                            
//             B1FIL='BZZZ.B1FL',                                               
//             STREAM=Z,                                                        
//             GENP='(+1)',                                                     
//             GEN0='(0)',                                                      
//             CAT659=,                                                         
//             PENDDMY=,                                                        
//             BYP1=0,         1 - BYPASS DATE CHECK                            
//             UNIT=BATCH,                                                      
//             RUNDATE='RERUN.EARLY.'                                           
//*                                                                             
//*                                                                             
//*********************************************************************         
//*  SPLIT THE EXTRACT FILE BY BATCH STREAM.                                    
//*********************************************************************         
//*                                                                             
//CAT650SP EXEC PGM=CAT650SP,                                                   
//             PARM=&STREAM                                                     
//*                                                                             
//B1FIL    DD  DSN=&B1FIL,                                    I/P               
//             DISP=SHR                                                         
//*                                                                             
//IPZZZ     DD  DSN=&HNB2..CAT650DB.ACATPEND&GEN0,            I/P               
//             DISP=SHR                                                         
//*                                                                             
//OPSTM1   DD DSN=&HNB1..CAT650DB.ACATPEND&GENP,                                
//         DISP=(,CATLG,DELETE),                                                
//         UNIT=&UNIT,                                                          
//         SPACE=(CYL,(5,5),RLSE),                                              
//         DCB=(GDG,RECFM=VB,LRECL=1004,BLKSIZE=27998)                          
//OPSTM2   DD DUMMY                                                             
//SYSOUT    DD SYSOUT=*                                                         
//SYSUDUMP  DD SYSOUT=Y                                                         
//SYSABOUT  DD SYSOUT=Y                                                         
//*                                                                             
//CAT659   EXEC PGM=CAT659&CAT659,PARM='&BYP1',                                 
//             REGION=4096K                                                     
//STEPLIB  DD DSN=&RUNDATE.ADP.DATELIB,                                         
//             DISP=SHR                                                         
//         DD DSN=TCH.EZPLUS.LOADLIB,                                           
//             DISP=SHR                                                         
//IPEND    DD  &PENDDMY.DSN=&HNB1..CAT660.ACATPEND&GEN0,                        
//             DISP=SHR                                                         
//PENDIN DD   DSN=&HNB1..CAT650DB.ACATPEND&GENP,                                
//             DISP=SHR                                                         
//OPEND    DD  DSN=&HNB..CAT659.ACATPEND&GENP,                                  
//             DISP=(,CATLG,DELETE),                                            
//             UNIT=&UNIT,SPACE=(CYL,(5,5),RLSE),                               
//             DCB=(GDG,RECFM=VB,LRECL=1004)                                    
//EZTVFM   DD SPACE=(CYL,(10,20),RLSE),                                         
//             UNIT=SYSDA                                                       
//SYSOUT   DD SYSOUT=*                                                          
//SYSPRINT DD SYSOUT=*                                                          
//SYSUDUMP DD SYSOUT=Y                                                          
//SYSSNAP  DD SYSOUT=Y                                                          
