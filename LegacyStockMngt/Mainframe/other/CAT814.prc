//CAT814  PROC STREAM=A,                  * STREAM=? CLIENT STREAM IND*         
//             BYP1=0,                    * BYP1=1 BYPASS DATE CHECK  *         
//             BYP2=0,                    * BYP2=1 BYPASS FILE CHECK  *         
//             B1HDR='BZZZ.B1FL',         *I/P B1 VSAM FILE           *         
//             GDGA='GDG,',               *O/P .CAT814.ACATCSH        *         
//             GDGB='GDG,',               *O/P .CAT814.BKPPG          *         
//             GEN00A='(+1)',             *I/P .CAT814DB.ACATBNK      *         
//             GENP1A='(+1)',             *O/P .CAT814.ACATCSH        *         
//             GENP1B='(+1)',             *O/P .CAT814.BKPPG          *         
//             HNB1='BAAA',               *I/P .CAT814DB.ACATBNK  GDG *         
//             HNB2='BAAA',               *O/P .CAT814.ACATCSH    GDG *         
//             HNB3='BAAA',               *O/P .CAT814.BKPPG      GDG *         
//             PRTCL1='*',                *                           *         
//             PRTCL2='Y',                *                           *         
//             REGSIZE=8M,                *                           *         
//             RUNDATE=,                  *                           *         
//             SPACE1='(CYL,(1,1),RLSE)',    *O/P .CAT814.ACATCSH GDG *         
//             SPACE2='(CYL,(1,1),RLSE)',    *O/P .CAT814.BKPPG   GDG *         
//             SPACE3='(CYL,(1,1),RLSE)',    *O/P .CAT814.TACTL   GDG *         
//             UNIT='BATCH'                                                     
//*                                                                             
//*********************************************************************         
//* CAT814 - CONVENIENCE ACCOUNTS PROCESSING                          *         
//*          CREATE BOOKKEEPING AND CASH ASSET ADJUSTMENTS            *         
//*********************************************************************         
//CAT814   EXEC PGM=CAT814,                                                     
//             PARM='&STREAM&BYP1&BYP2',                                        
//             REGION=&REGSIZE                                                  
//STEPLIB   DD DSN=&RUNDATE.ADP.DATELIB,                                        
//             DISP=SHR                                                         
//B1FIL     DD DSN=&B1HDR,                                          I/P         
//             DISP=SHR                                                         
//ACATBNK   DD DSN=&HNB1..CAT814DB.ACATBNK&GEN00A,                  I/P         
//             DISP=SHR                                                         
//ACATCSH   DD DSN=&HNB2..CAT814.ACATCSH&GENP1A,                    O/P         
//             DISP=(NEW,CATLG,DELETE),                                         
//             SPACE=&SPACE1,                                                   
//             UNIT=&UNIT,                                                      
//             DCB=(&GDGA.DSORG=PS,LRECL=100,RECFM=FB,BLKSIZE=27900)            
//BKPPG     DD DSN=&HNB3..CAT814.BKPPG&GENP1B,                      O/P         
//             DISP=(NEW,CATLG,DELETE),                                         
//             SPACE=&SPACE2,                                                   
//             UNIT=&UNIT,                                                      
//             DCB=(&GDGB.DSORG=PS,LRECL=120,RECFM=FB,BLKSIZE=27960)            
//TACT     DD DSN=&HNB3..CAT814.TACTL&GENP1B,                       O/P         
//             DISP=(NEW,CATLG,DELETE),                                         
//             SPACE=&SPACE3,                                                   
//             UNIT=&UNIT,                                                      
//             DCB=(&GDGB.RECFM=VB,LRECL=8004)                                  
//SYSOUT    DD SYSOUT=&PRTCL1                                                   
//SYSPRINT  DD SYSOUT=&PRTCL1                                                   
//SYSUDUMP  DD SYSOUT=&PRTCL2                                                   
//SPIESNAP  DD SYSOUT=&PRTCL2                                                   
//SYSABOUT  DD SYSOUT=&PRTCL2                                                   
//*                                                                             
