//CAT9120Z JOB (BZ0P,0000),'DAY1 CONVERSION',CLASS=1,MSGCLASS=W,                
//  SECLABEL=BISG,                                                              
//             USER=BZ0P,                                                       
//             SCHENV=STREAMZ                                                   
//*NODAFF BALANCE1                      REQUIRED FOR Q STREAM ONLY              
//*JOBAFF BALANCE1                      REQUIRED FOR Q STREAM ONLY              
//**                                                                            
//**    DAY 1 SECOND RUN - CONVERT SIAC103 AND LOAD DATABASE                    
//**                                                                            
//CA11STEP EXEC CA11                                                            
//*********************************************************************         
//* CONVERT TI ,AT                                                    *         
//*********************************************************************         
//S103    EXEC CAT912,HNB=BZZZ                                                  
//*********************************************************************         
//* CONVERT FR (FUND REGISTRATION) RECORDS                            *         
//*********************************************************************         
//S103FR  EXEC CAT918,HNB=BZZZ                                                  
//STEP10  EXEC CAT510,                                                          
//             BYP1=1,                    * BYP1=1= BYPASS CYCLE CHECK*         
//             BYP2=1,                    * BYP2=1= BYPASS DATE CHECK *         
//             BYP3=1,                    * BYP3=1= BYPASS FILE CHECK *         
//             INF='BZZZ.NSCC.MMRO3'              *I/P FROM NSCC/SIAC *         
//CAT510.INFILE DD                                                              
//         DD DSN=BZZZ.NSCC.FRMRO,DISP=SHR                                      
//CAT510.INLOG DD DUMMY                                                         
//CAT510.OUTLOG DD DUMMY                                                        
//STEPA1  EXEC CAT511,                                                          
//             BYP1=1,                    * BYP1=1= BYPASS CYCLE CHECK*         
//             BYP2=1,                    * BYP2=1= BYPASS DATE CHECK *         
//             BYP3=1,                    * BYP3=1= BYPASS FILE CHECK *         
//             STREAM='A',                * STREAM INDICATOR          *         
//             GEN00A='(+1)',                                                   
//             HNB1='BZZZ',               *I/P .CAT510.ACATTRAN   GDG *         
//             HNB2='BAAA',               *I/P .CAT511.CYCLELOG   GDG *         
//             HNB3='BAAA',               *O/P .CAT511.ACATTRNS   GDG *         
//             HNB4='BAAA'                *O/P .CAT511.CYCLELOG   GDG *         
//*********************************************************************         
//*CAT513: PROCESS ACATS TRANSACTIONS 'TI' RECORD TYPES    -UPDATE DB2*         
//*********************************************************************         
//STEPA2  EXEC CAT513,                                                          
//             BYP1=1,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=1,                    * 1=BYPASS FILE CHECK       *         
//             RERUN=0,                   * 1=THIS IS A RERUN         *         
//             HNB1='BAAA',               *I/P .CAT511.ACATTRNS   GDG *         
//             NAV='BNAAAA'               *I/P .BNA34.NAFILEA    VSAM *         
//*********************************************************************         
//*CAT515: PROCESS ACATS TRANSACTIONS 'AT' RECORD TYPES    -UPDATE DB2*         
//*********************************************************************         
//STEPA3  EXEC CAT515,                                                          
//             BYP1=1,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=1,                    * 1=BYPASS FILE CHECK       *         
//             RERUN=0,                   * 1=THIS IS A RERUN         *         
//             MSDPRE='POVZ.PMSD',        *MSD FILE PREFIX BB/QSYAV   *         
//             MSDSUF=,                   *MSD FILE SUFFIX .DUPE/BLANK*         
//             HNB1='BAAA'                *I/P .CAT511.ACATTRNS   GDG *         
//*********************************************************************         
//*CAT517: PROCESS ACATS TRANSACTIONS 'FR' RECORD TYPES    -UPDATE DB2*         
//*********************************************************************         
//STEPA4  EXEC CAT517,                                                          
//             BYP1=1,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=1,                    * 1=BYPASS FILE CHECK       *         
//             RERUN=0,                   * 1=THIS IS A RERUN         *         
//             MSDPRE='POVZ.PMSD',        *MSD FILE PREFIX BB/QSYAV   *         
//             MSDSUF=,                   *MSD FILE SUFFIX .DUPE/BLANK*         
//             HNB1='BAAA'                *I/P .CAT511.ACATTRNS   GDG *         
//*********************************************************************         
//*CAT519: LOAD ASSETS FOR FULL DELIVERY TRANSFERS REQUESTS-UPDATE DB2*         
//*********************************************************************         
//STEPA5  EXEC CAT519,                                                          
//             BYP1=1,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=1,                    * 1=BYPASS FILE CHECK       *         
//             RERUN=0,                   * 1=THIS IS A RERUN         *         
//             HNB1='S1.AAA',             *I/P .OMG36.BALNCAL    VSAM *         
//             HNB2='S1.AAA',             *I/P .OMG27.DPHLD1AL   VSAM *         
//             HNB3='S1.AAA',             *I/P .BSU40.MRGIMM     VSAM *         
//             HNB4='S1.AAA',             *I/P .BNW50.NTWMAST    VSAM *         
//             HNB5='S1.AAA',             *I/P .BNW50.NTWREGOP   VSAM *         
//             HNB6='SZ.ZZZ',             *I/P .MFRS.MFMSD       VSAM *         
//             HNB7='BAAA',               *I/P .CAT511.ACATTRNS   GDG *         
//             MSDPRE='POVZ.PMSD',        *MSD FILE PREFIX BB/QSYAV   *         
//             MSDSUF=,                   *MSD FILE SUFFIX .DUPE/BLANK*         
//             NAV='BNAAAA'               *I/P .BNA34.NAFILEA    VSAM *         
//STEPB1  EXEC CAT511,                                                          
//             BYP1=1,                    * BYP1=1= BYPASS CYCLE CHECK*         
//             BYP2=1,                    * BYP2=1= BYPASS DATE CHECK *         
//             BYP3=1,                    * BYP3=1= BYPASS FILE CHECK *         
//             STREAM='B',                * STREAM INDICATOR          *         
//             GEN00A='(+1)',                                                   
//             HNB1='BZZZ',               *I/P .CAT510.ACATTRAN   GDG *         
//             HNB2='BBBB',               *I/P .CAT511.CYCLELOG   GDG *         
//             HNB3='BBBB',               *O/P .CAT511.ACATTRNS   GDG *         
//             HNB4='BBBB'                *O/P .CAT511.CYCLELOG   GDG *         
//*********************************************************************         
//*CAT513: PROCESS ACATS TRANSACTIONS 'TI' RECORD TYPES    -UPDATE DB2*         
//*********************************************************************         
//STEPB2  EXEC CAT513,                                                          
//             BYP1=1,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=1,                    * 1=BYPASS FILE CHECK       *         
//             RERUN=0,                   * 1=THIS IS A RERUN         *         
//             HNB1='BBBB',               *I/P .CAT511.ACATTRNS   GDG *         
//             NAV='BNABBB'               *I/P .BNA34.NAFILEA    VSAM *         
//*********************************************************************         
//*CAT515: PROCESS ACATS TRANSACTIONS 'AT' RECORD TYPES    -UPDATE DB2*         
//*********************************************************************         
//STEPB3  EXEC CAT515,                                                          
//             BYP1=1,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=1,                    * 1=BYPASS FILE CHECK       *         
//             RERUN=0,                   * 1=THIS IS A RERUN         *         
//             MSDPRE='POVZ.PMSD',        *MSD FILE PREFIX BB/QSYAV   *         
//             MSDSUF=,                   *MSD FILE SUFFIX .DUPE/BLANK*         
//             HNB1='BBBB'                *I/P .CAT511.ACATTRNS   GDG *         
//*********************************************************************         
//*CAT517: PROCESS ACATS TRANSACTIONS 'FR' RECORD TYPES    -UPDATE DB2*         
//*********************************************************************         
//STEPB4  EXEC CAT517,                                                          
//             BYP1=1,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=1,                    * 1=BYPASS FILE CHECK       *         
//             RERUN=0,                   * 1=THIS IS A RERUN         *         
//             MSDPRE='POVZ.PMSD',        *MSD FILE PREFIX BB/QSYAV   *         
//             MSDSUF=,                   *MSD FILE SUFFIX .DUPE/BLANK*         
//             HNB1='BBBB'                *I/P .CAT511.ACATTRNS   GDG *         
//*CAT519: LOAD ASSETS FOR FULL DELIVERY TRANSFERS REQUESTS-UPDATE DB2*         
//*********************************************************************         
//STEPB5  EXEC CAT519,                                                          
//             BYP1=1,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=1,                    * 1=BYPASS FILE CHECK       *         
//             RERUN=0,                   * 1=THIS IS A RERUN         *         
//             HNB1='SB.BBB',             *I/P .OMG36.BALNCAL    VSAM *         
//             HNB2='SB.BBB',             *I/P .OMG27.DPHLD1AL   VSAM *         
//             HNB3='SB.BBB',             *I/P .BSU40.MRGIMM     VSAM *         
//             HNB4='SB.BBB',             *I/P .BNW50.NTWMAST    VSAM *         
//             HNB5='SB.BBB',             *I/P .BNW50.NTWREGOP   VSAM *         
//             HNB6='SZ.ZZZ',             *I/P .MFRS.MFMSD       VSAM *         
//             HNB7='BBBB',               *I/P .CAT511.ACATTRNS   GDG *         
//             MSDPRE='POVZ.PMSD',        *MSD FILE PREFIX BB/QSYAV   *         
//             MSDSUF=,                   *MSD FILE SUFFIX .DUPE/BLANK*         
//             NAV='BNABBB'               *I/P .BNA34.NAFILEA    VSAM *         
//STEPI1  EXEC CAT511,                                                          
//             BYP1=1,                    * BYP1=1= BYPASS CYCLE CHECK*         
//             BYP2=1,                    * BYP2=1= BYPASS DATE CHECK *         
//             BYP3=1,                    * BYP3=1= BYPASS FILE CHECK *         
//             STREAM='I',                * STREAM INDICATOR          *         
//             GEN00A='(+1)',                                                   
//             HNB1='BZZZ',               *I/P .CAT510.ACATTRAN   GDG *         
//             HNB2='BIII',               *I/P .CAT511.CYCLELOG   GDG *         
//             HNB3='BIII',               *O/P .CAT511.ACATTRNS   GDG *         
//             HNB4='BIII'                *O/P .CAT511.CYCLELOG   GDG *         
//*********************************************************************         
//*CAT513: PROCESS ACATS TRANSACTIONS 'TI' RECORD TYPES    -UPDATE DB2*         
//*********************************************************************         
//STEPI2  EXEC CAT513,                                                          
//             BYP1=1,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=1,                    * 1=BYPASS FILE CHECK       *         
//             RERUN=0,                   * 1=THIS IS A RERUN         *         
//             HNB1='BIII',               *I/P .CAT511.ACATTRNS   GDG *         
//             NAV='BNAIII'               *I/P .BNA34.NAFILEA    VSAM *         
//*********************************************************************         
//*CAT515: PROCESS ACATS TRANSACTIONS 'AT' RECORD TYPES    -UPDATE DB2*         
//*********************************************************************         
//STEPI3  EXEC CAT515,                                                          
//             BYP1=1,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=1,                    * 1=BYPASS FILE CHECK       *         
//             RERUN=0,                   * 1=THIS IS A RERUN         *         
//             MSDPRE='POVZ.PMSD',        *MSD FILE PREFIX BB/QSYAV   *         
//             MSDSUF=,                   *MSD FILE SUFFIX .DUPE/BLANK*         
//             HNB1='BIII'                *I/P .CAT511.ACATTRNS   GDG *         
//*********************************************************************         
//*CAT517: PROCESS ACATS TRANSACTIONS 'FR' RECORD TYPES    -UPDATE DB2*         
//*********************************************************************         
//STEPI4  EXEC CAT517,                                                          
//             BYP1=1,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=1,                    * 1=BYPASS FILE CHECK       *         
//             RERUN=0,                   * 1=THIS IS A RERUN         *         
//             MSDPRE='POVZ.PMSD',        *MSD FILE PREFIX BB/QSYAV   *         
//             MSDSUF=,                   *MSD FILE SUFFIX .DUPE/BLANK*         
//             HNB1='BIII'                *I/P .CAT511.ACATTRNS   GDG *         
//*********************************************************************         
//*CAT519: LOAD ASSETS FOR FULL DELIVERY TRANSFERS REQUESTS-UPDATE DB2*         
//*********************************************************************         
//STEPI5  EXEC CAT519,                                                          
//             BYP1=1,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=1,                    * 1=BYPASS FILE CHECK       *         
//             RERUN=0,                   * 1=THIS IS A RERUN         *         
//             HNB1='SI.III',             *I/P .OMG36.BALNCAL    VSAM *         
//             HNB2='SI.III',             *I/P .OMG27.DPHLD1AL   VSAM *         
//             HNB3='SI.III',             *I/P .BSU40.MRGIMM     VSAM *         
//             HNB4='SI.III',             *I/P .BNW50.NTWMAST    VSAM *         
//             HNB5='SI.III',             *I/P .BNW50.NTWREGOP   VSAM *         
//             HNB6='SZ.ZZZ',             *I/P .MFRS.MFMSD       VSAM *         
//             HNB7='BIII',               *I/P .CAT511.ACATTRNS   GDG *         
//             MSDPRE='POVZ.PMSD',        *MSD FILE PREFIX BB/QSYAV   *         
//             MSDSUF=,                   *MSD FILE SUFFIX .DUPE/BLANK*         
//             NAV='BNAIII'               *I/P .BNA34.NAFILEA    VSAM *         
//STEPJ1  EXEC CAT511,                                                          
//             BYP1=1,                    * BYP1=1= BYPASS CYCLE CHECK*         
//             BYP2=1,                    * BYP2=1= BYPASS DATE CHECK *         
//             BYP3=1,                    * BYP3=1= BYPASS FILE CHECK *         
//             STREAM='J',                * STREAM INDICATOR          *         
//             GEN00A='(+1)',                                                   
//             HNB1='BZZZ',               *I/P .CAT510.ACATTRAN   GDG *         
//             HNB2='BJJJ',               *I/P .CAT511.CYCLELOG   GDG *         
//             HNB3='BJJJ',               *O/P .CAT511.ACATTRNS   GDG *         
//             HNB4='BJJJ'                *O/P .CAT511.CYCLELOG   GDG *         
//*********************************************************************         
//*CAT513: PROCESS ACATS TRANSACTIONS 'TI' RECORD TYPES    -UPDATE DB2*         
//*********************************************************************         
//STEPJ2  EXEC CAT513,                                                          
//             BYP1=1,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=1,                    * 1=BYPASS FILE CHECK       *         
//             RERUN=0,                   * 1=THIS IS A RERUN         *         
//             HNB1='BJJJ',               *I/P .CAT511.ACATTRNS   GDG *         
//             NAV='BNAJJJ'               *I/P .BNA34.NAFILEA    VSAM *         
//*********************************************************************         
//*CAT515: PROCESS ACATS TRANSACTIONS 'AT' RECORD TYPES    -UPDATE DB2*         
//*********************************************************************         
//STEPJ3  EXEC CAT515,                                                          
//             BYP1=1,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=1,                    * 1=BYPASS FILE CHECK       *         
//             RERUN=0,                   * 1=THIS IS A RERUN         *         
//             MSDPRE='POVZ.PMSD',        *MSD FILE PREFIX BB/QSYAV   *         
//             MSDSUF=,                   *MSD FILE SUFFIX .DUPE/BLANK*         
//             HNB1='BJJJ'                *I/P .CAT511.ACATTRNS   GDG *         
//*********************************************************************         
//*CAT517: PROCESS ACATS TRANSACTIONS 'FR' RECORD TYPES    -UPDATE DB2*         
//*********************************************************************         
//STEPJ4  EXEC CAT517,                                                          
//             BYP1=1,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=1,                    * 1=BYPASS FILE CHECK       *         
//             RERUN=0,                   * 1=THIS IS A RERUN         *         
//             MSDPRE='POVZ.PMSD',        *MSD FILE PREFIX BB/QSYAV   *         
//             MSDSUF=,                   *MSD FILE SUFFIX .DUPE/BLANK*         
//             HNB1='BJJJ'                *I/P .CAT511.ACATTRNS   GDG *         
//*********************************************************************         
//*CAT519: LOAD ASSETS FOR FULL DELIVERY TRANSFERS REQUESTS-UPDATE DB2*         
//*********************************************************************         
//STEPJ5  EXEC CAT519,                                                          
//             BYP1=1,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=1,                    * 1=BYPASS FILE CHECK       *         
//             RERUN=0,                   * 1=THIS IS A RERUN         *         
//             HNB1='SJ.JJJ',             *I/P .OMG36.BALNCAL    VSAM *         
//             HNB2='SJ.JJJ',             *I/P .OMG27.DPHLD1AL   VSAM *         
//             HNB3='SJ.JJJ',             *I/P .BSU40.MRGIMM     VSAM *         
//             HNB4='SJ.JJJ',             *I/P .BNW50.NTWMAST    VSAM *         
//             HNB5='SJ.JJJ',             *I/P .BNW50.NTWREGOP   VSAM *         
//             HNB6='SZ.ZZZ',             *I/P .MFRS.MFMSD       VSAM *         
//             HNB7='BJJJ',               *I/P .CAT511.ACATTRNS   GDG *         
//             MSDPRE='POVZ.PMSD',        *MSD FILE PREFIX BB/QSYAV   *         
//             MSDSUF=,                   *MSD FILE SUFFIX .DUPE/BLANK*         
//             NAV='BNAJJJ'               *I/P .BNA34.NAFILEA    VSAM *         
//STEPL1  EXEC CAT511,                                                          
//             BYP1=1,                    * BYP1=1= BYPASS CYCLE CHECK*         
//             BYP2=1,                    * BYP2=1= BYPASS DATE CHECK *         
//             BYP3=1,                    * BYP3=1= BYPASS FILE CHECK *         
//             STREAM='L',                * STREAM INDICATOR          *         
//             GEN00A='(+1)',                                                   
//             HNB1='BZZZ',               *I/P .CAT510.ACATTRAN   GDG *         
//             HNB2='BLLL',               *I/P .CAT511.CYCLELOG   GDG *         
//             HNB3='BLLL',               *O/P .CAT511.ACATTRNS   GDG *         
//             HNB4='BLLL'                *O/P .CAT511.CYCLELOG   GDG *         
//*********************************************************************         
//*CAT513: PROCESS ACATS TRANSACTIONS 'TI' RECORD TYPES    -UPDATE DB2*         
//*********************************************************************         
//STEPL2  EXEC CAT513,                                                          
//             BYP1=1,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=1,                    * 1=BYPASS FILE CHECK       *         
//             RERUN=0,                   * 1=THIS IS A RERUN         *         
//             HNB1='BLLL',               *I/P .CAT511.ACATTRNS   GDG *         
//             NAV='BNALLL'               *I/P .BNA34.NAFILEA    VSAM *         
//*********************************************************************         
//*CAT515: PROCESS ACATS TRANSACTIONS 'AT' RECORD TYPES    -UPDATE DB2*         
//*********************************************************************         
//STEPL3  EXEC CAT515,                                                          
//             BYP1=1,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=1,                    * 1=BYPASS FILE CHECK       *         
//             RERUN=0,                   * 1=THIS IS A RERUN         *         
//             MSDPRE='POVZ.PMSD',        *MSD FILE PREFIX BB/QSYAV   *         
//             MSDSUF=,                   *MSD FILE SUFFIX .DUPE/BLANK*         
//             HNB1='BLLL'                *I/P .CAT511.ACATTRNS   GDG *         
//*********************************************************************         
//*CAT517: PROCESS ACATS TRANSACTIONS 'FR' RECORD TYPES    -UPDATE DB2*         
//*********************************************************************         
//STEPL4  EXEC CAT517,                                                          
//             BYP1=1,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=1,                    * 1=BYPASS FILE CHECK       *         
//             RERUN=0,                   * 1=THIS IS A RERUN         *         
//             MSDPRE='POVZ.PMSD',        *MSD FILE PREFIX BB/QSYAV   *         
//             MSDSUF=,                   *MSD FILE SUFFIX .DUPE/BLANK*         
//             HNB1='BLLL'                *I/P .CAT511.ACATTRNS   GDG *         
//*********************************************************************         
//*CAT519: LOAD ASSETS FOR FULL DELIVERY TRANSFERS REQUESTS-UPDATE DB2*         
//*********************************************************************         
//STEPL5  EXEC CAT519,                                                          
//             BYP1=1,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=1,                    * 1=BYPASS FILE CHECK       *         
//             RERUN=0,                   * 1=THIS IS A RERUN         *         
//             HNB1='SL.LLL',             *I/P .OMG36.BALNCAL    VSAM *         
//             HNB2='SL.LLL',             *I/P .OMG27.DPHLD1AL   VSAM *         
//             HNB3='SL.LLL',             *I/P .BSU40.MRGIMM     VSAM *         
//             HNB4='SL.LLL',             *I/P .BNW50.NTWMAST    VSAM *         
//             HNB5='SL.LLL',             *I/P .BNW50.NTWREGOP   VSAM *         
//             HNB6='SZ.ZZZ',             *I/P .MFRS.MFMSD       VSAM *         
//             HNB7='BLLL',               *I/P .CAT511.ACATTRNS   GDG *         
//             MSDPRE='POVZ.PMSD',        *MSD FILE PREFIX BB/QSYAV   *         
//             MSDSUF=,                   *MSD FILE SUFFIX .DUPE/BLANK*         
//             NAV='BNALLL'               *I/P .BNA34.NAFILEA    VSAM *         
//STEPP1  EXEC CAT511,                                                          
//             BYP1=1,                    * BYP1=1= BYPASS CYCLE CHECK*         
//             BYP2=1,                    * BYP2=1= BYPASS DATE CHECK *         
//             BYP3=1,                    * BYP3=1= BYPASS FILE CHECK *         
//             STREAM='P',                * STREAM INDICATOR          *         
//             GEN00A='(+1)',                                                   
//             HNB1='BZZZ',               *I/P .CAT510.ACATTRAN   GDG *         
//             HNB2='BPPP',               *I/P .CAT511.CYCLELOG   GDG *         
//             HNB3='BPPP',               *O/P .CAT511.ACATTRNS   GDG *         
//             HNB4='BPPP'                *O/P .CAT511.CYCLELOG   GDG *         
//*********************************************************************         
//*CAT513: PROCESS ACATS TRANSACTIONS 'TI' RECORD TYPES    -UPDATE DB2*         
//*********************************************************************         
//STEPP2  EXEC CAT513,                                                          
//             BYP1=1,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=1,                    * 1=BYPASS FILE CHECK       *         
//             RERUN=0,                   * 1=THIS IS A RERUN         *         
//             HNB1='BPPP',               *I/P .CAT511.ACATTRNS   GDG *         
//             NAV='BNAPPP'               *I/P .BNA34.NAFILEA    VSAM *         
//*********************************************************************         
//*CAT515: PROCESS ACATS TRANSACTIONS 'AT' RECORD TYPES    -UPDATE DB2*         
//*********************************************************************         
//STEPP3  EXEC CAT515,                                                          
//             BYP1=1,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=1,                    * 1=BYPASS FILE CHECK       *         
//             RERUN=0,                   * 1=THIS IS A RERUN         *         
//             MSDPRE='POVZ.PMSD',        *MSD FILE PREFIX BB/QSYAV   *         
//             MSDSUF=,                   *MSD FILE SUFFIX .DUPE/BLANK*         
//             HNB1='BPPP'                *I/P .CAT511.ACATTRNS   GDG *         
//*********************************************************************         
//*CAT517: PROCESS ACATS TRANSACTIONS 'FR' RECORD TYPES    -UPDATE DB2*         
//*********************************************************************         
//STEPP4  EXEC CAT517,                                                          
//             BYP1=1,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=1,                    * 1=BYPASS FILE CHECK       *         
//             RERUN=0,                   * 1=THIS IS A RERUN         *         
//             MSDPRE='POVZ.PMSD',        *MSD FILE PREFIX BB/QSYAV   *         
//             MSDSUF=,                   *MSD FILE SUFFIX .DUPE/BLANK*         
//             HNB1='BPPP'                *I/P .CAT511.ACATTRNS   GDG *         
//*********************************************************************         
//*CAT519: LOAD ASSETS FOR FULL DELIVERY TRANSFERS REQUESTS-UPDATE DB2*         
//*********************************************************************         
//STEPP5  EXEC CAT519,                                                          
//             BYP1=1,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=1,                    * 1=BYPASS FILE CHECK       *         
//             RERUN=0,                   * 1=THIS IS A RERUN         *         
//             HNB1='SP.PPP',             *I/P .OMG36.BALNCAL    VSAM *         
//             HNB2='SP.PPP',             *I/P .OMG27.DPHLD1AL   VSAM *         
//             HNB3='SP.PPP',             *I/P .BSU40.MRGIMM     VSAM *         
//             HNB4='SP.PPP',             *I/P .BNW50.NTWMAST    VSAM *         
//             HNB5='SP.PPP',             *I/P .BNW50.NTWREGOP   VSAM *         
//             HNB6='SZ.ZZZ',             *I/P .MFRS.MFMSD       VSAM *         
//             HNB7='BPPP',               *I/P .CAT511.ACATTRNS   GDG *         
//             MSDPRE='POVZ.PMSD',        *MSD FILE PREFIX BB/QSYAV   *         
//             MSDSUF=,                   *MSD FILE SUFFIX .DUPE/BLANK*         
//             NAV='BNAPPP'               *I/P .BNA34.NAFILEA    VSAM *         
//STEPU1  EXEC CAT511,                                                          
//             BYP1=1,                    * BYP1=1= BYPASS CYCLE CHECK*         
//             BYP2=1,                    * BYP2=1= BYPASS DATE CHECK *         
//             BYP3=1,                    * BYP3=1= BYPASS FILE CHECK *         
//             STREAM='U',                * STREAM INDICATOR          *         
//             GEN00A='(+1)',                                                   
//             HNB1='BZZZ',               *I/P .CAT510.ACATTRAN   GDG *         
//             HNB2='BUUU',               *I/P .CAT511.CYCLELOG   GDG *         
//             HNB3='BUUU',               *O/P .CAT511.ACATTRNS   GDG *         
//             HNB4='BUUU'                *O/P .CAT511.CYCLELOG   GDG *         
//*********************************************************************         
//*CAT513: PROCESS ACATS TRANSACTIONS 'TI' RECORD TYPES    -UPDATE DB2*         
//*********************************************************************         
//STEPU2  EXEC CAT513,                                                          
//             BYP1=1,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=1,                    * 1=BYPASS FILE CHECK       *         
//             RERUN=0,                   * 1=THIS IS A RERUN         *         
//             HNB1='BUUU',               *I/P .CAT511.ACATTRNS   GDG *         
//             NAV='BNAUUU'               *I/P .BNA34.NAFILEA    VSAM *         
//*********************************************************************         
//*CAT515: PROCESS ACATS TRANSACTIONS 'AT' RECORD TYPES    -UPDATE DB2*         
//*********************************************************************         
//STEPU3  EXEC CAT515,                                                          
//             BYP1=1,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=1,                    * 1=BYPASS FILE CHECK       *         
//             RERUN=0,                   * 1=THIS IS A RERUN         *         
//             MSDPRE='POVZ.PMSD',        *MSD FILE PREFIX BB/QSYAV   *         
//             MSDSUF=,                   *MSD FILE SUFFIX .DUPE/BLANK*         
//             HNB1='BUUU'                *I/P .CAT511.ACATTRNS   GDG *         
//*********************************************************************         
//*CAT517: PROCESS ACATS TRANSACTIONS 'FR' RECORD TYPES    -UPDATE DB2*         
//*********************************************************************         
//STEPU4  EXEC CAT517,                                                          
//             BYP1=1,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=1,                    * 1=BYPASS FILE CHECK       *         
//             RERUN=0,                   * 1=THIS IS A RERUN         *         
//             MSDPRE='POVZ.PMSD',        *MSD FILE PREFIX BB/QSYAV   *         
//             MSDSUF=,                   *MSD FILE SUFFIX .DUPE/BLANK*         
//             HNB1='BUUU'                *I/P .CAT511.ACATTRNS   GDG *         
//*********************************************************************         
//*CAT519: LOAD ASSETS FOR FULL DELIVERY TRANSFERS REQUESTS-UPDATE DB2*         
//*********************************************************************         
//STEPU5  EXEC CAT519,                                                          
//             BYP1=1,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=1,                    * 1=BYPASS FILE CHECK       *         
//             RERUN=0,                   * 1=THIS IS A RERUN         *         
//             HNB1='SU.UUU',             *I/P .OMG36.BALNCAL    VSAM *         
//             HNB2='SU.UUU',             *I/P .OMG27.DPHLD1AL   VSAM *         
//             HNB3='SU.UUU',             *I/P .BSU40.MRGIMM     VSAM *         
//             HNB4='SU.UUU',             *I/P .BNW50.NTWMAST    VSAM *         
//             HNB5='SU.UUU',             *I/P .BNW50.NTWREGOP   VSAM *         
//             HNB6='SZ.ZZZ',             *I/P .MFRS.MFMSD       VSAM *         
//             HNB7='BUUU',               *I/P .CAT511.ACATTRNS   GDG *         
//             MSDPRE='POVZ.PMSD',        *MSD FILE PREFIX BB/QSYAV   *         
//             MSDSUF=,                   *MSD FILE SUFFIX .DUPE/BLANK*         
//             NAV='BNAUUU'               *I/P .BNA34.NAFILEA    VSAM *         
//STEPX1  EXEC CAT511,                                                          
//             BYP1=1,                    * BYP1=1= BYPASS CYCLE CHECK*         
//             BYP2=1,                    * BYP2=1= BYPASS DATE CHECK *         
//             BYP3=1,                    * BYP3=1= BYPASS FILE CHECK *         
//             STREAM='X',                * STREAM INDICATOR          *         
//             GEN00A='(+1)',                                                   
//             HNB1='BZZZ',               *I/P .CAT510.ACATTRAN   GDG *         
//             HNB2='BXXX',               *I/P .CAT511.CYCLELOG   GDG *         
//             HNB3='BXXX',               *O/P .CAT511.ACATTRNS   GDG *         
//             HNB4='BXXX'                *O/P .CAT511.CYCLELOG   GDG *         
//*********************************************************************         
//*CAT513: PROCESS ACATS TRANSACTIONS 'TI' RECORD TYPES    -UPDATE DB2*         
//*********************************************************************         
//STEPX2  EXEC CAT513,                                                          
//             BYP1=1,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=1,                    * 1=BYPASS FILE CHECK       *         
//             RERUN=0,                   * 1=THIS IS A RERUN         *         
//             HNB1='BXXX',               *I/P .CAT511.ACATTRNS   GDG *         
//             NAV='BNAXXX'               *I/P .BNA34.NAFILEA    VSAM *         
//*********************************************************************         
//*CAT515: PROCESS ACATS TRANSACTIONS 'AT' RECORD TYPES    -UPDATE DB2*         
//*********************************************************************         
//STEPX3  EXEC CAT515,                                                          
//             BYP1=1,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=1,                    * 1=BYPASS FILE CHECK       *         
//             RERUN=0,                   * 1=THIS IS A RERUN         *         
//             MSDPRE='POVZ.PMSD',        *MSD FILE PREFIX BB/QSYAV   *         
//             MSDSUF=,                   *MSD FILE SUFFIX .DUPE/BLANK*         
//             HNB1='BXXX'                *I/P .CAT511.ACATTRNS   GDG *         
//*********************************************************************         
//*CAT517: PROCESS ACATS TRANSACTIONS 'FR' RECORD TYPES    -UPDATE DB2*         
//*********************************************************************         
//STEPX4  EXEC CAT517,                                                          
//             BYP1=1,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=1,                    * 1=BYPASS FILE CHECK       *         
//             RERUN=0,                   * 1=THIS IS A RERUN         *         
//             MSDPRE='POVZ.PMSD',        *MSD FILE PREFIX BB/QSYAV   *         
//             MSDSUF=,                   *MSD FILE SUFFIX .DUPE/BLANK*         
//             HNB1='BXXX'                *I/P .CAT511.ACATTRNS   GDG *         
//*********************************************************************         
//*CAT519: LOAD ASSETS FOR FULL DELIVERY TRANSFERS REQUESTS-UPDATE DB2*         
//*********************************************************************         
//STEPX5  EXEC CAT519,                                                          
//             BYP1=1,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=1,                    * 1=BYPASS FILE CHECK       *         
//             RERUN=0,                   * 1=THIS IS A RERUN         *         
//             HNB1='S2.XXX',             *I/P .OMG36.BALNCAL    VSAM *         
//             HNB2='S2.XXX',             *I/P .OMG27.DPHLD1AL   VSAM *         
//             HNB3='S2.XXX',             *I/P .BSU40.MRGIMM     VSAM *         
//             HNB4='S2.XXX',             *I/P .BNW50.NTWMAST    VSAM *         
//             HNB5='S2.XXX',             *I/P .BNW50.NTWREGOP   VSAM *         
//             HNB6='SZ.ZZZ',             *I/P .MFRS.MFMSD       VSAM *         
//             HNB7='BXXX',               *I/P .CAT511.ACATTRNS   GDG *         
//             MSDPRE='POVZ.PMSD',        *MSD FILE PREFIX BB/QSYAV   *         
//             MSDSUF=,                   *MSD FILE SUFFIX .DUPE/BLANK*         
//             NAV='BNAXXX'               *I/P .BNA34.NAFILEA    VSAM *         
//STEPY1  EXEC CAT511,                                                          
//             BYP1=1,                    * BYP1=1= BYPASS CYCLE CHECK*         
//             BYP2=1,                    * BYP2=1= BYPASS DATE CHECK *         
//             BYP3=1,                    * BYP3=1= BYPASS FILE CHECK *         
//             STREAM='Y',                * STREAM INDICATOR          *         
//             GEN00A='(+1)',                                                   
//             HNB1='BZZZ',               *I/P .CAT510.ACATTRAN   GDG *         
//             HNB2='BYYY',               *I/P .CAT511.CYCLELOG   GDG *         
//             HNB3='BYYY',               *O/P .CAT511.ACATTRNS   GDG *         
//             HNB4='BYYY'                *O/P .CAT511.CYCLELOG   GDG *         
//*********************************************************************         
//*CAT513: PROCESS ACATS TRANSACTIONS 'TI' RECORD TYPES    -UPDATE DB2*         
//*********************************************************************         
//STEPY2  EXEC CAT513,                                                          
//             BYP1=1,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=1,                    * 1=BYPASS FILE CHECK       *         
//             RERUN=0,                   * 1=THIS IS A RERUN         *         
//             HNB1='BYYY',               *I/P .CAT511.ACATTRNS   GDG *         
//             NAV='BNAYYY'               *I/P .BNA34.NAFILEA    VSAM *         
//*********************************************************************         
//*CAT515: PROCESS ACATS TRANSACTIONS 'AT' RECORD TYPES    -UPDATE DB2*         
//*********************************************************************         
//STEPY3  EXEC CAT515,                                                          
//             BYP1=1,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=1,                    * 1=BYPASS FILE CHECK       *         
//             RERUN=0,                   * 1=THIS IS A RERUN         *         
//             MSDPRE='POVZ.PMSD',        *MSD FILE PREFIX BB/QSYAV   *         
//             MSDSUF=,                   *MSD FILE SUFFIX .DUPE/BLANK*         
//             HNB1='BYYY'                *I/P .CAT511.ACATTRNS   GDG *         
//*********************************************************************         
//*CAT517: PROCESS ACATS TRANSACTIONS 'FR' RECORD TYPES    -UPDATE DB2*         
//*********************************************************************         
//STEPY4  EXEC CAT517,                                                          
//             BYP1=1,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=1,                    * 1=BYPASS FILE CHECK       *         
//             RERUN=0,                   * 1=THIS IS A RERUN         *         
//             MSDPRE='POVZ.PMSD',        *MSD FILE PREFIX BB/QSYAV   *         
//             MSDSUF=,                   *MSD FILE SUFFIX .DUPE/BLANK*         
//             HNB1='BYYY'                *I/P .CAT511.ACATTRNS   GDG *         
//*********************************************************************         
//*CAT519: LOAD ASSETS FOR FULL DELIVERY TRANSFERS REQUESTS-UPDATE DB2*         
//*********************************************************************         
//STEPY5  EXEC CAT519,                                                          
//             BYP1=1,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=1,                    * 1=BYPASS FILE CHECK       *         
//             RERUN=0,                   * 1=THIS IS A RERUN         *         
//             HNB1='S3.YYY',             *I/P .OMG36.BALNCAL    VSAM *         
//             HNB2='S3.YYY',             *I/P .OMG27.DPHLD1AL   VSAM *         
//             HNB3='S3.YYY',             *I/P .BSU40.MRGIMM     VSAM *         
//             HNB4='S3.YYY',             *I/P .BNW50.NTWMAST    VSAM *         
//             HNB5='S3.YYY',             *I/P .BNW50.NTWREGOP   VSAM *         
//             HNB6='SZ.ZZZ',             *I/P .MFRS.MFMSD       VSAM *         
//             HNB7='BYYY',               *I/P .CAT511.ACATTRNS   GDG *         
//             MSDPRE='POVZ.PMSD',        *MSD FILE PREFIX BB/QSYAV   *         
//             MSDSUF=,                   *MSD FILE SUFFIX .DUPE/BLANK*         
//             NAV='BNAYYY'               *I/P .BNA34.NAFILEA    VSAM *         
//STEPS1  EXEC CAT511,                                                          
//             BYP1=1,                    * BYP1=1= BYPASS CYCLE CHECK*         
//             BYP2=1,                    * BYP2=1= BYPASS DATE CHECK *         
//             BYP3=1,                    * BYP3=1= BYPASS FILE CHECK *         
//             STREAM='S',                * STREAM INDICATOR          *         
//             GEN00A='(+1)',                                                   
//             HNB1='BZZZ',               *I/P .CAT510.ACATTRAN   GDG *         
//             HNB2='BSSS',               *I/P .CAT511.CYCLELOG   GDG *         
//             HNB3='BSSS',               *O/P .CAT511.ACATTRNS   GDG *         
//             HNB4='BSSS'                *O/P .CAT511.CYCLELOG   GDG *         
//*********************************************************************         
//*CAT513: PROCESS ACATS TRANSACTIONS 'TI' RECORD TYPES    -UPDATE DB2*         
//*********************************************************************         
//STEPS2  EXEC CAT513,                                                          
//             BYP1=1,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=1,                    * 1=BYPASS FILE CHECK       *         
//             RERUN=0,                   * 1=THIS IS A RERUN         *         
//             HNB1='BSSS',               *I/P .CAT511.ACATTRNS   GDG *         
//             NAV='BNAYYY'               *I/P .BNA34.NAFILEA    VSAM *         
//*********************************************************************         
//*CAT515: PROCESS ACATS TRANSACTIONS 'AT' RECORD TYPES    -UPDATE DB2*         
//*********************************************************************         
//STEPS3  EXEC CAT515,                                                          
//             BYP1=1,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=1,                    * 1=BYPASS FILE CHECK       *         
//             RERUN=0,                   * 1=THIS IS A RERUN         *         
//             MSDPRE='POVZ.PMSD',        *MSD FILE PREFIX BB/QSYAV   *         
//             MSDSUF=,                   *MSD FILE SUFFIX .DUPE/BLANK*         
//             HNB1='BSSS'                *I/P .CAT511.ACATTRNS   GDG *         
//*********************************************************************         
//*CAT517: PROCESS ACATS TRANSACTIONS 'FR' RECORD TYPES    -UPDATE DB2*         
//*********************************************************************         
//STEPS4  EXEC CAT517,                                                          
//             BYP1=1,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=1,                    * 1=BYPASS FILE CHECK       *         
//             RERUN=0,                   * 1=THIS IS A RERUN         *         
//             MSDPRE='POVZ.PMSD',        *MSD FILE PREFIX BB/QSYAV   *         
//             MSDSUF=,                   *MSD FILE SUFFIX .DUPE/BLANK*         
//             HNB1='BSSS'                *I/P .CAT511.ACATTRNS   GDG *         
//*********************************************************************         
//*CAT519: LOAD ASSETS FOR FULL DELIVERY TRANSFERS REQUESTS-UPDATE DB2*         
//*********************************************************************         
//STEPS5  EXEC CAT519,                                                          
//             BYP1=1,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=1,                    * 1=BYPASS FILE CHECK       *         
//             RERUN=0,                   * 1=THIS IS A RERUN         *         
//             HNB1='S6.SSS',             *I/P .OMG36.BALNCAL    VSAM *         
//             HNB2='S6.SSS',             *I/P .OMG27.DPHLD1AL   VSAM *         
//             HNB3='S3.YYY',             *I/P .BSU40.MRGIMM     VSAM *         
//             HNB4='S3.YYY',             *I/P .BNW50.NTWMAST    VSAM *         
//             HNB5='S3.YYY',             *I/P .BNW50.NTWREGOP   VSAM *         
//             HNB6='SZ.ZZZ',             *I/P .MFRS.MFMSD       VSAM *         
//             HNB7='BSSS',               *I/P .CAT511.ACATTRNS   GDG *         
//             MSDPRE='POVZ.PMSD',        *MSD FILE PREFIX BB/QSYAV   *         
//             MSDSUF=,                   *MSD FILE SUFFIX .DUPE/BLANK*         
//             NAV='BNAYYY'               *I/P .BNA34.NAFILEA    VSAM *         
//STEPR1  EXEC CAT511,                                                          
//             BYP1=1,                    * BYP1=1= BYPASS CYCLE CHECK*         
//             BYP2=1,                    * BYP2=1= BYPASS DATE CHECK *         
//             BYP3=1,                    * BYP3=1= BYPASS FILE CHECK *         
//             STREAM='R',                * STREAM INDICATOR          *         
//             GEN00A='(+1)',                                                   
//             HNB1='BZZZ',               *I/P .CAT510.ACATTRAN   GDG *         
//             HNB2='BRRR',               *I/P .CAT511.CYCLELOG   GDG *         
//             HNB3='BRRR',               *O/P .CAT511.ACATTRNS   GDG *         
//             HNB4='BRRR'                *O/P .CAT511.CYCLELOG   GDG *         
//*********************************************************************         
//*CAT513: PROCESS ACATS TRANSACTIONS 'TI' RECORD TYPES    -UPDATE DB2*         
//*********************************************************************         
//STEPR2  EXEC CAT513,                                                          
//             BYP1=1,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=1,                    * 1=BYPASS FILE CHECK       *         
//             RERUN=0,                   * 1=THIS IS A RERUN         *         
//             HNB1='BRRR',               *I/P .CAT511.ACATTRNS   GDG *         
//             NAV='BNAXXX'               *I/P .BNA34.NAFILEA    VSAM *         
//*********************************************************************         
//*CAT515: PROCESS ACATS TRANSACTIONS 'AT' RECORD TYPES    -UPDATE DB2*         
//*********************************************************************         
//STEPR3  EXEC CAT515,                                                          
//             BYP1=1,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=1,                    * 1=BYPASS FILE CHECK       *         
//             RERUN=0,                   * 1=THIS IS A RERUN         *         
//             MSDPRE='POVZ.PMSD',        *MSD FILE PREFIX BB/QSYAV   *         
//             MSDSUF=,                   *MSD FILE SUFFIX .DUPE/BLANK*         
//             HNB1='BRRR'                *I/P .CAT511.ACATTRNS   GDG *         
//*********************************************************************         
//*CAT517: PROCESS ACATS TRANSACTIONS 'FR' RECORD TYPES    -UPDATE DB2*         
//*********************************************************************         
//STEPR4  EXEC CAT517,                                                          
//             BYP1=1,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=1,                    * 1=BYPASS FILE CHECK       *         
//             RERUN=0,                   * 1=THIS IS A RERUN         *         
//             MSDPRE='POVZ.PMSD',        *MSD FILE PREFIX BB/QSYAV   *         
//             MSDSUF=,                   *MSD FILE SUFFIX .DUPE/BLANK*         
//             HNB1='BRRR'                *I/P .CAT511.ACATTRNS   GDG *         
//*********************************************************************         
//*CAT519: LOAD ASSETS FOR FULL DELIVERY TRANSFERS REQUESTS-UPDATE DB2*         
//*********************************************************************         
//STEPR5  EXEC CAT519,                                                          
//             BYP1=1,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=1,                    * 1=BYPASS FILE CHECK       *         
//             RERUN=0,                   * 1=THIS IS A RERUN         *         
//             HNB1='S5.RRR',             *I/P .OMG36.BALNCAL    VSAM *         
//             HNB2='S5.RRR',             *I/P .OMG27.DPHLD1AL   VSAM *         
//             HNB3='S2.XXX',             *I/P .BSU40.MRGIMM     VSAM *         
//             HNB4='S2.XXX',             *I/P .BNW50.NTWMAST    VSAM *         
//             HNB5='S2.XXX',             *I/P .BNW50.NTWREGOP   VSAM *         
//             HNB6='SZ.ZZZ',             *I/P .MFRS.MFMSD       VSAM *         
//             HNB7='BRRR',               *I/P .CAT511.ACATTRNS   GDG *         
//             MSDPRE='POVZ.PMSD',        *MSD FILE PREFIX BB/QSYAV   *         
//             MSDSUF=,                   *MSD FILE SUFFIX .DUPE/BLANK*         
//             NAV='BNAXXX'               *I/P .BNA34.NAFILEA    VSAM *         
//STEPN1  EXEC CAT511,                                                          
//             BYP1=1,                    * BYP1=1= BYPASS CYCLE CHECK*         
//             BYP2=1,                    * BYP2=1= BYPASS DATE CHECK *         
//             BYP3=1,                    * BYP3=1= BYPASS FILE CHECK *         
//             STREAM='N',                * STREAM INDICATOR          *         
//             GEN00A='(+1)',                                                   
//             HNB1='BZZZ',               *I/P .CAT510.ACATTRAN   GDG *         
//             HNB2='BNNN',               *I/P .CAT511.CYCLELOG   GDG *         
//             HNB3='BNNN',               *O/P .CAT511.ACATTRNS   GDG *         
//             HNB4='BNNN'                *O/P .CAT511.CYCLELOG   GDG *         
//*********************************************************************         
//*CAT513: PROCESS ACATS TRANSACTIONS 'TI' RECORD TYPES    -UPDATE DB2*         
//*********************************************************************         
//STEPN2  EXEC CAT513,                                                          
//             BYP1=1,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=1,                    * 1=BYPASS FILE CHECK       *         
//             RERUN=0,                   * 1=THIS IS A RERUN         *         
//             HNB1='BNNN',               *I/P .CAT511.ACATTRNS   GDG *         
//             NAV='BNANNN'               *I/P .BNA34.NAFILEA    VSAM *         
//*********************************************************************         
//*CAT515: PROCESS ACATS TRANSACTIONS 'AT' RECORD TYPES    -UPDATE DB2*         
//*********************************************************************         
//STEPN3  EXEC CAT515,                                                          
//             BYP1=1,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=1,                    * 1=BYPASS FILE CHECK       *         
//             RERUN=0,                   * 1=THIS IS A RERUN         *         
//             MSDPRE='POVZ.PMSD',        *MSD FILE PREFIX BB/QSYAV   *         
//             MSDSUF=,                   *MSD FILE SUFFIX .DUPE/BLANK*         
//             HNB1='BNNN'                *I/P .CAT511.ACATTRNS   GDG *         
//*********************************************************************         
//*CAT517: PROCESS ACATS TRANSACTIONS 'FR' RECORD TYPES    -UPDATE DB2*         
//*********************************************************************         
//STEPN4  EXEC CAT517,                                                          
//             BYP1=1,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=1,                    * 1=BYPASS FILE CHECK       *         
//             RERUN=0,                   * 1=THIS IS A RERUN         *         
//             MSDPRE='POVZ.PMSD',        *MSD FILE PREFIX BB/QSYAV   *         
//             MSDSUF=,                   *MSD FILE SUFFIX .DUPE/BLANK*         
//             HNB1='BNNN'                *I/P .CAT511.ACATTRNS   GDG *         
//*********************************************************************         
//*CAT519: LOAD ASSETS FOR FULL DELIVERY TRANSFERS REQUESTS-UPDATE DB2*         
//*********************************************************************         
//STEPN5  EXEC CAT519,                                                          
//             BYP1=1,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=1,                    * 1=BYPASS FILE CHECK       *         
//             RERUN=0,                   * 1=THIS IS A RERUN         *         
//             HNB1='SN.NNN',             *I/P .OMG36.BALNCAL    VSAM *         
//             HNB2='SN.NNN',             *I/P .OMG27.DPHLD1AL   VSAM *         
//             HNB3='SN.NNN',             *I/P .BSU40.MRGIMM     VSAM *         
//             HNB4='SN.NNN',             *I/P .BNW50.NTWMAST    VSAM *         
//             HNB5='SN.NNN',             *I/P .BNW50.NTWREGOP   VSAM *         
//             HNB6='SZ.ZZZ',             *I/P .MFRS.MFMSD       VSAM *         
//             HNB7='BNNN',               *I/P .CAT511.ACATTRNS   GDG *         
//             MSDPRE='POVZ.PMSD',        *MSD FILE PREFIX BB/QSYAV   *         
//             MSDSUF=,                   *MSD FILE SUFFIX .DUPE/BLANK*         
//             NAV='BNANNN'               *I/P .BNA34.NAFILEA    VSAM *         
