//CAT5110R JOB (BR0P,0000),'ACATS NSCC/SIAC TRAN',CLASS=2,MSGCLASS=W,           
//         USER=BR0P,SCHENV=STREAMR,SECLABEL=BISG,PRTY=15                       
//*NODNOT SYSTEMD                                                               
//*JOBNOT SYSTEMD                                                               
//CA11    EXEC CA11                                                             
//*********************************************************************         
//* THIS JOB RUNS FIVE TIMES A DAY TRIGGERED BY CAT5100Z              *         
//*********************************************************************         
//*********************************************************************         
//*CAT511:EXTRACT NSCC/SIAC ACATS MULTI-CYCLE TRANSACTION MRO (M FILE)*         
//*         FOR CLIENTS IN THIS STREAM                                *         
//*********************************************************************         
//STEP10  EXEC CAT511,                                                          
//             STREAM='R',                * STREAM INDICATOR          *         
//             BYP1=0,                    * BYP1=1= BYPASS CYCLE CHECK*         
//*                                       * BYP1=2= USE PREV CYCLE NBR*         
//*                                       * BYP1=3= USE NSCC CYCLE NBR*         
//             BYP2=0,                    * BYP2=1= BYPASS DATE CHECK *         
//             BYP3=0,                    * BYP3=1= BYPASS FILE CHECK *         
//*                                                                   *         
//             GEN00A='(+0)',             *I/P .CAT510.ACATTRAN       *         
//             HNB1='BZZZ',               *I/P .CAT510.ACATTRAN   GDG *         
//             HNB2='BRRR',               *I/P .CAT511.CYCLELOG   GDG *         
//             HNB3='BRRR',               *O/P .CAT511.ACATTRNS   GDG *         
//             HNB4='BRRR'                *O/P .CAT511.CYCLELOG   GDG *         
//*********************************************************************         
//*CAT513: PROCESS ACATS TRANSACTIONS 'TI' RECORD TYPES    -UPDATE DB2*         
//*********************************************************************         
//STEP20  EXEC CAT513,                                                          
//             BYP1=0,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=0,                    * 1=BYPASS FILE CHECK       *         
//             RERUN=0,                   * 1=THIS IS A RERUN         *         
//             HNB1='BRRR',               *I/P .CAT511.ACATTRNS   GDG *         
//             HNB2='S2.XXX',             *I/P .BNADT05.ADTCUS   VSAM *         
//             NAV='BNAXXX'               *I/P .BNA34.NAFILEA    VSAM *         
//*********************************************************************         
//*CAT515: PROCESS ACATS TRANSACTIONS 'AT' RECORD TYPES    -UPDATE DB2*         
//*********************************************************************         
//STEP30  EXEC CAT515,                                                          
//             BYP1=0,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=0,                    * 1=BYPASS FILE CHECK       *         
//             RERUN=0,                   * 1=THIS IS A RERUN         *         
//             HNB1='BRRR',               *I/P .CAT511.ACATTRNS   GDG *         
//             HNB2='S2.XXX',             *I/P .BNW50.NTWREGOP   VSAM *         
//             HNB3='S2.XXX'              *I/P .MFRS.MFOPBR      VSAM *         
//*********************************************************************         
//*CAT517: PROCESS ACATS TRANSACTIONS 'FR' RECORD TYPES    -UPDATE DB2*         
//*********************************************************************         
//STEP40  EXEC CAT517,                                                          
//             BYP1=0,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=0,                    * 1=BYPASS FILE CHECK       *         
//             RERUN=0,                   * 1=THIS IS A RERUN         *         
//             HNB1='BRRR'                *I/P .CAT511.ACATTRNS   GDG *         
//*********************************************************************         
//*CAT518: LOAD ASSETS FOR PTR  DELIVERY TRANSFERS REQUESTS-UPDATE DB2*         
//*********************************************************************         
//STEP45  EXEC CAT518,                                                          
//             BYP1=0,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=0,                    * 1=BYPASS FILE CHECK       *         
//             RERUN=0,                   * 1=THIS IS A RERUN         *         
//             HNB1='S5.RRR',             *I/P .OMG36.BALNCAL    VSAM *         
//             HNB2='S5.RRR',             *I/P .OMG27.DPHLD1AL   VSAM *         
//             HNB3='S2.XXX',             *I/P .BSU40.MRGIMM     VSAM *         
//             HNB4='S2.XXX',             *I/P .BNW50.NTWMAST    VSAM *         
//             HNB5='S2.XXX',             *I/P .BNW50.NTWREGOP   VSAM *         
//             HNB6='SZ.ZZZ',             *I/P .MFRS.MFMSD       VSAM *         
//             HNB7='BRRR',               *I/P .CAT511.ACATTRNS   GDG *         
//             HNB9='S2.XXX',             *I/P .BNAT42.NACTAF    VSAM *         
//             HNBA='BRRR',               *O/P .CAT518.ACATDLVF   GDG *         
//             NAV='BNAXXX'               *I/P .BNA34.NAFILEA    VSAM *         
//*********************************************************************         
//*CAT519: LOAD ASSETS FOR FULL DELIVERY TRANSFERS REQUESTS-UPDATE DB2*         
//*********************************************************************         
//STEP50  EXEC CAT519,                                                          
//             BYP1=0,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=0,                    * 1=BYPASS FILE CHECK       *         
//             RERUN=0,                   * 1=THIS IS A RERUN         *         
//             HNB1='S5.RRR',             *I/P .OMG36.BALNCAL    VSAM *         
//             HNB2='S5.RRR',             *I/P .OMG27.DPHLD1AL   VSAM *         
//             HNB3='S2.XXX',             *I/P .BSU40.MRGIMM     VSAM *         
//             HNB4='S2.XXX',             *I/P .BNW50.NTWMAST    VSAM *         
//             HNB5='S2.XXX',             *I/P .BNW50.NTWREGOP   VSAM *         
//             HNB6='SZ.ZZZ',             *I/P .MFRS.MFMSD       VSAM *         
//             HNB7='BRRR',               *I/P .CAT511.ACATTRNS   GDG *         
//             HNB9='S2.XXX',             *I/P .BNAT42.NACTAF    VSAM *         
//             HNBA='BRRR',               *O/P .CAT519.ACATDLVF   GDG *         
//             CURFLE='POVX.BTS2.CMT15.CURFLE',                                 
//             NAV='BNAXXX'               *I/P .BNA34.NAFILEA    VSAM *         
//*********************************************************************         
//*CAT521: SUBMIT ASSETS IN CYCLE 2                                   *         
//*********************************************************************         
//STEP60  EXEC CAT521,                                                          
//             STREAM=R,                  * STREAM INDICATOR          *         
//             HNB1='BRRR'                *I/P .CAT511.ACATTRNS   GDG *         
//**********************************************************************        
//* CREATE F/R FOR FULL RECEIVE ACCELERATED ITEMS                               
//**********************************************************************        
//STEP70  EXEC CAT575A,                                                         
//             B1FIL='BZZZ.B1FL.PROD',                                          
//             HNB=BRRR,                                                        
//             ID='ID.',           INTRA-DAY FILES                              
//             STRM=R                                                           
//CAT575A.INFILE DD DSN=&HNB..CAT511.ACATTRNS(+1),DISP=SHR                      
//**********************************************************************        
//STEP90  EXEC CAT575,                                                          
//             B1FIL='BZZZ.B1FL.PROD',                                          
//             CYCLE=CAT575A,                                                   
//             GENP1='(+1)',                                                    
//             GENP2='(+1)',                                                    
//             HNB=BRRR,                                                        
//             HNB1='S2.XXX',             *I/P NTWREGOP,NTWMAST,MFEXBR*         
//             HNO=S5,                                                          
//             ID='ID.',           INTRA-DAY FILES                              
//             NAV=BNAXXX,                                                      
//             STRM=RRR                                                         
//*                                                                             
//*********************************************************************         
//* CREATE ACATS FEES, LIQUIDATE PRIVATE FUNDS AND FRACTIONAL QTYS.   *         
//* THIS IS AN UPDATE JOB AND MUST BE RESTARTED CAREFULLY:            *         
//* ABENDS IN STEPS SORT10, CAT820, AND CAT820MG MAY BE RESTARTED     *         
//* IN THE ABENDING STEP.                                             *         
//* ABENDS IN STEP CAT820DB MUST BE RESEARCHED.  IF THE CAT820DB      *         
//* SYSOUT CONTAINS ONE OR MORE OF THE FOLLOWING COMMIT MESSAGES, THE *         
//* RESTART PARMS MUST BE CHANGED AND THE JOB RESTARTED IN THIS STEP. *         
//*                                                                   *         
//*    CAT820DB: SQL COMMIT OK. INP-CNT= 000000010 PREV-CNT=          *         
//*     LAST CASH KEY PROCESSED 04219992070006972023312107900         *         
//*                                                                   *         
//*    CHANGE RESTART='YES' AND RSKEY TO HAVE FIRST 17 BYTES OF THE   *         
//*    LAST OCCURANCE OF SYSOUT MSG "LAST CASH KEY PROCESSED".        *         
//*           RSKEY='04219992070006972',                              *         
//*                                                                   *         
//*   ABENDS IN CAT820DB NOT CONTAINING THE COMMIT MSG, LEAVE PARM    *         
//*            RESTART='NO ' AND RESTART IN THIS STEP.                *         
//*********************************************************************         
//*                                                                             
//STEP80  EXEC CAT820,                                                          
//             STREAM=X,                  *1 BYTE BATCH STREAM ID     *         
//             HNB='BRRR',                *O/P .CAT820.FILES      GDG *         
//             ID='ID.',                  *O/P INTRA DAY FILES        *         
//             NAV=BNAXXX,                                                      
//             SRMAS='BB.XXX.BSU40.SRMAS',                                      
//             REGOPV='S2.XXX.BNW50.NTWREGOP',                                  
//             RESTART='NO ',             *RESTART DB2 ABEND YES NO             
//             RSKEY='00012345678901234', *RESTART KEY - CLIENT CNTL  *         
//             B1FIL='BZZZ.B1FL.PROD',                                          
//             RUNDATE='RERUN.EARLY.'                                           
//SORT10.SORTIN DD DSN=&HNB..CAT518.ACATDLVF(+1),DISP=SHR                       
//         DD DSN=&HNB..CAT519.ACATDLVF(+1),DISP=SHR                            
//         DD DUMMY                                                             
//CAT820.CASHADJ DD DSN=&HNB..CAT820.&ID.CSHADJ.TMP&GENP1                       
//CAT820.P2BKPG  DD DSN=&HNB..CAT820.&ID.P2FEE.TMP&GENP1                        
//CAT820.TACT    DD DSN=&HNB..CAT820.&ID.TACT.TMP&GENP1                         
//CAT820.RPT     DD DSN=&HNB..CAT820.&ID.LQRPI.TMP&GENP1                        
//CAT820MG.TFRSFLI DD DUMMY                                                     
//CAT820MG.FEEOLD  DD DSN=&HNB..CAT820.&ID.RET(0),DISP=SHR                      
//CAT820M2.TFRSFLI DD DUMMY                                                     
//CAT820M2.FEEOLD  DD DUMMY                                                     
//CAT820DB.CASHADJ DD DSN=&HNB..CAT820.&ID.CSHADJ.TMP&GENP1                     
//CAT820DB.OTHADJ DD DUMMY                                                      
//         DD DUMMY                                                             
//CAT820DB.CATMATH DD DUMMY                                                     
//CAT821.CASHADJ DD DSN=&HNB..CAT820.&ID.CSHADJ.TMP&GENP1                       
//*******************************************************************           
//*   MERGE INTRA DAY CSHADJ FILE WITH PRIOR CYCLE                              
//*******************************************************************           
//SORT110 EXEC SORT                                                             
//SORTLIST DD  SYSOUT=*                                                         
//SYSPRINT DD  SYSOUT=*                                                         
//SYSOUT   DD  SYSOUT=*                                                         
//SYSIN    DD  DSN=BISG.CARDLIB(COPY),DISP=SHR                                  
//SORTIN   DD  DSN=BRRR.CAT820.ID.CSHADJ(0),DISP=SHR                            
//         DD  DSN=BRRR.CAT820.ID.CSHADJ.TMP(+1),DISP=SHR                       
//SORTOUT  DD  DSN=BRRR.CAT820.ID.CSHADJ(+1),DISP=(NEW,CATLG),                  
//             DCB=(GDG,LRECL=120,RECFM=FB),                                    
//             SPACE=(CYL,(2,5),RLSE),UNIT=BATCH                                
//*******************************************************************           
//*   MERGE INTRA DAY FEE FILE WITH PRIOR CYCLE                                 
//*******************************************************************           
//SORT120 EXEC SORT                                                             
//SORTLIST DD  SYSOUT=*                                                         
//SYSPRINT DD  SYSOUT=*                                                         
//SYSOUT   DD  SYSOUT=*                                                         
//SYSIN    DD  DSN=BISG.CARDLIB(COPY),DISP=SHR                                  
//SORTIN   DD  DSN=BRRR.CAT820.ID.P2FEE(0),DISP=SHR                             
//         DD  DSN=BRRR.CAT820.ID.P2FEE.TMP(+1),DISP=SHR                        
//SORTOUT  DD  DSN=BRRR.CAT820.ID.P2FEE(+1),DISP=(NEW,CATLG),                   
//             DCB=(GDG,LRECL=120,RECFM=FB),                                    
//             SPACE=(CYL,(2,5),RLSE),UNIT=BATCH                                
//*******************************************************************           
//*   MERGE INTRA DAY TACT FILE WITH PRIOR CYCLE                                
//*******************************************************************           
//SORT130 EXEC SORT                                                             
//SORTLIST DD  SYSOUT=*                                                         
//SYSPRINT DD  SYSOUT=*                                                         
//SYSOUT   DD  SYSOUT=*                                                         
//SYSIN    DD  DSN=BISG.CARDLIB(COPY),DISP=SHR                                  
//SORTIN   DD  DSN=BRRR.CAT820.ID.TACTL(0),DISP=SHR                             
//         DD  DSN=BRRR.CAT820.ID.TACT.TMP(+1),DISP=SHR                         
//SORTOUT  DD  DSN=BRRR.CAT820.ID.TACTL(+1),DISP=(NEW,CATLG),                   
//    UNIT=BATCH,DCB=(GDG,LRECL=8004,RECFM=VB),SPACE=(CYL,(2,5),RLSE)           
//*******************************************************************           
//*   MERGE INTRA DAY REPORT FILE WITH PRIOR CYCLE                              
//*******************************************************************           
//SORT140 EXEC SORT                                                             
//SORTLIST DD  SYSOUT=*                                                         
//SYSPRINT DD  SYSOUT=*                                                         
//SYSOUT   DD  SYSOUT=*                                                         
//SYSIN    DD  DSN=BISG.CARDLIB(COPY),DISP=SHR                                  
//SORTIN   DD  DSN=BRRR.CAT820.ID.LQRPI(0),DISP=SHR                             
//         DD  DSN=BRRR.CAT820.ID.LQRPI.TMP(+1),DISP=SHR                        
//SORTOUT  DD  DSN=BRRR.CAT820.ID.LQRPI(+1),DISP=(NEW,CATLG),                   
//    UNIT=BATCH,DCB=(GDG,LRECL=143,RECFM=FB),SPACE=(CYL,(2,5),RLSE)            
//*******************************************************************           
//*   DELETE TMP FILES                                                          
//*******************************************************************           
//BR1401  EXEC IEFBR14                                                          
//DD01     DD  DSN=BRRR.CAT820.ID.CSHADJ.TMP(+1),DISP=(MOD,DELETE)              
//DD02     DD  DSN=BRRR.CAT820.ID.P2FEE.TMP(+1),DISP=(MOD,DELETE)               
//DD03     DD  DSN=BRRR.CAT820.ID.TACT.TMP(+1),DISP=(MOD,DELETE)                
//DD04     DD  DSN=BRRR.CAT820.ID.LQRPI.TMP(+1),DISP=(MOD,DELETE)               
//*********************************************************************         
//* CAT510B SET STATUS ON DATABASE TO INDICATE THAT                   *         
//*         THIS JOB/STREAM/CYCLE HAS FINISHED                        *         
//*********************************************************************         
//CAT510B EXEC CAT510B,                                                         
//             STREAM='R'                 * CLIENT STREAM             *         
