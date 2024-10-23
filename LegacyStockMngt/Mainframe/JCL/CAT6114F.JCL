//CAT6114F JOB (BF0P,DY00),'ACAT NA UPD INTRADAY',CLASS=1,MSGCLASS=W,           
//         USER=BF0P,SECLABEL=BISG,SCHENV=STREAMF                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//*                                                                             
//*     INTRADAY NAME/ADDRESS UPDATE FILE AND REPORT CYCLE 4                    
//*                                                                             
//*--------------------------------------------------------------------         
//*    DOWNLOAD CURRENT NAME&ADDR ACTIVITY TO QSAM                              
//*--------------------------------------------------------------------         
//STEP05  EXEC IDCAMS                                                           
//SYSPRINT DD  SYSOUT=*                                                         
//DD1     DD  DSN=SF.FFF.BNA150.NNAAFL,DISP=SHR                                 
//DD2     DD  DSN=BFFF.CAT610.NA.ACTIVITY(+1),DISP=(NEW,CATLG),                 
//   UNIT=BATCH,DCB=(GDG,LRECL=4093,RECFM=VB),SPACE=(CYL,(5,5),RLSE)            
//SYSIN    DD DSN=BISG.CARDLIB(REPRO),DISP=SHR                                  
//*                                                                             
//STEP10  EXEC CAT610,                                                          
//             CL=F,                      * CLIENT STREAM             *         
//             HNB=BFFF,                                                        
//             NAV=BNAFFF,                                                      
//             CYCLRUN='Y',               *INTRADAY CYCLRUN PARM = 'Y'*         
//             CYCLNBR='04',              *FOR INTRA DAY USE          *         
//             CAT610=CAT611,             *INTRADAY FILE NAME         *         
//             NAUPI='NA4PI',             *INTRADAY CYCLE REPORT NAME *         
//             ALTPI='AL4PI',             *INTRADAY ALTBR REP OVERRIDE*         
//             DUMMY='DUMMY,',            *INTRADAY NO FEEDS REQUIRED *         
//             DUMMY2=,                   *ALTERNATE BRANCH REPORT    *         
//             DUMMYNQ=,                  *NAME&ADDR ACTIVITY FILE VSM*         
//             DUMMYWR=,                  *CREATE AUTOWIRES FILE      *         
//             HNO=SF.FFF,                *ALTERNATE BRANCH VSAM      *         
//             DUMMYO=,                   *ALTERNATE BRANCH VSAM      *         
//             ACCTDEL='DUMMY,',          *INTRADAY FILE NOT NEEDED   *         
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//             RUNDATE='RERUN.EARLY.'                                           
//CAT610.STEPLIB   DD                                                           
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
//CAT612.STEPLIB   DD                                                           
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
//*--------------------------------------------------------------------         
//*    ACAT WIRES ASSET LOOKUP/PROCESSING                                       
//*--------------------------------------------------------------------         
//STEP20  EXEC CAT614,                                                          
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//             HNB1='BFFF',               *I/P .CAT611.WIRES      GDG *         
//             HNB2='BFFF',               *O/P .CAT614.WIRES      GDG *         
//             RUNDATE='RERUN.EARLY.'                                           
//CAT614.STEPLIB   DD                                                           
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
//*--------------------------------------------------------------------         
//*    UPLOAD ACAT WIRE MESSAGES TO CONFIGURATION DATABASE                      
//*--------------------------------------------------------------------         
//BDFWORI EXEC BDFWORI,                                                         
//             DB2ENV=P,                       * T-TEST, Q-QA, P-PROD *         
//             BDFDSN='BFFF.CAT614.WIRES(+1)',                                  
//             CATG=CTGRYC1,                   * BDF WORK CATEGORY    *         
//             DTYP=WIREREC,                   * BDF WORK DATA TYPE   *         
//             HCHK=BR14,                      * BDF DATA HEADER CHECK*         
//             TRACE=OF                        * ON TO TRACE          *         
//ADDWORK.DSNEXIT  DD   DISP=SHR,DSN=DB2PROD.GROUP.SDSNEXIT                     
//DSNLOAD  DD   DISP=SHR,DSN=DB2PROD.GROUP.SDSNLOAD                             
