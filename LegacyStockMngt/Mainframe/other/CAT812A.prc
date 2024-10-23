//CAT812A PROC STREAM=A,                  * STREAM INDICATOR          *         
//             BYP1=0,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=0,                    * 1=BYPASS FILE CHECK       *         
//             RERUN=0,                   * 1=THIS IS A RERUN         *         
//             B1HDR='BZZZ.B1FL',         *I/P B1 VSAM FILE           *         
//             CARDLIB='BISG.CARDLIB',    *DB2 PLAN CARDLIB           *         
//             DB2SYS='DB2PROD',          *DB2 SYSTEM DB2PROD/DB2TEST *         
//             DB2SYS1='DB2PROD',         *DB2 SYSTEM DB2PROD/DB2TEST *         
//             PLAN='ACTBTCH',            *DB2 PLAN CARDLIB MEMBER    *         
//             GDGA='GDG,',               *O/P .CAT812A.ACATRCRF      *         
//             GENP1A='(+1)',             *O/P .CAT812A.ACATRCRF      *         
//             GEN='(0)',                 *I/P .CAMMF.LIQUID          *         
//             HNB1='S1.AAA',             *I/P .MGR35.CUSBAL     VSAM *         
//             HNB2='S1.AAA',             *I/P .MGR25.CUSHOL     VSAM *         
//             HNB3='S1.AAA',             *I/P .BSU40.MRGIMM     VSAM *         
//             HNB4='BAAA',               *O/P .CAT812A.ACATRCRF  GDG *         
//             HNB5='BZZZ',               *I/P .CATMMF.LIQUID     GDG *         
//             MSDPRE='BB.ZZZ',           *MSD FILE PREFIX BB/QSYAV   *         
//             MSDSUF='.DUPE',            *MSD FILE SUFFIX .DUPE/BLANK*         
//             MSDCLT='BB.ZZZ.BMS90.MSDCLT.DUPE',  MSD SINGLE CLIENT  *         
//             NAV='BNAAAA',              *I/P .BNA34.NAFILEA    VSAM *         
//             PRTCL1='*',                                                      
//             PRTCL2='Y',                                                      
//             REGSIZE=8M,                                                      
//             RUNDATE=,                                                        
//             SPACE1='(CYL,(50,10),RLSE)', *O/P .CAT812A.ACATRCRF GDG*         
//             UNIT='BATCH'                                                     
//*                                                                             
//*********************************************************************         
//* CAT812A- READ TRANSFER HISTORY DB2 TABLE FOR SETTLE CLOSE STATUS  *         
//* EXTRACT BALANCES AND POSITIONS FOR RESIDUAL CREDITS               *         
//* OUTPUT FILE FEEDS CAT812                                          *         
//*********************************************************************         
//*                                                                             
//CAT812A EXEC PGM=CAT812A,                                                     
//             PARM='&STREAM&BYP1&BYP2&RERUN',                                  
//             REGION=&REGSIZE                                                  
//STEPLIB   DD DSN=&RUNDATE.ADP.DATELIB,                                        
//             DISP=SHR                                                         
//          DD DSN=DBSYS.CAF.LOADLIB,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS..SDSNEXIT,                                           
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
//NAFILEA   DD DSN=&NAV..BNA34.NAFILEA,                             I/P         
//             DISP=SHR,                                                        
//             AMP='BUFNI=50,BUFND=90'                                          
//NAFILEI   DD DSN=&NAV..BNA34.NAFILEI,                             I/P         
//             DISP=SHR,                                                        
//             AMP='BUFNI=50,BUFND=90'                                          
//MMFFL     DD DSN=&HNB5..CATMMF.LIQUID&GEN,                        I/P         
//             DISP=SHR                                                         
//CUSBALV  DD  DSN=&HNB1..MGR35.CUSBAL,                             I/P         
//             DISP=SHR,                                                        
//             AMP='BUFNI=50,BUFND=90'                                          
//CUSHOLV   DD DSN=&HNB2..MGR25.CUSHOL,                             I/P         
//             DISP=SHR,                                                        
//             AMP='BUFNI=50,BUFND=90'                                          
//MRGIMM    DD DSN=&HNB3..BSU40.MRGIMM,                             I/P         
//             DISP=SHR,                                                        
//             AMP='BUFNI=50,BUFND=90'                                          
//ACATRCRF  DD DSN=&HNB4..CAT812A.ACATRCRF&GENP1A,                  O/P         
//             DISP=(NEW,CATLG,DELETE),                                         
//             SPACE=&SPACE1,                                                   
//             UNIT=&UNIT,                                                      
//             DCB=(&GDGA.DSORG=PS,LRECL=600,RECFM=FB,BLKSIZE=27600)            
//SORTLIB   DD DSN=SYS1.SORTLIB,                                                
//             DISP=SHR                                                         
//SORTWK01  DD UNIT=SYSDA,                                                      
//             SPACE=(CYL,(50,50),RLSE)                                         
//SORTWK02  DD UNIT=SYSDA,                                                      
//             SPACE=(CYL,(50,50),RLSE)                                         
//SORTWK03  DD UNIT=SYSDA,                                                      
//             SPACE=(CYL,(50,50),RLSE)                                         
//SORTWK04  DD UNIT=SYSDA,                                                      
//             SPACE=(CYL,(50,50),RLSE)                                         
//SORTWK05  DD UNIT=SYSDA,                                                      
//             SPACE=(CYL,(50,50),RLSE)                                         
//SORTLIST  DD SYSOUT=*                                                         
//SYSOUT    DD SYSOUT=&PRTCL1                                                   
//SYSPRINT  DD SYSOUT=&PRTCL1                                                   
//SYSUDUMP  DD SYSOUT=&PRTCL2                                                   
//SPIESNAP  DD SYSOUT=&PRTCL2                                                   
//SYSABOUT  DD SYSOUT=&PRTCL2                                                   
//*                                                                             
