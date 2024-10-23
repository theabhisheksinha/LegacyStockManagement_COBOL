//CAT505  PROC STREAM=Z,                  * STREAM INDICATOR          *         
//             INF='SIAC.CONFIRM.CADPZ.S36667(0)', *I/P FROM SIAC     *         
//             PRTCL1='*',                                                      
//             PRTCL2='Y',                                                      
//             REGSIZE=4M,                                                      
//             RUNDATE='RERUN.EARLY.'                                           
//*********************************************************************         
//* EDIT NSCC/SIAC ACATS CONFIRM FILE     * SIAC.CONFIRM.CADP*.S36667 *         
//* CHECK IF TRANSFER WENT OUT ON TIME    * SIAC.CONFIRM.CADPQ.S46667 *         
//*********************************************************************         
//CAT505  EXEC PGM=CAT505,                                                      
//             PARM='&STREAM',                                                  
//             REGION=&REGSIZE                                                  
//STEPLIB  DD  DSN=&RUNDATE.ADP.DATELIB,                                        
//             DISP=SHR                                                         
//INFILE   DD  DSN=&INF,                                                        
//             DISP=SHR                                                         
//SYSOUT   DD  SYSOUT=&PRTCL1                                                   
//SYSPRINT DD  SYSOUT=&PRTCL1                                                   
//SYSUDUMP DD  SYSOUT=&PRTCL2                                                   
//SYSABOUT DD  SYSOUT=&PRTCL2                                                   
