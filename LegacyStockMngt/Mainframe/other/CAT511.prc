//CAT511  PROC STREAM='Z',                * STREAM INDICATOR          *         
//             BYP1=0,                    * 1=BYPASS CYCLE NBR CHECK  *         
//             BYP2=0,                    * 1=BYPASS DATE CHECK       *         
//             BYP3=0,                    * 1=BYPASS FILE CHECK       *         
//             B1HDR='BZZZ.B1FL.PROD',    *I/P B1 VSAM FILE           *         
//             GDGA='GDG,',               *O/P .CAT511.ACATTRNS       *         
//             GDGB='GDG,',               *O/P .CAT511.CYCLELOG       *         
//             GEN00A='(+0)',             *I/P .CAT510.ACATTRAN       *         
//             GEN00B='(+0)',             *I/P .CAT511.CYCLELOG       *         
//             GENP1A='(+1)',             *O/P .CAT511.ACATTRNS       *         
//             GENP1B='(+1)',             *O/P .CAT511.CYCLELOG       *         
//             HNB1='BZZZ',               *I/P .CAT510.ACATTRAN   GDG *         
//             HNB2='BAAA',               *I/P .CAT511.CYCLELOG   GDG *         
//             HNB3='BAAA',               *O/P .CAT511.ACATTRNS   GDG *         
//             HNB4='BAAA',               *O/P .CAT511.CYCLELOG   GDG *         
//             WM=,                       * WM FOR WEALTH MNGT RUN    *         
//             UNIT='BATCH',                                                    
//             PRTCL1='*',                                                      
//             PRTCL2='Y',                                                      
//             REGSIZE=8M,                                                      
//             RUNDATE='RERUN.EARLY.',                                          
//             SPACE1='(CYL,(30,30),RLSE)', *O/P .CAT511.ACATTRNS GDG *         
//             SPACE2='(TRK,(1,1),RLSE)'    *O/P .CAT511.CYCLELOG GDG *         
//*                                                                             
//*********************************************************************         
//*                                                                   *         
//* EXTRACT NSCC/SIAC ACATS MULTI-CYCLE TRANSACTION MRO (M FILE)      *         
//*         FOR CLIENTS IN THIS STREAM                                *         
//*                                                                   *         
//*********************************************************************         
//*                                                                             
//CAT511  EXEC PGM=CAT511,                                                      
//             PARM='&STREAM&BYP1&BYP2&BYP3',                                   
//             REGION=&REGSIZE                                                  
//STEPLIB  DD  DSN=&RUNDATE.ADP.DATELIB,                                        
//             DISP=SHR                                                         
//B1FIL    DD  DSN=&B1HDR,                                          I/P         
//             DISP=SHR                                                         
//INFILE   DD  DSN=&HNB1..CAT510.&WM.ACATTRAN&GEN00A,               I/P         
//             DISP=SHR                                                         
//INLOG    DD  DSN=&HNB2..CAT511.&WM.CYCLELOG&GEN00B,               I/P         
//             DISP=SHR                                                         
//OUTFILE  DD  DSN=&HNB3..CAT511.&WM.ACATTRNS&GENP1A,               O/P         
//             DISP=(NEW,CATLG,DELETE),                                         
//             SPACE=&SPACE1,                                                   
//             UNIT=&UNIT,                                                      
//             DCB=(&GDGA.DSORG=PS,LRECL=3330,RECFM=VB,BLKSIZE=27998)           
//OUTLOG   DD  DSN=&HNB4..CAT511.&WM.CYCLELOG&GENP1B,               O/P         
//             DISP=(NEW,CATLG,DELETE),                                         
//             SPACE=&SPACE2,                                                   
//             UNIT=&UNIT,                                                      
//             DCB=(&GDGB.DSORG=PS,LRECL=200,RECFM=FB,BLKSIZE=27800)            
//SYSOUT   DD  SYSOUT=&PRTCL1                                                   
//SYSPRINT DD  SYSOUT=&PRTCL1                                                   
//SYSUDUMP DD  SYSOUT=&PRTCL2                                                   
//SPIESNAP DD  SYSOUT=&PRTCL2                                                   
//SYSABOUT DD  SYSOUT=&PRTCL2                                                   
