//CAT820CV PROC HNB=,                                                           
//             GEN0='(0)',                                                      
//             UNIT=BATCH,                                                      
//             RUNDATE=                                                         
//*                                                                             
//CAT820CV EXEC PGM=CAT820CV,                                                   
//             REGION=4096K                                                     
//STEPLIB  DD DSN=&RUNDATE.ADP.DATELIB,                                         
//             DISP=SHR                                                         
//         DD DSN=TCH.EZPLUS.LOADLIB,                                           
//             DISP=SHR                                                         
//FILEA    DD  DSN=&HNB..CAT820.RET&GEN0,                                       
//             DISP=SHR                                                         
//FILE2    DD  DSN=&HNB..CAT820.RET(+1),                                        
//             DISP=(,CATLG,DELETE),                                            
//             UNIT=&UNIT,SPACE=(CYL,(5,5),RLSE),                               
//             DCB=(RECFM=VB,LRECL=644)                                         
//EZTVFM   DD SPACE=(CYL,(10,20),RLSE),                                         
//             UNIT=SYSDA                                                       
//SYSOUT   DD SYSOUT=*                                                          
//SYSPRINT DD SYSOUT=*                                                          
//SYSUDUMP DD SYSOUT=Y                                                          
//SYSSNAP  DD SYSOUT=Y                                                          
