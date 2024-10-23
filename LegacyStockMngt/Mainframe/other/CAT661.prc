//CAT661   PROC HNB1=,                                                          
//             HNB=,                                                            
//             GEN0='(0)',                                                      
//             CAT661=,                                                         
//             CARDLIB='BISG.CARDLIB',                                          
//             B1HDR='BZZZ.B1FL',                                               
//             UNIT=BATCH,                                                      
//             RUNDATE=                                                         
//*                                                                             
//*                                                                             
//CAT661   EXEC PGM=CAT661&CAT661,                                              
//             REGION=4096K                                                     
//STEPLIB  DD DSN=&RUNDATE.ADP.DATELIB,                                         
//             DISP=SHR                                                         
//         DD DSN=TCH.EZPLUS.LOADLIB,                                           
//             DISP=SHR                                                         
//REJTAB   DD  DSN=&CARDLIB.(CAT661RJ),                                         
//             DISP=SHR                                                         
//B1FIL    DD  DSN=&B1HDR,                                                      
//             DISP=SHR                                                         
//IPENS    DD  DSN=&HNB1..CAT660.ACATPENS&GEN0,                                 
//             DISP=SHR                                                         
//PRTFLE   DD  DSN=&HNB..CAT661.ACTRPT.TMP,                                     
//             DISP=(,CATLG,DELETE),                                            
//             UNIT=&UNIT,SPACE=(CYL,(5,5),RLSE),                               
//             DCB=(RECFM=FB,LRECL=133)                                         
//EZTVFM   DD SPACE=(CYL,(10,20),RLSE),                                         
//             UNIT=SYSDA                                                       
//SYSOUT   DD SYSOUT=*                                                          
//SYSPRINT DD SYSOUT=*                                                          
//SYSUDUMP DD SYSOUT=Y                                                          
//SYSSNAP  DD SYSOUT=Y                                                          
