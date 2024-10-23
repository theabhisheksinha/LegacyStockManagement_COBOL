//CAT760  PROC HNB=,                      *O/P REPORT FILE            *         
//             B1HDR='BZZZ.B1FL',         *I/P B1 VSAM FILE           *         
//             ABND='Y',                  *USE 'N' TO BYPASS USER ABND*         
//             CARDLIB='BISG.CARDLIB',    *DB2 PLAN CARDLIB           *         
//             DB2SYS='DB2PROD',          *DB2 SYSTEM DB2PROD/DB2TEST *         
//             DB2SYS1='SYS1',            *DB2 SYSTEM DB2PROD/DB2TEST *         
//             PLAN='ACTBTCH',            *DB2 PLAN CARDLIB MEMBER    *         
//             MSDPRE='BB.ZZZ',           *MSD FILE PREFIX BB/QSYAV   *         
//             MSDSUF='.DUPE',            *MSD FILE SUFFIX .DUPE/BLANK*         
//             MSDCLT='BB.ZZZ.BMS90.MSDCLT.DUPE',  MSD SINGLE CLIENT  *         
//             PRTCL1='*',                                                      
//             PRTCL2='Y',                                                      
//             REGSIZE=8M,                                                      
//             RUNDATE=                                                         
//*                                                                             
//*********************************************************************         
//*                                                                   *         
//* ACAT REVIEW AND REVIEW ADJUST TRANSFER                            *         
//*                                                                   *         
//*********************************************************************         
//*                                                                             
//CAT760  EXEC PGM=CAT760,                                                      
//             PARM='&CL&ABND',                                                 
//             REGION=&REGSIZE                                                  
//STEPLIB   DD DSN=&RUNDATE.ADP.DATELIB,                                        
//             DISP=SHR                                                         
//          DD DSN=DBSYS.CAF.LOADLIB,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS..DSNEXIT,                                            
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS1..SDSNLOAD,                                          
//             DISP=SHR                                                         
//AFFOPCA   DD DSN=OPCA.AFFCARD,                               *FOR DB2         
//             DISP=SHR                                                         
//DSNPLAN   DD DSN=&CARDLIB(&PLAN),                            *FOR DB2         
//             DISP=SHR                                                         
//B1FIL     DD DSN=&B1HDR,                                          I/P         
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
//REPORT   DD  DSN=&HNB..CAT760.RPTPI(+1),                          O/P         
//             DISP=(NEW,CATLG,DELETE),                                         
//             UNIT=BATCH,                                                      
//             SPACE=(CYL,(30,30),RLSE),                                        
//             DCB=(GDG,DSORG=PS,RECFM=FBA,LRECL=143)                           
//*                                                                             
//SYSOUT    DD SYSOUT=&PRTCL1                                                   
//SYSPRINT  DD SYSOUT=&PRTCL1                                                   
//SYSUDUMP  DD SYSOUT=&PRTCL2                                                   
//SPIESNAP  DD SYSOUT=&PRTCL2                                                   
//SYSABOUT  DD SYSOUT=&PRTCL2                                                   
//SORTWK01 DD  UNIT=SYSDA,                                                      
//             SPACE=(CYL,(30,30),RLSE)                                         
//SORTWK02 DD  UNIT=SYSDA,                                                      
//             SPACE=(CYL,(30,30),RLSE)                                         
//SORTWK03 DD  UNIT=SYSDA,                                                      
//             SPACE=(CYL,(30,30),RLSE)                                         
//SORTWK04 DD  UNIT=SYSDA,                                                      
//             SPACE=(CYL,(30,30),RLSE)                                         
