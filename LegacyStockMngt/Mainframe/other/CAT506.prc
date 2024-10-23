//CAT506  PROC STREAM=Z,                  * STREAM INDICATOR          *         
//             GEN00A='(+0)',             *I/P .CAT511.ACATTRNS       *         
//             HNB1='BAAA',               *I/P .CAT511.ACATTRNS   GDG *         
//             INF='SIAC.CONFIRM.CADPA.S36667(0)', *I/P FROM SIAC     *         
//             PRTCL1='*',                                                      
//             PRTCL2='Y',                                                      
//             REGSIZE=4M,                                                      
//             RUNDATE='RERUN.EARLY.'                                           
//*********************************************************************         
//* COMPARE SIAC ACAT CONFIRM FILE TO     * SIAC.CONFIRM.CADP*.S36667 *         
//* SIAC ACATTRAN FILE. COUNT RECORDS.    * SIAC.CONFIRM.CADPQ.S46667 *         
//*********************************************************************         
//CAT506  EXEC PGM=CAT506,                                                      
//             PARM='&STREAM',                                                  
//             REGION=&REGSIZE                                                  
//STEPLIB  DD  DSN=&RUNDATE.ADP.DATELIB,                                        
//             DISP=SHR                                                         
//INCONF   DD  DSN=&INF,                                                        
//             DISP=SHR                                                         
//INTRAN   DD  DSN=&HNB1..CAT511.ACATTRNS&GEN00A,                               
//             DISP=SHR                                                         
//SYSOUT   DD  SYSOUT=&PRTCL1                                                   
//SYSPRINT DD  SYSOUT=&PRTCL1                                                   
//SYSUDUMP DD  SYSOUT=&PRTCL2                                                   
//SYSABOUT DD  SYSOUT=&PRTCL2                                                   
