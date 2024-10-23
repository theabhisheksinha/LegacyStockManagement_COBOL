//CAT710  PROC ACATPOSN='BZZZ.SIAC0718.ACAT.POSN(0)',         * INPUT *         
//             B1HDR='BZZZ.B1FL',                                               
//             CARDLIB='BISG.CARDLIB',    * DB2                       *         
//             DB2SYS='DB2PROD',          * DB2PROD/DB2TEST           *         
//             DB2SYS1='DB2PROD',         * DB2PROD/DB2TEST                     
//             PLAN='ACTBTCH',            * DB2                       *         
//             STREAM=Z,                  * CAT710 PARM BATCH SREAM   *         
//             RUNID='XX',                * USE WM FOR WEALTH MNGT    *         
//             MSDPRE='BB.ZZZ',           *MSD FILE PREFIX BB/QSYAV   *         
//             MSDSUF='.DUPE',            *MSD FILE SUFFIX .DUPE/BLANK*         
//             MSDINF='CM1.ZZZ.IDCAMS.MSDINF',                                  
//             MSDIDX='E05C.ZZZ.BMS15.INDXMSD',                                 
//             PRNGFL='M13C.ZZZ.PRNG.PRNGFL',                                   
//             REG=4M,                                                          
//             DUMP=Y,                                                          
//             RUNDATE=                                                         
//*                                                                             
//CAT710  EXEC PGM=CAT710WM,PARM='&STREAM&RUNID',REGION=&REG                    
//STEPLIB   DD DSN=&RUNDATE.ADP.DATELIB,DISP=SHR                                
//          DD DSN=DBSYS.CAF.LOADLIB,DISP=SHR                                   
//          DD DSN=&DB2SYS..SDSNEXIT,DISP=SHR                                   
//          DD DSN=&DB2SYS1..SDSNLOAD,DISP=SHR                                  
//AFFOPCA   DD DSN=OPCA.AFFCARD,DISP=SHR                                        
//DSNPLAN   DD DSN=&CARDLIB(&PLAN),DISP=SHR                                     
//B1FIL     DD DSN=&B1HDR,DISP=SHR                                              
//FIDMSD   DD  DSN=&MSDPRE..BMS90.MSDFILE&MSDSUF,                   I/P         
//             DISP=SHR,                                                        
//             AMP='BUFNI=50,BUFND=90'                                          
//FIDXRF   DD  DSN=&MSDPRE..BMS90.MSDXRF&MSDSUF,                    I/P         
//             DISP=SHR,                                                        
//             AMP='BUFNI=50,BUFND=90'                                          
//MSDINF   DD  DSN=&MSDINF,                                         I/P         
//             DISP=SHR,                                                        
//             AMP='BUFNI=50,BUFND=90'                                          
//MSDIDX   DD  DSN=&MSDIDX,                                         I/P         
//             DISP=SHR,                                                        
//             AMP='BUFNI=50,BUFND=90'                                          
//PRNGFL   DD  DSN=&PRNGFL,                                                     
//             DISP=SHR,                                                        
//             AMP='BUFNI=50,BUFND=90'                                          
//ACATPOSN  DD DSN=&ACATPOSN,DISP=SHR                               I/P         
//SYSOUT    DD SYSOUT=*                                                         
//ABENDAID  DD SYSOUT=&DUMP                                                     
//SYSPRINT  DD SYSOUT=&DUMP                                                     
//SYSUDUMP  DD SYSOUT=&DUMP                                                     
//SYSABOUT  DD SYSOUT=&DUMP                                                     
//SPIESNAP  DD SYSOUT=&DUMP                                                     
