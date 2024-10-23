//CAT510  PROC BYP1=0,                    * 1=BYPASS CYCLE NBR CHECK  *         
//             BYP2=0,                    * 1=BYPASS DATE CHECK       *         
//             BYP3=0,                    * 1=BYPASS FILE CHECK       *         
//             BYP4=0,                    * 1=BYPASS RECORD COUNT <100*         
//             CLT=,                      * 235=PROCESS CLT 235 ONLY  *         
//             WM=,                       * WM FOR WEALTH MNGT RUN    *         
//             B1HDR='BZZZ.B1FL.PROD',    *I/P B1 VSAM FILE           *         
//             GDGA='GDG,',               *O/P .CAT510.ACATTRAN       *         
//             GDGB='GDG,',               *O/P .CAT510.CYCLELOG       *         
//             GEN00A='(+0)',             *I/P .CAT510.CYCLELOG       *         
//             GENP1A='(+1)',             *O/P .CAT510.ACATTRAN       *         
//             GENP1B='(+1)',             *O/P .CAT510.CYCLELOG       *         
//             INF='BZZZ.SIAC0716.ACAT.TRAN(0)',  *I/P FROM NSCC/SIAC *         
//             HNB1='BZZZ',               *I/P .CAT510.CYCLELOG   GDG *         
//             HNB2='BZZZ',               *O/P .CAT510.ACATTRAN   GDG *         
//             HNB3='BZZZ',               *O/P .CAT510.CYCLELOG   GDG *         
//             UNIT='BATCH',                                                    
//             PRTCL1='*',                                                      
//             PRTCL2='Y',                                                      
//             REGSIZE=8M,                                                      
//             RUNDATE='RERUN.EARLY.',                                          
//             SPACE1='(CYL,(30,30),RLSE)', *O/P .CAT510.ACATTRAN GDG *         
//             SPACE2='(TRK,(1,1),RLSE)'    *O/P .CAT510.CYCLELOG GDG *         
//*                                                                             
//*********************************************************************         
//*                                                                   *         
//* EDIT NSCC/SIAC ACATS MULTI-CYCLE TRANSACTION MRO (M FILE)         *         
//* CHECK HEADERS, TRAILERS AND RECORD COUNTS. CHECK CYCLE NUMBER     *         
//*                                                                   *         
//*********************************************************************         
//*                                                                             
//CAT510  EXEC PGM=CAT510,                                                      
//             PARM='&BYP1&BYP2&BYP3&BYP4&CLT',                                 
//             REGION=&REGSIZE                                                  
//STEPLIB  DD  DSN=&RUNDATE.ADP.DATELIB,                                        
//             DISP=SHR                                                         
//B1FIL    DD  DSN=&B1HDR,                                          I/P         
//             DISP=SHR                                                         
//INFILE   DD  DSN=&INF,                                            I/P         
//             DISP=SHR                                                         
//INLOG    DD  DSN=&HNB1..CAT510.&WM.CYCLELOG&GEN00A,               I/P         
//             DISP=SHR                                                         
//OUTFILE  DD  DSN=&HNB2..CAT510.&WM.ACATTRAN&GENP1A,               O/P         
//             DISP=(NEW,CATLG,DELETE),                                         
//             SPACE=&SPACE1,                                                   
//             UNIT=&UNIT,                                                      
//             DCB=(&GDGA.DSORG=PS,LRECL=3272,RECFM=VB,BLKSIZE=27998)           
//OUTLOG   DD  DSN=&HNB3..CAT510.&WM.CYCLELOG&GENP1B,               O/P         
//             DISP=(NEW,CATLG,DELETE),                                         
//             SPACE=&SPACE2,                                                   
//             UNIT=&UNIT,                                                      
//             DCB=(&GDGB.DSORG=PS,LRECL=200,RECFM=FB,BLKSIZE=27800)            
//SYSOUT   DD  SYSOUT=&PRTCL1                                                   
//SYSPRINT DD  SYSOUT=&PRTCL1                                                   
//SYSUDUMP DD  SYSOUT=&PRTCL2                                                   
//SPIESNAP DD  SYSOUT=&PRTCL2                                                   
//SYSABOUT DD  SYSOUT=&PRTCL2                                                   
