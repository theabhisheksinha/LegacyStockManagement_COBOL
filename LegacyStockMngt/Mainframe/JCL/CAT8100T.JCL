//CAT8100T JOB (BT0P,DY00),'ACATS FULL DLVR LOAD',CLASS=O,MSGCLASS=W,           
//         SCHENV=STREAMT,                                                      
//         USER=BT0P,PRTY=9,                                                    
//  SECLABEL=BISG                                                               
//*NODAFF BALANCEO                                                              
//*JOBAFF BALANCEO                                                              
//*********************************************************************         
//* THIS JOB UPDATES DB2. IT IS RESTARTABLE.                          *         
//*********************************************************************         
//CA11    EXEC CA11                                                             
//*********************************************************************         
//*CAT810: LOAD ASSETS FOR FULL DELIVERY TRANSFERS REQUESTS           *         
//*        FOR ACTIVE TRANSFERS IN REQUEST OR REQUEST-ADJUST STATUS   *         
//*********************************************************************         
//STEP10  EXEC CAT810,                                                          
//             STREAM=T,                  * STREAM INDICATOR          *         
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//             BYP1=0,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=0,                    * 1=BYPASS FILE CHECK       *         
//             RERUN=0,                   * 1=THIS IS A RERUN         *         
//             B1HDR='BZZZ.B1FL',         *I/P B1 VSAM FILE           *         
//             HNB1='S1.TTT',             *I/P .OMG36.BALNCAL    VSAM *         
//             HNB2='S1.TTT',             *I/P .OMG27.DPHLD1AL   VSAM *         
//             HNB3='S1.TTT',             *I/P .BSU40.MRGIMM     VSAM *         
//             HNB4='S1.TTT',             *I/P .BNW50.NTWMAST    VSAM *         
//             HNB5='S1.TTT',             *I/P .BNW50.NTWREGOP   VSAM *         
//             HNB6='BB.ZZZ',             *I/P .MFRS.MFMSD       VSAM *         
//             HNB7='BTTT',               *O/P .CAT810.ACATDLVF   GDG *         
//             HNB9='S1.TTT',             *I/P .BNAT42.NACTAF    VSAM *         
//             CURFLE='POVT.BTST.CMT15.CURFLE',                                 
//             NAV='BNATTT'               *I/P .BNA34.NAFILEA    VSAM *         
//CAT810.STEPLIB   DD                                                           
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
//CAT810.MFEXBR DD DSN=ST.TTT.MFRS.MFEXBR,DISP=SHR                              
//*********************************************************************         
//* SUBMIT PTR ASSETS ON B1 REQUEST DAY AND REJECT PTRS ON LAST DAY.  *         
//*********************************************************************         
//STEP15  EXEC CAT811,                                                          
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//             STREAM=T,                  * STREAM INDICATOR          *         
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
//             STREAM=T,                  * STREAM INDICATOR          *         
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//             BYP1=0,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=0,                    * 1=BYPASS FILE CHECK       *         
//             RERUN=0,                   * 1=THIS IS A RERUN         *         
//             B1HDR='BZZZ.B1FL',         *I/P B1 VSAM FILE           *         
//             HNB1='S1.TTT',             *I/P .OMG36.BALNCAL    VSAM *         
//             HNB2='S1.TTT',             *I/P .OMG27.DPHLD1AL   VSAM *         
//             HNB3='S1.TTT',             *I/P .BSU40.MRGIMM     VSAM *         
//             HNB4='BTTT',               *O/P .CAT812A.ACATRCRF  GDG *         
//             MSDPRE='BB.ZZZ',           *MSD FILE PREFIX BB/QSYAV   *         
//             MSDSUF='.DUPE',            *MSD FILE SUFFIX .DUPE/BLANK*         
//             NAV='BNATTT'               *I/P .BNA34.NAFILEA    VSAM *         
//CAT812A.STEPLIB   DD                                                          
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
//*********************************************************************         
//*CAT812: LOAD ASSETS TO DATABASE FOR RESIDUAL CREDITS               *         
//*********************************************************************         
//STEP30  EXEC CAT812,                                                          
//             STREAM=T,                  * STREAM INDICATOR          *         
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//             BYP1=0,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=0,                    * 1=BYPASS FILE CHECK       *         
//             RERUN=0,                   * 1=THIS IS A RERUN         *         
//             B1HDR='BZZZ.B1FL',         *I/P B1 VSAM FILE           *         
//             HNB1='BTTT',               *I/P .CAT812A.ACATRCRF  GDG *         
//             HNB2='S1.TTT',             *I/P .BNW50.NTWMAST    VSAM *         
//             HNB3='S1.TTT',             *I/P .BNW50.NTWREGOP   VSAM *         
//             HNB4='BB.ZZZ',             *I/P .MFRS.MFMSD       VSAM *         
//             HNB5='BTTT',               *O/P .CAT812.ACATDLVF   GDG *         
//             HNB6='BTTT'                *O/P .CAT812.ACATRCRF   GDG *         
//CAT812.STEPLIB   DD                                                           
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
//CAT812.MFEXBR DD DSN=ST.TTT.MFRS.MFEXBR,DISP=SHR                              
//*********************************************************************         
//*CAT813: RESIDUAL CREDIT REPORT                                     *         
//*********************************************************************         
//STEP40  EXEC CAT813,                                                          
//             STREAM=T,                  *JOB STREAM                 *         
//             BYP1=0,                    *'1' BYPASS DATE CHECK      *         
//             BYP2=0,                    *'1' BYPASS EMPTY FILE      *         
//             B1HDR='BZZZ.B1FL',         *I/P B1 VSAM FILE           *         
//             HNB1='BTTT',               *I/P &HNB1.CAT812.ACATRCRF  *         
//             HNB2='BTTT',               *O/P &HNB2.CAT813.RCRPI  GDG*         
//             HNB3='BTTT',               *O/P &HNB3.CAT813.NONPI  GDG*         
//             HNB4='BTTT'                *O/P &HNB4.CAT813.EXCPI  GDG*         
