//CAT812  PROC STREAM=A,                  * STREAM INDICATOR          *         
//             TABLFLE='SZ.ZZZ.TABLFLE',                                        
//             BYP1=0,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=0,                    * 1=BYPASS FILE CHECK       *         
//             RERUN=0,                   * 1=THIS IS A RERUN         *         
//             B1HDR='BZZZ.B1FL',         *I/P B1 VSAM FILE           *         
//             CARDLIB='BISG.CARDLIB',    *DB2 PLAN CARDLIB           *         
//             DB2SYS='DB2PROD',          *DB2 SYSTEM DB2PROD/DB2TEST *         
//             DB2SYS1='DB2PROD',         *DB2 SYSTEM DB2PROD/DB2TEST *         
//             PLAN='ACTBTCH',            *DB2 PLAN CARDLIB MEMBER    *         
//             GDGA='GDG,',               *O/P .CAT812.ACATRCRF       *         
//             GDGB='GDG,',               *O/P .CAT812.ACATDLVF       *         
//             GENP00='(+1)',             *I/P .CAT812A.ACATRCRF      *         
//             GENP1A='(+1)',             *O/P .CAT812.ACATRCRF       *         
//             GENP1B='(+1)',             *O/P .CAT812.ACATDLVF       *         
//             HNB1='BAAA',               *I/P .CAT812A.ACATRCRF  GDG *         
//             HNB2='S1.AAA',             *I/P .BNW50.NTWMAST    VSAM *         
//             HNB3='S1.AAA',             *I/P .BNW50.NTWREGOP   VSAM *         
//             HNB4='SZ.ZZZ',             *I/P .MFRS.MFMSD       VSAM *         
//             HNB5='BAAA',               *O/P .CAT812.ACATDLVF   GDG *         
//             HNB6='BAAA',               *O/P .CAT812.ACATRCRF   GDG *         
//             MSDPRE='BB.ZZZ',           *MSD FILE PREFIX BB/QSYAV   *         
//             MSDSUF='.DUPE',            *MSD FILE SUFFIX .DUPE/BLANK*         
//             MSDCLT='BB.ZZZ.BMS90.MSDCLT.DUPE',  MSD SINGLE CLIENT  *         
//             PRTCL1='*',                                                      
//             PRTCL2='Y',                                                      
//             REGSIZE=8M,                                                      
//             RUNDATE=,                                                        
//             SPACE1='(CYL,(10,10),RLSE)', *O/P .CAT812.ACATRCRF  GDG*         
//             SPACE2='(CYL,(10,10),RLSE)', *O/P .CAT812.ACATDLVF  GDG*         
//             UNIT1='BATCH',               *O/P .CAT812.ACATRCRF  GDG*         
//             UNIT2='BATCH'                *O/P .CAT812.ACATDLVF  GDG*         
//*                                                                             
//*********************************************************************         
//* CAT812 - LOAD RCR (RESIDUAL CREDIT) BASED ON INPUT FROM CAT812A   *         
//*********************************************************************         
//CAT812 EXEC PGM=CAT812,                                                       
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
//INFILE   DD  DSN=&HNB1..CAT812A.ACATRCRF&GENP00,                  I/P         
//             DISP=SHR                                                         
//BNWMAST  DD  DSN=&HNB2..BNW50.NTWMAST,                            I/P         
//             DISP=SHR,                                                        
//             AMP='BUFNI=50,BUFND=90'                                          
//BNWREGOP DD  DSN=&HNB2..BNW50.NTWREGOP,                           I/P         
//             DISP=SHR,                                                        
//             AMP='BUFNI=50,BUFND=90'                                          
//MFEXBR   DD  DSN=&HNB2..MFRS.MFEXBR,                              I/P         
//             DISP=SHR,                                                        
//             AMP='BUFNI=50,BUFND=90'                                          
//NTWMASTV DD  DSN=&HNB3..BNW50.NTWMAST,DISP=SHR,                   I/P         
//             AMP=('BUFND=2,BUFNI=15')                                         
//NTWTRANV DD  DSN=&HNB3..BNW50.NTWTRAN,DISP=SHR,                   I/P         
//             AMP=('BUFND=2,BUFNI=15')                                         
//NTWPENDV DD  DSN=&HNB3..MFRS.MFPEND,DISP=SHR,                     I/P         
//             AMP=('BUFND=2,BUFNI=15')                                         
//MFMSD    DD  DSN=&HNB4..MFRS.MFMSD,                               I/P         
//             DISP=SHR,                                                        
//             AMP='BUFNI=50,BUFND=90'                                          
//FIDMSD   DD  DSN=&MSDPRE..BMS90.MSDFILE&MSDSUF,                   I/P         
//             DISP=SHR,                                                        
//             AMP='BUFNI=50,BUFND=90'                                          
//FIDXRF   DD  DSN=&MSDPRE..BMS90.MSDXRF&MSDSUF,                    I/P         
//             DISP=SHR,                                                        
//             AMP='BUFNI=50,BUFND=90'                                          
//FIDCLT    DD DSN=&MSDCLT,                                         I/P         
//             DISP=SHR,                                                        
//             AMP=('BUFNI=8,BUFND=4')                                          
//TABLFLE  DD  DSN=&TABLFLE,                                        I/P         
//             DISP=SHR                                                         
//ACATRCRF DD  DSN=&HNB5..CAT812.ACATRCRF&GENP1A,                   O/P         
//             DISP=(NEW,CATLG,DELETE),                                         
//             SPACE=&SPACE1,                                                   
//             UNIT=&UNIT1,                                                     
//             DCB=(&GDGA.DSORG=PS,LRECL=600,RECFM=FB,BLKSIZE=27600)            
//ACATDLVF DD  DSN=&HNB6..CAT812.ACATDLVF&GENP1B,                   O/P         
//             DISP=(NEW,CATLG,DELETE),                                         
//             SPACE=&SPACE2,                                                   
//             UNIT=&UNIT2,                                                     
//             DCB=(&GDGB.DSORG=PS,LRECL=200,RECFM=FB,BLKSIZE=27800)            
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
