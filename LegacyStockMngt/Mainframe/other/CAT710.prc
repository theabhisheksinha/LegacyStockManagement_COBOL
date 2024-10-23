//CAT710  PROC STREAM=Z,                  * CAT710 PARM BATCH STREAM  *         
//             DATECHK=0,                 * 1 = BYPASS DATE CHECK     *         
//             ACATPOSN='BZZZ.SIAC0718.ACAT.POSN(0)',         * INPUT *         
//             B1HDR='BZZZ.B1FL',                                               
//             CARDLIB='BISG.CARDLIB',    * DB2                       *         
//             DB2SYS='DB2PROD',          * DB2PROD/DB2TEST/DB2QA     *         
//             PLAN='ACTBTCH',            * DB2                       *         
//             MSDPRE='BB.ZZZ',           *MSD FILE PREFIX BB/QSYAV   *         
//             MSDSUF='.DUPE',            *MSD FILE SUFFIX .DUPE/BLANK*         
//             MSDCLT='BB.ZZZ.BMS90.MSDCLT.DUPE',  MSD SINGLE CLIENT  *         
//             PRNGFL='M13C.ZZZ.PRNG.PRNGFL',                                   
//             REG=4M,                                                          
//             DUMP=Y,                                                          
//             RUNDATE=                                                         
//*                                                                             
//CAT710  EXEC PGM=CAT710,PARM=&STREAM&DATECHK,REGION=&REG                      
//STEPLIB   DD DSN=&RUNDATE.ADP.DATELIB,DISP=SHR                                
//          DD DSN=DBSYS.CAF.LOADLIB,DISP=SHR                                   
//          DD DSN=&DB2SYS..GROUP.SDSNEXIT,DISP=SHR                             
//          DD DSN=&DB2SYS..GROUP.SDSNLOAD,DISP=SHR                             
//AFFOPCA   DD DSN=OPCA.AFFCARD,DISP=SHR                                        
//DSNPLAN   DD DSN=&CARDLIB(&PLAN),DISP=SHR                                     
//B1FIL     DD DSN=&B1HDR,DISP=SHR                                              
//FIDMSD   DD  DSN=&MSDPRE..BMS90.MSDFILE&MSDSUF,                   I/P         
//             DISP=SHR,                                                        
//             AMP='BUFNI=50,BUFND=90'                                          
//FIDXRF   DD  DSN=&MSDPRE..BMS90.MSDXRF&MSDSUF,                    I/P         
//             DISP=SHR,                                                        
//             AMP='BUFNI=50,BUFND=90'                                          
//FIDCLT    DD DSN=&MSDCLT,                                         I/P         
//             DISP=SHR,                                                        
//             AMP=('BUFNI=8,BUFND=4')                                          
//MSDISIN  DD  DSN=BB.ZZZ.BDV03.MSDISIN.DUPE,DISP=SHR,              I/P         
//             AMP='BUFND=180,BUFNI=3'                                          
//MSDISXF  DD  DSN=POVZ.PMSD.BDV03.MSDISXF,DISP=SHR,                I/P         
//             AMP='BUFND=180,BUFNI=3'                                          
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
//*                                                                             
