//*********************************************************************         
//*  PROC CAT732R IS USED IN JOB CAT732R*                             *         
//*********************************************************************         
//CAT732R PROC STREAM=Z,                  *JOB STREAM                 *         
//             B1HDR='BZZZ.B1FL',         *I/P B1 VSAM FILE           *         
//             CARDLIB='BISG.CARDLIB',    *DB2 PLAN CARDLIB           *         
//             DB2SYS='DB2PROD',          *DB2 SYSTEM DB2PROD/DB2TEST *         
//             PLAN='ACTBTCH',            *DB2 PLAN CARDLIB MEMBER    *         
//             GDG='GDG,',                *O/P &HNB.CAT732R.RSPI      *         
//             GENP='(+1)',               *O/P &HNB.CAT732R.RSPI      *         
//             HNB='BZZZ',                *O/P &HNB.CAT732R.RSPI   GDG*         
//             MSDPRE='BB.ZZZ',           *MSD FILE PREFIX BB/QSYAV   *         
//             MSDSUF='.DUPE',            *MSD FILE SUFFIX .DUPE/BLANK*         
//             MSDCLT='BB.ZZZ.BMS90.MSDCLT.DUPE',  MSD SINGLE CLIENT  *         
//             REGSIZE=4M,                                                      
//             RUNDATE=,                                                        
//             SPACE='(CYL,(10,10),RLSE)', *O/P &HNB.CAT732R.RSPI  GDG*         
//             UNIT='BATCH'                *O/P &HNB.CAT732R.RSPI  GDG*         
//*                                                                             
//*********************************************************************         
//*      CAT732R - ACATS RESTRICTED SECURITY REPORT                   *         
//*********************************************************************         
//*                                                                             
//CAT732R EXEC PGM=CAT732R,                                                     
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
//B1FIL     DD DSN=&B1HDR,                                     I/P              
//             DISP=SHR                                                         
//FIDMSD   DD  DSN=&MSDPRE..BMS90.MSDFILE&MSDSUF,              I/P              
//             DISP=SHR,                                                        
//             AMP='BUFNI=50,BUFND=90'                                          
//FIDXRF   DD  DSN=&MSDPRE..BMS90.MSDXRF&MSDSUF,               I/P              
//             DISP=SHR,                                                        
//             AMP='BUFNI=50,BUFND=90'                                          
//FIDCLT    DD DSN=&MSDCLT,                                    I/P              
//             DISP=SHR,                                                        
//             AMP=('BUFNI=8,BUFND=4')                                          
//REPT      DD DSN=&HNB..CAT732R.RSPI&GENP,                    O/P              
//             DISP=(NEW,CATLG,DELETE),                                         
//             SPACE=&SPACE,                                                    
//             UNIT=&UNIT,                                                      
//             DCB=(&GDG.DSORG=PS,RECFM=FB,LRECL=143)                           
//SYSOUT    DD SYSOUT=*                                                         
//SYSPRINT  DD SYSOUT=*                                                         
//SYSUDUMP  DD SYSOUT=Y                                                         
//SYSABOUT  DD SYSOUT=Y                                                         
//*                                                                             
