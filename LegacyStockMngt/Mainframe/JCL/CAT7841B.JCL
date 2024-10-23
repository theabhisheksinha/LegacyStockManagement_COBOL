//CAT7841B JOB (BB0P,DY00),'ACATS CBRS CL237',CLASS=1,MSGCLASS=W,               
//         SCHENV=STREAMB,                                                      
//        USER=BB0P,SECLABEL=BISG                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//*                                                                             
//CA11    EXEC CA11                                                             
//*-------------------------------------------------------------------*         
//* COPY INPUT BIOS FILE TO A GDG BACKUP                              *         
//*-------------------------------------------------------------------*         
//IDCAM20 EXEC FASTVSAM                                                         
//SYSPRINT DD SYSOUT=*                                                          
//DD1      DD DSN=BIOS.C237.INP.CBRS.S36708,                                    
//             DISP=SHR                                                         
//DD2      DD DSN=BBBB.CAT784DB.C237.INP.CBRS(+1),                              
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
//             HNB='BBBB',                *O/P .CAT784DB.NSCCFL   GDG *         
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//             SPLITCL='CL237.',          *SINGLE CLIENT EXTR 'CL###.'          
//             STREAM=B,                  * 1 BYTE BATCH STREAM       *         
//             INTDY=1,                   * INTRA-DAY RUN = 1         *         
//             BYPFL=0,                   * BYPASS EMPTY FILE = 1     *         
//             RUNDATE='RERUN.EARLY.'                                           
//CAT784DB.STEPLIB   DD                                                         
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
//CAT784DB.INFILE DD DSN=BBBB.CAT784DB.C237.INP.CBRS(+1),DISP=SHR               
//CAT784DB.NSCCFL DD DSN=BBBB.CAT784DB.CL237.NSCCFL(+1),                        
//          DISP=(NEW,CATLG,DELETE)                                             
//*                                                                             
//CAT784R.STEPLIB DD DSN=&RUNDATE.ADP.DATELIB,DISP=SHR                          
