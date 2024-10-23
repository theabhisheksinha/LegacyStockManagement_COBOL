//CAT705  PROC BYP1=0,                    * 1=BYPASS DATE CHECK, WHEN *         
//** USED WITH WRONG DATE ON INPUT, THE PROGRAM WILL IGNORE THE FILE  *         
//*                                                                             
//             BYP2=0,                    * 1=BYPASS FILE CHECK, WHEN *         
//** USED WITH BAD FILE ID ON INPUT, THE PROGRAM WILL IGNORE THE FILE *         
//*                                                                             
//             INF='BZZZ.WM0718.ACAT.POSN(0)',  *I/P FROM WM          *         
//             B1HDR='BZZZ.B1FL.PROD',    *I/P B1 VSAM FILE           *         
//             HNB='BZZZ',                *O/P .CAT705.WM.POSN    GDG *         
//             GENP='(+1)',               *O/P .CAT705.WM.POSN        *         
//             GDG='GDG,',                *O/P .CAT705.WM.POSN        *         
//             UNIT='BATCH',                                                    
//             BRKR='0642',               *BROKER NBR CAT705 EDIT     *         
//             PRTCL1='*',                                                      
//             PRTCL2='Y',                                                      
//             RUNDATE='RERUN.EARLY.',                                          
//             SPACE1='(CYL,(5,5),RLSE)'   *O/P .CAT705.WM.POSN GDG *           
//*                                                                             
//*-------------------------------------------------------------------*         
//* EQUIVALENT OF EOD POSITION SIAC0718 (P) FILE FOR BROKER 0642.     *         
//* EDIT NSCC/SIAC FILE RECEIVED INDIRECTLY FROM WEALTH MANAGEMENT.   *         
//* VALIDATE FILE HEADER AND DATE.                                    *         
//* ALL NSCC RECORDS FOR ADP ACCOUNTS WILL BE PASSED, AND WM ACCOUNTS *         
//* (NON ADP) ONLY IN SETTLE PREP AND SETTLE CLOSE STATUS.            *         
//* OUTPUT FILE TO BE MERGED INTO CAT710 PROCESSING.                  *         
//*-------------------------------------------------------------------*         
//*                                                                             
//CAT705 EXEC PGM=CAT705,                                                       
//             PARM='&BYP1&BYP2&BRKR'                                           
//STEPLIB  DD  DSN=&RUNDATE.ADP.DATELIB,                                        
//             DISP=SHR                                                         
//B1FIL    DD  DSN=&B1HDR,                                          I/P         
//             DISP=SHR                                                         
//IPOSN    DD  DSN=&INF,                                            I/P         
//             DISP=SHR                                                         
//OPOSN    DD  DSN=&HNB..CAT705.WM.POSN&GENP,                       O/P         
//             DISP=(NEW,CATLG,DELETE),                                         
//             SPACE=&SPACE1,                                                   
//             UNIT=&UNIT,                                                      
//             DCB=(&GDG.DSORG=PS,LRECL=4004,RECFM=VB,BLKSIZE=27998)            
//SYSOUT   DD  SYSOUT=&PRTCL1                                                   
//SYSPRINT DD  SYSOUT=&PRTCL1                                                   
//SYSUDUMP DD  SYSOUT=&PRTCL2                                                   
//SPIESNAP DD  SYSOUT=&PRTCL2                                                   
//SYSABOUT DD  SYSOUT=&PRTCL2                                                   
