//CAT507  PROC STREAM=Z,                  * STREAM INDICATOR          *         
//             INF='SIAC.CONFIRM.CADPZ.S36708(0)', *I/P FROM SIAC     *         
//             OUTF='BZZZ.CAT507.EMAIL',           *O/P               *         
//             PRTCL1='*',                                                      
//             PRTCL2='Y',                                                      
//             REGSIZE=4M,                                                      
//             UNIT=BATCH,                                                      
//             RUNDATE='RERUN.EARLY.'                                           
//*********************************************************************         
//* EDIT NSCC/SIAC ACATS CONFIRM FILE     * SIAC.CONFIRM.CADP*.S36708 *         
//* CHECK IF TRANSFER WENT OUT ON TIME    * SIAC.CONFIRM.CADPQ.S46708 *         
//*********************************************************************         
//CAT507  EXEC PGM=CAT507,                                                      
//             PARM='&STREAM',                                                  
//             REGION=&REGSIZE                                                  
//STEPLIB  DD  DSN=&RUNDATE.ADP.DATELIB,                                        
//             DISP=SHR                                                         
//INFILE   DD  DSN=&INF,                                                        
//             DISP=SHR                                                         
//OUTFILE   DD  DSN=&OUTF,                                                      
//             DISP=(NEW,CATLG),                                                
//             DCB=(RECFM=FB,LRECL=80),                                         
//             SPACE=(CYL,(1,1),RLSE),                                          
//             UNIT=&UNIT                                                       
//SYSOUT   DD  SYSOUT=&PRTCL1                                                   
//SYSPRINT DD  SYSOUT=&PRTCL1                                                   
//SYSUDUMP DD  SYSOUT=&PRTCL2                                                   
//SYSABOUT DD  SYSOUT=&PRTCL2                                                   
