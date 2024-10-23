//CAT512  PROC BRKR='0000',               * SELECT BROKER NUMBER      *         
//             GDGA='GDG,',               *O/P .BROKER OUTFILE        *         
//             GEN00A='(+0)',             *I/P .SIAC0716.TRAN         *         
//             GENP1A='(+1)',             *O/P .BROKER OUTFILE        *         
//             HNB1='BZZZ',               *I/P .SIAC0716.TRAN     GDG *         
//             HNB3='BIOS',               *O/P .BROKER OUTFILE    GDG *         
//             UNIT='BATCH',                                                    
//             PRTCL1='*',                                                      
//             PRTCL2='Y',                                                      
//             REGSIZE=8M,                                                      
//             RUNDATE='RERUN.EARLY.',                                          
//             SPACE1='(CYL,(3,5),RLSE)'    *O/P .CAT512.SIAC0716 GDG *         
//*                                                                             
//*********************************************************************         
//*                                                                   *         
//* SPLIT NSCC/SIAC ACATS MULTI-CYCLE TRANSACTION MRO (M FILE)      *           
//*         BY BROKER NUMBER                                          *         
//*                                                                   *         
//*********************************************************************         
//*                                                                             
//CAT512  EXEC PGM=CAT512,                                                      
//             PARM=&BRKR,                                                      
//             REGION=&REGSIZE                                                  
//STEPLIB  DD  DSN=&RUNDATE.ADP.DATELIB,                                        
//             DISP=SHR                                                         
//INFILE   DD  DSN=&HNB1..SIAC0716.ACAT.TRAN&GEN00A,                I/P         
//             DISP=SHR                                                         
//OUTFILE  DD  DSN=&HNB3..C237.OUT.SIAC0716.TRAN&GENP1A,            O/P         
//             DISP=(NEW,CATLG,DELETE),                                         
//             SPACE=&SPACE1,                                                   
//             UNIT=&UNIT,                                                      
//             DCB=(&GDGA.DSORG=PS,LRECL=4004,RECFM=VB,BLKSIZE=27998)           
//SYSOUT   DD  SYSOUT=&PRTCL1                                                   
//SYSPRINT DD  SYSOUT=&PRTCL1                                                   
//SYSUDUMP DD  SYSOUT=&PRTCL2                                                   
//SPIESNAP DD  SYSOUT=&PRTCL2                                                   
//SYSABOUT DD  SYSOUT=&PRTCL2                                                   
