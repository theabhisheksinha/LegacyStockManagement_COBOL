//CAT770  PROC B1HDR='BZZZ.B1FL.PROD',    *I/P B1 VSAM FILE            *        
//             CARDLIB='BISG.CARDLIB',    *DB2 PLAN CARDLIB           *         
//             DB2SYS='DB2PROD',          *DB2 SYSTEM DB2PROD/DB2TEST *         
//             GDG='GDG,',                *O/P BZZZ.CAT770.MFAPI       *        
//             GENM4='(-4)',              *I/P BZZZ.SIAC0716.ACAT.TRAN *        
//             GENM3='(-3)',              *I/P BZZZ.SIAC0716.ACAT.TRAN *        
//             GENM2='(-2)',              *I/P BZZZ.SIAC0716.ACAT.TRAN *        
//             GENM1='(-1)',              *I/P BZZZ.SIAC0716.ACAT.TRAN *        
//             GENM0='(+0)',              *I/P BZZZ.SIAC0716.ACAT.TRAN *        
//             GENP1='(+1)',              *O/P BZZZ.CAT770.MFAPI       *        
//             HNB1='BZZZ',               *O/P BZZZ.CAT770.MFAPI   GDG *        
//             INFILE='BZZZ.SIAC0716.ACAT.TRAN',                                
//             MSDPRE='BB.ZZZ',           *MSD FILE PREFIX BB/QSYAV   *         
//             MSDSUF='.DUPE',            *MSD FILE SUFFIX .DUPE/BLANK*         
//             MSDCLT='BB.ZZZ.BMS90.MSDCLT.DUPE',  MSD SINGLE CLIENT  *         
//             PLAN='ACTBTCH',            *DB2 PLAN CARDLIB MEMBER    *         
//             REGSIZE=8M,                                                      
//             RUNDATE='RERUN.EARLY.',                                          
//             SPACE='(CYL,(1,1),RLSE)',                                        
//             STREAM=Z,                  *JOB STREAM                 *         
//             UNIT='BATCH'                                                     
//*                                                                             
//CAT770  EXEC PGM=CAT770,                                                      
//             PARM=&STREAM,                                                    
//             REGION=&REGSIZE                                                  
//STEPLIB   DD DSN=&RUNDATE.ADP.DATELIB,                                        
//             DISP=SHR                                                         
//          DD DSN=DBSYS.CAF.LOADLIB,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS..GROUP.SDSNEXIT,                                     
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS..GROUP.SDSNLOAD,                                     
//             DISP=SHR                                                         
//AFFOPCA   DD DSN=OPCA.AFFCARD,                               *FOR DB2         
//             DISP=SHR                                                         
//DSNPLAN   DD DSN=&CARDLIB(&PLAN),                            *FOR DB2         
//             DISP=SHR                                                         
//B1FIL    DD  DSN=&B1HDR,                                          I/P         
//             DISP=SHR                                                         
//FIDMSD   DD  DSN=&MSDPRE..BMS90.MSDFILE&MSDSUF,                   I/P         
//             DISP=SHR,                                                        
//             AMP='BUFNI=50,BUFND=90'                                          
//FIDXRF   DD  DSN=&MSDPRE..BMS90.MSDXRF&MSDSUF,                    I/P         
//             DISP=SHR,                                                        
//             AMP='BUFNI=50,BUFND=90'                                          
//FIDCLT    DD DSN=&MSDCLT,                                         I/P         
//             DISP=SHR,                                                        
//             AMP=('BUFNI=8,BUFND=4')                                          
//INFILE   DD  DSN=&INFILE&GENM4,DISP=SHR                           I/P         
//         DD  DSN=&INFILE&GENM3,DISP=SHR                           I/P         
//         DD  DSN=&INFILE&GENM2,DISP=SHR                           I/P         
//         DD  DSN=&INFILE&GENM1,DISP=SHR                           I/P         
//         DD  DSN=&INFILE&GENM0,DISP=SHR                           I/P         
//REPTFILE DD  DSN=&HNB1..CAT770.MFAPI&GENP1,                       O/P         
//             DISP=(NEW,CATLG,DELETE),                                         
//             SPACE=&SPACE,                                                    
//             UNIT=&UNIT,                                                      
//             DCB=(&GDG.DSORG=PS,RECFM=FB,LRECL=143)                           
//SYSOUT   DD  SYSOUT=*                                                         
//SYSPRINT DD  SYSOUT=*                                                         
//SYSUDUMP DD  SYSOUT=Y                                                         
//SYSABOUT DD  SYSOUT=Y                                                         
//CEEDUMP  DD  SYSOUT=Y,CHARS=GT15                                              
