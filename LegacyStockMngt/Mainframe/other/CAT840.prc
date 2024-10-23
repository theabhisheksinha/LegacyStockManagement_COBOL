//CAT840  PROC BYP1=0,                    * 1=BYPASS CYCLE NBR CHECK  *         
//             BYP2=0,                    * 1=BYPASS DATE CHECK       *         
//             BYP3=0,                    * 1=BYPASS FILE CHECK       *         
//             RUNTYPE=NORML,             * =MFUND FOR MUTUAL FUND RUN*         
//             RVSE=RVSE,                 * =RVSEFUND FOR MUTUAL FUND *         
//             B1HDR='BZZZ.B1FL.PROD',    *I/P B1 VSAM FILE           *         
//             GDGA='GDG,',               *O/P .CAT840A.RVSL          *         
//             GEN='(+0)',                *I/P .SIAC1008.NDMS         *         
//             GENP1='(+1)',              *O/P .CAT840A.CATTRNS       *         
//             HNB1='BZZZ',               *O/P .SIAC1008.NDMS     GDG *         
//             HNB2='BZZZ',               *O/P .CAT840A.RVSE      GDG *         
//             UNIT='BATCH',                                                    
//             PRTCL1='*',                                                      
//             PRTCL2='Y',                                                      
//             REGSIZE=4M,                                                      
//             RUNDATE='RERUN.EARLY.',                                          
//             SPACE1='(CYL,(30,50),RLSE)', *O/P .CAT840A.RVSE    GDG *         
//             SPACE2='(CYL,(10,30),RLSE)'  *O/P .CAT840.RVSPI    GDG *         
//*                                                                             
//*********************************************************************         
//*                                                                   *         
//* SORT ACATS REVERSAL FILE SIAC1008 NON MUTUAL FUND                 *         
//*   OR ACATS REVERSAL FILE SIAC1076 MUTUAL FUND                     *         
//*   AS NEEDED FOR REPORT PROGRAM CAT840                             *         
//*                                                                   *         
//*********************************************************************         
//*                                                                             
//CAT840A EXEC PGM=CAT840A,                                                     
//             PARM='&BYP1&BYP2&BYP3',                                          
//             REGION=&REGSIZE                                                  
//STEPLIB  DD  DSN=&RUNDATE.ADP.DATELIB,                                        
//             DISP=SHR                                                         
//B1FIL    DD  DSN=&B1HDR,                                          I/P         
//             DISP=SHR                                                         
//INFILE   DD  DSN=&HNB1..SIAC1008.NDMS&GEN,                     I/P            
//             DISP=SHR                                                         
//OUTFILE  DD  DSN=&HNB2..CAT840A.&RVSE..SORT&GENP1,             O/P            
//             DISP=(NEW,CATLG,DELETE),                                         
//             SPACE=&SPACE1,                                                   
//             UNIT=&UNIT,                                                      
//             DCB=(&GDGA.DSORG=PS,LRECL=4004,RECFM=VB,BLKSIZE=27998)           
//SYSOUT   DD  SYSOUT=&PRTCL1                                                   
//SORTWK01  DD UNIT=SYSDA,SPACE=(CYL,(50,50),RLSE)                              
//SORTWK02  DD UNIT=SYSDA,SPACE=(CYL,(50,50),RLSE)                              
//SORTWK03  DD UNIT=SYSDA,SPACE=(CYL,(50,50),RLSE)                              
//SYSPRINT DD  SYSOUT=&PRTCL1                                                   
//SYSUDUMP DD  SYSOUT=&PRTCL2                                                   
//SPIESNAP DD  SYSOUT=&PRTCL2                                                   
//SYSABOUT DD  SYSOUT=&PRTCL2                                                   
//*                                                                             
//CAT840 EXEC PGM=CAT840,                                                       
//             PARM='&RUNTYPE=NORMAL',                                          
//             REGION=&REGSIZE                                                  
//STEPLIB  DD  DSN=&RUNDATE.ADP.DATELIB,                                        
//             DISP=SHR                                                         
//INFILE  DD  DSN=&HNB2..CAT840A.&RVSE..SORT&GENP1,             I/P             
//             DISP=SHR                                                         
//RVSPI   DD  DSN=&HNB2..CAT840.RVSPI&GENP1,                    O/P             
//             DISP=(NEW,CATLG,DELETE),                                         
//             SPACE=&SPACE2,                                                   
//             UNIT=&UNIT,                                                      
//             DCB=(&GDGA.DSORG=PS,LRECL=143,RECFM=FB)                          
//SYSOUT   DD  SYSOUT=&PRTCL1                                                   
//SYSPRINT DD  SYSOUT=&PRTCL1                                                   
//SYSUDUMP DD  SYSOUT=&PRTCL2                                                   
//SPIESNAP DD  SYSOUT=&PRTCL2                                                   
//SYSABOUT DD  SYSOUT=&PRTCL2                                                   
