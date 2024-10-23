//CAT8100H JOB (BH0P,DY00),'ACATS FULL DLVR LOAD',CLASS=5,MSGCLASS=W,           
//         USER=BH0P,SECLABEL=BISG                                              
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
//             STREAM=H,                  * STREAM INDICATOR          *         
//             BYP1=0,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=0,                    * 1=BYPASS FILE CHECK       *         
//             RERUN=0,                   * 1=THIS IS A RERUN         *         
//             B1HDR='BZZZ.B1FL',                                               
//             HNB1='SH.HHH',             *I/P .OMG36.BALNCAL    VSAM *         
//             HNB2='SH.HHH',             *I/P .OMG27.DPHLD1AL   VSAM *         
//             HNB3='SH.HHH',             *I/P .BSU40.MRGIMM     VSAM *         
//             HNB4='SH.HHH',             *I/P .BNW50.NTWMAST    VSAM *         
//             HNB5='SH.HHH',             *I/P .BNW50.NTWREGOP   VSAM *         
//             HNB6='BB.ZZZ',             *I/P .MFRS.MFMSD       VSAM *         
//             HNB7='BHHH',               *O/P .CAT810.ACATDLVF   GDG *         
//             HNB9='SH.HHH',             *I/P .BNAT42.NACTAF    VSAM *         
//             CURFLE='POVH.BTSH.CMT15.CURFLE',                                 
//             NAV='BNAHHH'               *I/P .BNA34.NAFILEA    VSAM *         
//*********************************************************************         
//* SUBMIT PTR ASSETS ON B1 REQUEST DAY AND REJECT PTRS ON LAST DAY.  *         
//*********************************************************************         
//STEP15  EXEC CAT811,                                                          
//             STREAM=H,                  * STREAM INDICATOR          *         
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
//* CAT812A- READ TRANSFER HISTORY DB2 TABLE FOR SETTLE CLOSE STATUS  *         
//* EXTRACT BALANCES AND POSITIONS FOR RESIDUAL CREDITS               *         
//* OUTPUT FILE FEEDS CAT812                                          *         
//*********************************************************************         
//STEP20  EXEC CAT812A,                                                         
//             STREAM=H,                  * STREAM INDICATOR          *         
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//             BYP1=0,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=0,                    * 1=BYPASS FILE CHECK       *         
//             RERUN=0,                   * 1=THIS IS A RERUN         *         
//             B1HDR='BZZZ.B1FL',         *I/P B1 VSAM FILE           *         
//             CARDLIB='BISG.CARDLIB',    *DB2 PLAN CARDLIB           *         
//             DB2SYS='DB2PROD',          *DB2 SYSTEM DB2PROD/DB2TEST *         
//             GDGA='GDG,',               *O/P .CAT812A.ACATRCRF      *         
//             GENP1A='(+1)',             *O/P .CAT812A.ACATRCRF      *         
//             HNB1='SH.HHH',             *I/P .OMG36.BALNCAL    VSAM *         
//             HNB2='SH.HHH',             *I/P .OMG27.DPHLD1AL   VSAM *         
//             HNB3='SH.HHH',             *I/P .BSU40.MRGIMM     VSAM *         
//             HNB4='BHHH',               *O/P .CAT812A.ACATRCRF  GDG *         
//             MSDPRE='BB.ZZZ',           *MSD FILE PREFIX BB/QSYAV   *         
//             MSDSUF='.DUPE',            *MSD FILE SUFFIX .DUPE/BLANK*         
//             NAV='BNAHHH',              *I/P .BNA34.NAFILEA    VSAM *         
//             PRTCL1='*',                                                      
//             PRTCL2='Y',                                                      
//             REGSIZE=8M,                                                      
//             RUNDATE=,                                                        
//             SPACE1='(CYL,(50,10),RLSE)', *O/P .CAT812A.ACATRCRF GDG*         
//             UNIT='BATCH'                                                     
//CAT812A.STEPLIB   DD                                                          
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
//*                                                                             
//*********************************************************************         
//* CAT812 - LOAD RCR (RESIDUAL CREDIT) BASED ON INPUT FROM CAT812A   *         
//*********************************************************************         
//STEP30  EXEC CAT812,                                                          
//             STREAM=H,                  * STREAM INDICATOR          *         
//             DB2SYS='DB2PROD.GROUP',    *DB2                                  
//             DB2SYS1='DB2PROD.GROUP',   *DB2                                  
//             BYP1=0,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=0,                    * 1=BYPASS FILE CHECK       *         
//             RERUN=0,                   * 1=THIS IS A RERUN         *         
//             B1HDR='BZZZ.B1FL',         *I/P B1 VSAM FILE           *         
//             CARDLIB='BISG.CARDLIB',    *DB2 PLAN CARDLIB           *         
//             DB2SYS='DB2PROD',          *DB2 SYSTEM DB2PROD/DB2TEST *         
//             GDGA='GDG,',               *O/P .CAT812.ACATRCRF       *         
//             GDGB='GDG,',               *O/P .CAT812.ACATDLVF       *         
//             GENP00='(+1)',             *I/P .CAT812A.ACATRCRF      *         
//             GENP1A='(+1)',             *O/P .CAT812.ACATRCRF       *         
//             GENP1B='(+1)',             *O/P .CAT812.ACATDLVF       *         
//             HNB1='BHHH',               *I/P .CAT812A.ACATRCRF  GDG *         
//             HNB2='SH.HHH',             *I/P .BNW50.NTWMAST    VSAM *         
//             HNB3='SH.HHH',             *I/P .BNW50.NTWREGOP   VSAM *         
//             HNB4='BB.ZZZ',             *I/P .MFRS.MFMSD       VSAM *         
//             HNB5='BHHH',               *O/P .CAT812.ACATDLVF   GDG *         
//             HNB6='BHHH',               *O/P .CAT812.ACATRCRF   GDG *         
//             PRTCL1='*',                                                      
//             PRTCL2='Y',                                                      
//             REGSIZE=8M,                                                      
//             RUNDATE=,                                                        
//             SPACE1='(CYL,(10,10),RLSE)', *O/P .CAT812.ACATRCRF  GDG*         
//             SPACE2='(CYL,(10,10),RLSE)', *O/P .CAT812.ACATDLVF  GDG*         
//             UNIT1='BATCH',               *O/P .CAT812.ACATRCRF  GDG*         
//             UNIT2='BATCH'                *O/P .CAT812.ACATDLVF  GDG*         
//CAT812.STEPLIB   DD                                                           
//          DD                                                                  
//          DD DSN=&DB2SYS..SDSNEXIT                                            
//          DD DSN=&DB2SYS1..SDSNLOAD                                           
//*                                                                             
//*********************************************************************         
//* CAT813 - RESIDUAL CREDIT REPORT                                   *         
//*********************************************************************         
//STEP40  EXEC CAT813,                                                          
//             STREAM=H,                  *JOB STREAM                 *         
//             BYP1=1,                    *'1' BYPASS DATE CHECK      *         
//             BYP2=0,                    *'1' BYPASS EMPTY FILE      *         
//             B1HDR='BZZZ.B1FL',         *I/P B1 VSAM FILE           *         
//             GDGA='GDG,',               *O/P &HNB2.CAT813.RCRPI     *         
//             GDGB='GDG,',               *O/P &HNB3.CAT813.NONPI     *         
//             GDGC='GDG,',               *O/P &HNB4.CAT813.EXCPI     *         
//             GEN00A='(+1)',             *I/P &HNB1.CAT812.ACATRCRF  *         
//             GENP1A='(+1)',             *O/P &HNB2.CAT813.RCRPI     *         
//             GENP1B='(+1)',             *O/P &HNB3.CAT813.NONPI     *         
//             GENP1C='(+1)',             *O/P &HNB4.CAT813.EXCPI     *         
//             HNB1='BHHH',               *I/P &HNB1.CAT812.ACATRCRF  *         
//             HNB2='BHHH',               *O/P &HNB2.CAT813.RCRPI  GDG*         
//             HNB3='BHHH',               *O/P &HNB3.CAT813.NONPI  GDG*         
//             HNB4='BHHH',               *O/P &HNB4.CAT813.EXCPI  GDG*         
//             PERMUN='BATCH',            *O/P &HNB2.CAT813.RCRPI  GDG*         
//             REGSIZE=4M,                                                      
//             RUNDATE=,                                                        
//             SPACE='(CYL,(1,1),RLSE)'   *O/P &HNB2.CAT813.RCRPI  GDG*         
