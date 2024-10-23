//CAT8100F JOB (BF0P,DY00),'ACATS FULL DLVR LOAD',CLASS=5,MSGCLASS=W,           
//         USER=BF0P,SECLABEL=BISG,SCHENV=STREAMF                               
//*NODAFF BALANCE5                                                              
//*JOBAFF BALANCE5                                                              
//*********************************************************************         
//* THIS JOB UPDATES DB2. IT IS RESTARTABLE.                          *         
//*********************************************************************         
//CA11    EXEC CA11                                                             
//*********************************************************************         
//*CAT810: LOAD ASSETS FOR FULL DELIVERY TRANSFERS REQUESTS           *         
//*        FOR ACTIVE TRANSFERS IN REQUEST OR REQUEST-ADJUST STATUS   *         
//*********************************************************************         
//STEP10  EXEC CAT810,                                                          
//             STREAM=F,                  * STREAM INDICATOR          *         
//             BYP1=0,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=0,                    * 1=BYPASS FILE CHECK       *         
//             RERUN=0,                   * 1=THIS IS A RERUN         *         
//             B1HDR='BZZZ.B1FL',         *I/P B1 VSAM FILE           *         
//             HNB1='SF.FFF',             *I/P .OMG36.BALNCAL    VSAM *         
//             HNB2='SF.FFF',             *I/P .OMG27.DPHLD1AL   VSAM *         
//             HNB3='SF.FFF',             *I/P .BSU40.MRGIMM     VSAM *         
//             HNB4='SF.FFF',             *I/P .BNW50.NTWMAST    VSAM *         
//             HNB5='SF.FFF',             *I/P .BNW50.NTWREGOP   VSAM *         
//             HNB6='BB.ZZZ',             *I/P .MFRS.MFMSD       VSAM *         
//             HNB7='BFFF',               *O/P .CAT810.ACATDLVF   GDG *         
//             HNB9='SF.FFF',             *I/P .BNAT42.NACTAF    VSAM *         
//             CURFLE='POVF.BTSF.CMT15.CURFLE',                                 
//             NAV='BNAFFF'               *I/P .BNA34.NAFILEA    VSAM *         
//*********************************************************************         
//* SUBMIT PTR ASSETS ON B1 REQUEST DAY AND REJECT PTRS ON LAST DAY.  *         
//*********************************************************************         
//STEP15  EXEC CAT811,                                                          
//             STREAM=F,                  * STREAM INDICATOR          *         
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//             BYP1=0,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=0,                    * 1=BYPASS FILE CHECK       *         
//             RERUN=0                    * 1=THIS IS A RERUN         *         
//CAT811.STEPLIB   DD                                                           
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
//*********************************************************************         
//* CAT812A- EXTRACT BALANCES AND POSITIONS FOR RESIDUAL CREDITS      *         
//*********************************************************************         
//STEP20  EXEC CAT812A,                                                         
//             STREAM=F,                  * STREAM INDICATOR          *         
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//             BYP1=0,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=0,                    * 1=BYPASS FILE CHECK       *         
//             RERUN=0,                   * 1=THIS IS A RERUN         *         
//             B1HDR='BZZZ.B1FL',         *I/P B1 VSAM FILE           *         
//             HNB1='SF.FFF',             *I/P .OMG36.BALNCAL    VSAM *         
//             HNB2='SF.FFF',             *I/P .OMG27.DPHLD1AL   VSAM *         
//             HNB3='SF.FFF',             *I/P .BSU40.MRGIMM     VSAM *         
//             HNB4='BFFF',               *O/P .CAT812A.ACATRCRF  GDG *         
//             MSDPRE='BB.ZZZ',           *MSD FILE PREFIX BB/QSYAV   *         
//             MSDSUF='.DUPE',            *MSD FILE SUFFIX .DUPE/BLANK*         
//             NAV='BNAFFF'               *I/P .BNA34.NAFILEA    VSAM *         
//CAT812A.STEPLIB   DD                                                          
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
//*********************************************************************         
//*CAT812: LOAD ASSETS TO DATABASE FOR RESIDUAL CREDITS               *         
//*********************************************************************         
//STEP30  EXEC CAT812,                                                          
//             STREAM=F,                  * STREAM INDICATOR          *         
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//             BYP1=0,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=0,                    * 1=BYPASS FILE CHECK       *         
//             RERUN=0,                   * 1=THIS IS A RERUN         *         
//             B1HDR='BZZZ.B1FL',         *I/P B1 VSAM FILE           *         
//             HNB1='BFFF',               *I/P .CAT812A.ACATRCRF  GDG *         
//             HNB2='SF.FFF',             *I/P .BNW50.NTWMAST    VSAM *         
//             HNB3='SF.FFF',             *I/P .BNW50.NTWREGOP   VSAM *         
//             HNB4='BB.ZZZ',             *I/P .MFRS.MFMSD       VSAM *         
//             HNB5='BFFF',               *O/P .CAT812.ACATDLVF   GDG *         
//             HNB6='BFFF'                *O/P .CAT812.ACATRCRF   GDG *         
//CAT812.STEPLIB   DD                                                           
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
//*********************************************************************         
//*CAT813: RESIDUAL CREDIT REPORT                                     *         
//*********************************************************************         
//STEP40  EXEC CAT813,                                                          
//             STREAM=F,                  *JOB STREAM                 *         
//             BYP1=0,                    *'1' BYPASS DATE CHECK      *         
//             BYP2=0,                    *'1' BYPASS EMPTY FILE      *         
//             B1HDR='BZZZ.B1FL',         *I/P B1 VSAM FILE           *         
//             HNB1='BFFF',               *I/P &HNB1.CAT812.ACATRCRF  *         
//             HNB2='BFFF',               *O/P &HNB2.CAT813.RCRPI  GDG*         
//             HNB3='BFFF',               *O/P &HNB3.CAT813.NONPI  GDG*         
//             HNB4='BFFF'                *O/P &HNB4.CAT813.EXCPI  GDG*         
