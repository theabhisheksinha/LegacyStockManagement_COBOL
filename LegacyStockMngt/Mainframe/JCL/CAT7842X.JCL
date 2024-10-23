//CAT7842X JOB (BX0P,DY00),'ACATS CBRS CL289',CLASS=1,MSGCLASS=W,               
//         SCHENV=STREAMX,                                                      
//        USER=BX0P,SECLABEL=BISG                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//*                                                                             
//CA11    EXEC CA11                                                             
//*-------------------------------------------------------------------*         
//* COPY INPUT BIOS FILE TO A GDG BACKUP                              *         
//*-------------------------------------------------------------------*         
//IDCAM20 EXEC FASTVSAM                                                         
//SYSPRINT DD SYSOUT=*                                                          
//DD1      DD DSN=BIOS.C289.INP.CBRS.S36708,                                    
//             DISP=SHR                                                         
//DD2      DD DSN=BXXX.CAT784DB.C289.INP.CBRS(+1),                              
//             DISP=(,CATLG,DELETE),                                            
//             DCB=(GDG,LRECL=1000,RECFM=FB),                                   
//             SPACE=(CYL,(2,10),RLSE),                                         
//             UNIT=BATCH                                                       
//SYSIN    DD  DSN=BISG.CARDLIB(CAT500RP),                                      
//             DISP=SHR                                                         
//*                                                                             
//*-------------------------------------------------------------------*         
//* VERIFY INFILE DATE.  PRODUCE DTCC FEED AND ERROR REPORT.          *         
//* CAT784DB IS NON UPDATE DB2 PROGRAM AND MAY BE RESTARTED/RERAN.    *         
//*-------------------------------------------------------------------*         
//STEP10  EXEC CAT784DB,                                                        
//             HNB='BXXX',                *O/P .CAT784DB.NSCCFL   GDG *         
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//             SPLITCL='CL289.',          *SINGLE CLIENT EXTR 'CL###.'          
//             STREAM=X,                  * 1 BYTE BATCH STREAM       *         
//             BYPFL=0,                   * BYPASS EMPTY FILE = 1     *         
//             INTDY=1,                   * INTRA-DAY RUN = 1         *         
//             RUNDATE='RERUN.EARLY.'                                           
//CAT784DB.STEPLIB DD                                                           
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT,DISP=SHR                                   
//          DD DSN=&DB2SYS1..SDSNLOAD,DISP=SHR                                  
//CAT784DB.INFILE DD DSN=BXXX.CAT784DB.C289.INP.CBRS(+1),DISP=SHR               
//CAT784DB.NSCCFL DD DSN=BXXX.CAT784DB.CL289.NSCCFL(+1),                        
//          DISP=(NEW,CATLG,DELETE)                                             
//*                                                                             
//CAT784R.STEPLIB DD DSN=&RUNDATE.ADP.DATELIB,DISP=SHR                          
