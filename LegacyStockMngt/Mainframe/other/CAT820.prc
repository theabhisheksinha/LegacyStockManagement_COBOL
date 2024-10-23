//CAT820   PROC CARDLIB='BISG.CARDLIB',    *DB2 PLAN CARDLIB          *         
//             DB2SYS='DB2PROD',          *DB2 SYSTEM DB2PROD/DB2TEST *         
//             PLAN='ACTBTCH',            *DB2 PLAN CARDLIB MEMBER    *         
//             HNB=,                      *O/P .CAT820.FILES      GDG *         
//             HNB2=BZZZ,                 *O/P .CAT820.FILES      GDG *         
//             STREAM=,                   *1 BYTE STREAM ID                     
//             ID=,                       *INTRA-DAY='ID.'/NIGHT=     *         
//             RESTART='NO ',             *RESTART DB2 ABEND YES NO OTH         
//             RSKEY='00012345678901234', *RESTART KEY - CLIENT CNTL *          
//             REGOPV=NULLFILE,                                                 
//             SRMAS=NULLFILE,                                                  
//             NAV=,                                                            
//             MSDPRE='POVZ.PMSD',        *MSD FILE PREFIX            *         
//             MSDSUF=,                   *MSD FILE SUFFIX .DUPE/BLANK*         
//             MSDCLT='BB.ZZZ.BMS90.MSDCLT.DUPE',  MSD SINGLE CLIENT  *         
//             B1FIL='BZZZ.B1FL',                                               
//             GDG='GDG,',                                            *         
//             GEN='(0)',                 *I/P                        *         
//             DUMMY='DUMMY,',                                                  
//             GENP1='(+1)',              *O/P                        *         
//             GENP2='(+2)',              *O/P                        *         
//             GENP3='(+3)',              *O/P                        *         
//             UNIT='BATCH',                                                    
//             PRTCL1='*',                                                      
//             PRTCL2='Y',                                                      
//             REGSIZE=8M,                                                      
//             SPACE1='(CYL,(5,10),RLSE)', *O/P .CAT820.ACATDLVF GDG *          
//             SPACE2='(CYL,(5,10),RLSE)', *O/P .CAT820.CSHADJ   GDG *          
//             SPACE3='(CYL,(5,10),RLSE)', *O/P .CAT820.P2BKPG   GDG *          
//             SPACE4='(CYL,(5,10),RLSE)', *O/P .CAT820.TACT     GDG *          
//             SPACE5='(CYL,(5,10),RLSE)', *O/P .CAT820.RET.TMP  GDG *          
//             SPACE6='(CYL,(5,10),RLSE)', *O/P .CAT820.LIQRPT   GDG *          
//             SPACE7='(CYL,(5,10),RLSE)', *O/P .CAT820.RET      GDG *          
//             SPACE8='(CYL,(5,10),RLSE)', *O/P .CAT820.MATH     GDG *          
//             TMP=TMP,                                                         
//             RUNDATE=                                                         
//*                                                                             
//*********************************************************************         
//* SORT ACATDLVF FILE INTO CLIENT/ACAT/REC TYPE SEQUENCE.            *         
//*********************************************************************         
//SORT10  EXEC PGM=SORT,                                                00522000
//             REGION=4M,                                               00523000
//             PARM='SIZE=4M,MSG=AP'                                    00524000
//SORTIN    DD DSN=&HNB..CAT810.ACATDLVF&GEN,                           00524100
//             DISP=SHR,DCB=BUFNO=5                                     00526000
//          DD DSN=&HNB..CAT812.ACATDLVF&GEN,                           00524100
//             DISP=SHR,DCB=BUFNO=5                                     00526000
//          DD &DUMMY.DSN=&HNB2..CAT810.ACATDLVF&GEN,                   00524100
//             DISP=SHR,DCB=BUFNO=5                                     00526000
//          DD &DUMMY.DSN=&HNB2..CAT812.ACATDLVF&GEN,                   00524100
//             DISP=SHR,DCB=BUFNO=5                                     00526000
//SORTOUT   DD DSN=&HNB..CAT820.&ID.ACATDLVF.&TMP&GENP1,                00527100
//             DISP=(NEW,CATLG,DELETE),                                 00528000
//             UNIT=&UNIT,                                              00529000
//             SPACE=&SPACE1,                                           00529100
//             DCB=(&GDG.BUFNO=5)                                       00529200
//SORTLIST  DD SYSOUT=&PRTCL1                                           00529300
//*                                                                             
//* SORT FIELDS=(1,17,CH,A,66,1,CH,A)                                   00020001
//SYSIN     DD DSN=BISG.CARDLIB(CAT820S1),                              00529400
//             DISP=SHR                                                 00529500
//SYSOUT    DD SYSOUT=&PRTCL1                                                   
//SYSUDUMP  DD SYSOUT=&PRTCL2                                                   
//*                                                                     00529800
//*********************************************************************         
//* ACAT FEES, TYPE3 BALANCE MOVEMENT AND FRACTIONAL QTY LIQUIDATION.           
//*    CREATE CASH ADJUSTMENT FILE (TO BE APPLIED TO DATABASE LATER)            
//*    ALONG WITH BOOKKEPPING AND TRADE (TACT) FILES.                           
//*********************************************************************         
//*                                                                             
//CAT820 EXEC PGM=CAT820,                                                       
//             REGION=&REGSIZE,                                                 
//             PARM='&STREAM&ID'                                                
//STEPLIB   DD DSN=&RUNDATE.ADP.DATELIB,                                        
//             DISP=SHR                                                         
//*                                                                             
//B1FIL    DD  DSN=&B1FIL,                                      I/P             
//             DISP=SHR                                                         
//*                                                                             
//TFRSFLI   DD  DSN=&HNB..CAT820.&ID.ACATDLVF.&TMP&GENP1,       I/P             
//             DISP=SHR                                                         
//REGOPV   DD  DSN=&REGOPV,                                     I/P             
//             DISP=SHR                                                         
//FIDSRREF DD DSN=BB.ZZZ.BSU10A.SRXREF,DISP=SHR                 I/P             
//FIDVMSR  DD  DSN=&SRMAS,                                      I/P             
//             DISP=SHR,                                                        
//             AMP=('BUFNI=40,BUFND=5')                                         
//NAFILEA  DD  DSN=&NAV..BNA34.NAFILEA,                         I/P             
//             DISP=SHR,                                                        
//             AMP=('BUFND=12,BUFNI=2')                                         
//*                                                                             
//NAFILEI  DD  DSN=&NAV..BNA34.NAFILEI,                         I/P             
//             DISP=SHR,                                                        
//             AMP=('BUFND=12,BUFNI=2')                                         
//*                                                                             
//FIDMSD   DD  DSN=&MSDPRE..BMS90.MSDFILE&MSDSUF,               I/P             
//             DISP=SHR,                                                        
//             AMP='BUFNI=50,BUFND=90'                                          
//FIDXRF   DD  DSN=&MSDPRE..BMS90.MSDXRF&MSDSUF,                I/P             
//             DISP=SHR,                                                        
//             AMP='BUFNI=50,BUFND=90'                                          
//FIDCLT    DD DSN=&MSDCLT,                                     I/P             
//             DISP=SHR,                                                        
//             AMP=('BUFNI=8,BUFND=4')                                          
//*                                                                             
//PAPERFEE  DD DSN=NULLFILE                                     I/P             
//*                                                                             
//CASHADJ  DD DSN=&HNB..CAT820.&ID.CSHADJ&GENP1,                                
//         DISP=(,CATLG,DELETE),                                                
//         UNIT=&UNIT,                                                          
//         SPACE=&SPACE2,                                                       
//         DCB=(&GDG.RECFM=FB,LRECL=120)                                        
//*                                                                             
//P2BKPG   DD DSN=&HNB..CAT820.&ID.P2FEE&GENP1,                                 
//         DISP=(,CATLG,DELETE),                                                
//         UNIT=&UNIT,                                                          
//         SPACE=&SPACE3,                                                       
//         DCB=(&GDG.RECFM=FB,LRECL=120)                                        
//*                                                                             
//TACT     DD DSN=&HNB..CAT820.&ID.TACTL&GENP1,                                 
//         DISP=(,CATLG,DELETE),                                                
//         UNIT=&UNIT,                                                          
//         SPACE=&SPACE4,                                                       
//         DCB=(&GDG.RECFM=VB,LRECL=8004)                                       
//*                                                                             
//RETAIN   DD DSN=&HNB..CAT820.&ID.RET.&TMP&GENP1,                              
//         DISP=(,CATLG,DELETE),                                                
//         UNIT=&UNIT,                                                          
//         SPACE=&SPACE5,                                                       
//         DCB=(&GDG.RECFM=VB,LRECL=644)                                        
//*                                                                             
//RPT      DD DSN=&HNB..CAT820.&ID.LQRPI&GENP1,                                 
//         DISP=(,CATLG,DELETE),                                                
//         UNIT=&UNIT,                                                          
//         SPACE=&SPACE6,                                                       
//         DCB=(&GDG.RECFM=FB,LRECL=143)                                        
//*                                                                             
//SYSOUT    DD SYSOUT=&PRTCL1                                                   
//SYSUDUMP  DD SYSOUT=&PRTCL2                                                   
//SYSABOUT  DD SYSOUT=&PRTCL2                                                   
//*                                                                             
//*********************************************************************         
//****     MERGE AND DROP MATCHED RECORDS FROM THE RETAIN FEE FILE.   *         
//*********************************************************************         
//CAT820MG EXEC PGM=CAT820MG                                            00522000
//STEPLIB   DD DSN=&RUNDATE.ADP.DATELIB,                                        
//             DISP=SHR                                                         
//          DD DSN=DBSYS.CAF.LOADLIB,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS..GROUP.SDSNEXIT,                                     
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS..GROUP.SDSNLOAD,                                     
//             DISP=SHR                                                         
//AFFOPCA   DD DSN=OPCA.AFFCARD,                               *FOR DB2         
//             DISP=SHR                                                         
//DSNPLAN   DD DSN=&CARDLIB(&PLAN),                            *FOR DB2         
//             DISP=SHR                                                         
//*                                                                             
//TFRSFLI   DD  DSN=&HNB..CAT820.&ID.ACATDLVF.&TMP&GENP1,                       
//             DISP=SHR                                                         
//FEEOLD    DD DSN=&HNB..CAT670.RET&GEN,DISP=SHR                                
//FEENEW    DD DSN=&HNB..CAT820.&ID.RET.&TMP&GENP2,                     00527100
//             DISP=(NEW,CATLG,DELETE),                                 00528000
//             UNIT=&UNIT,                                              00529000
//             SPACE=&SPACE7,                                           00529100
//             DCB=(&GDG.RECFM=VB,LRECL=644)                                    
//SYSOUT    DD SYSOUT=&PRTCL1                                                   
//SYSUDUMP  DD SYSOUT=&PRTCL2                                                   
//SYSABOUT  DD SYSOUT=&PRTCL2                                                   
//*                                                                             
//*********************************************************************         
//****   MERGE AND DROP MATCHED INTRA DAY RECORDS FROM THE FEE FILE.  *         
//****   THE FEES WERE BUILT INTRA DAY ON DAY 1, AND IF THE ASSETS    *         
//****   SUBMITTED ON DAY 1, THEN RETAIN THESE FEES RECORDS, OTHERWISE*         
//****   THE FEES WERE REBUILT NIGHT 1, ON THE TMP(+2) FILE ABOVE.    *         
//*********************************************************************         
//CAT820M2 EXEC PGM=CAT820MG                                            00522000
//STEPLIB   DD DSN=&RUNDATE.ADP.DATELIB,                                        
//             DISP=SHR                                                         
//          DD DSN=DBSYS.CAF.LOADLIB,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS..GROUP.SDSNEXIT,                                     
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS..GROUP.SDSNLOAD,                                     
//             DISP=SHR                                                         
//AFFOPCA   DD DSN=OPCA.AFFCARD,                               *FOR DB2         
//             DISP=SHR                                                         
//DSNPLAN   DD DSN=&CARDLIB(&PLAN),                            *FOR DB2         
//             DISP=SHR                                                         
//*                                                                             
//TFRSFLI   DD  DSN=&HNB..CAT820.&ID.ACATDLVF.&TMP&GENP1,                       
//             DISP=SHR                                                         
//FEEOLD    DD DSN=&HNB..CAT670.ID.RET(0),DISP=SHR                              
//FEENEW    DD DSN=&HNB..CAT820.&ID.RET.&TMP&GENP3,                     00527100
//             DISP=(NEW,CATLG,DELETE),                                 00528000
//             UNIT=&UNIT,                                              00529000
//             SPACE=&SPACE7,                                           00529100
//             DCB=(&GDG.RECFM=VB,LRECL=644)                                    
//SYSOUT    DD SYSOUT=&PRTCL1                                                   
//SYSUDUMP  DD SYSOUT=&PRTCL2                                                   
//SYSABOUT  DD SYSOUT=&PRTCL2                                                   
//*                                                                             
//*********************************************************************         
//****     MERGE THE NEW OUTPUT WITH THE PREVIOUS DAYS LEFTOVERS      *         
//*********************************************************************         
//SORT20  EXEC PGM=SORT,                                                00522000
//             REGION=4M,                                               00523000
//             PARM='SIZE=4M,MSG=AP'                                    00524000
//SORTLIST  DD SYSOUT=&PRTCL1                                           00529300
//SORTIN01  DD DSN=&HNB..CAT820.&ID.RET.&TMP&GENP1,                             
//             DISP=(OLD,DELETE,KEEP)                                           
//SORTIN02  DD DSN=&HNB..CAT820.&ID.RET.&TMP&GENP2,                             
//             DISP=(OLD,DELETE,KEEP)                                           
//SORTIN03  DD DSN=&HNB..CAT820.&ID.RET.&TMP&GENP3,                             
//             DISP=(OLD,DELETE,KEEP)                                           
//SORTOUT   DD DSN=&HNB..CAT820.&ID.RET&GENP1,                          00527100
//             DISP=(NEW,CATLG,DELETE),                                 00528000
//             UNIT=&UNIT,                                              00529000
//             SPACE=&SPACE7,                                           00529100
//             DCB=(&GDG.RECFM=VB,LRECL=644)                                    
//*  MERGE FIELDS=(5,3,CH,A,16,14,CH,A)   CLIENT,CONTROL NBR                    
//SYSIN     DD DSN=BISG.CARDLIB(CAT820S2),DISP=SHR                      00180000
//SYSOUT    DD SYSOUT=&PRTCL1                                                   
//SYSUDUMP  DD SYSOUT=&PRTCL2                                                   
//*                                                                             
//*********************************************************************         
//*    APPLY CASH ADJUSTMENTS TO ACAT DATABASE.                                 
//*********************************************************************         
//*                                                                     00002   
//CAT820DB EXEC PGM=CAT820DB,                                           00051002
//             PARM='&RESTART,&RSKEY,&ID',                                      
//             REGION=&REGSIZE                                                  
//STEPLIB   DD DSN=&RUNDATE.ADP.DATELIB,                                        
//             DISP=SHR                                                         
//          DD DSN=DBSYS.CAF.LOADLIB,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS..GROUP.SDSNEXIT,                                     
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS..GROUP.SDSNLOAD,                                     
//             DISP=SHR                                                         
//AFFOPCA   DD DSN=OPCA.AFFCARD,                               *FOR DB2         
//             DISP=SHR                                                         
//DSNPLAN   DD DSN=&CARDLIB(&PLAN),                            *FOR DB2         
//             DISP=SHR                                                         
//B1FIL    DD  DSN=&B1FIL,                                      I/P             
//             DISP=SHR                                                         
//CASHADJ   DD DSN=&HNB..CAT820.&ID.CSHADJ&GENP1,               I/P     00056500
//             DISP=SHR                                                         
//OTHADJ    DD DSN=PBS&STREAM..BMI40J.OACATFL&GEN,              I/P     00056500
//             DISP=SHR                                                         
//          DD DSN=&HNB..CAT814.ACATCSH&GEN,          *CONVENIENCE ACCTS00056500
//             DISP=SHR                                                         
//          DD &DUMMY.DSN=&HNB2..CAT814.ACATCSH&GEN,                    00524100
//             DISP=SHR                                                         
//CATMATH   DD DSN=&HNB..CAT820DB.&ID.MATH&GENP1,               O/P             
//          DISP=(,CATLG,DELETE),                                               
//          UNIT=&UNIT,                                                         
//          SPACE=&SPACE8,                                                      
//          DCB=(&GDG.RECFM=FB,LRECL=100)                                       
//SYSOUT    DD SYSOUT=&PRTCL1                                                   
//SYSPRINT  DD SYSOUT=&PRTCL1                                                   
//SYSUDUMP  DD SYSOUT=&PRTCL2                                                   
//SPIESNAP  DD SYSOUT=&PRTCL2                                                   
//SYSABOUT  DD SYSOUT=&PRTCL2                                                   
//*                                                                     00521000
//*********************************************************************         
//* CREATE ASCENDIS MATH FILE HAVING FEES, FRACTIONAL QTY LIQUIDATION           
//* MONEY MARKETS DELIVERED AS CASH, TYPE3 BALANCES DELIVERED AS TYPE1.         
//* AT NIGHT, OLMI MONEY ADJUSTMENTS ARE CREATED ABOVE IN CAT820DB.             
//*********************************************************************         
//*                                                                             
//CAT821 EXEC PGM=CAT821,                                                       
//             REGION=&REGSIZE,                                                 
//             PARM='&STREAM&ID'                                                
//STEPLIB   DD DSN=&RUNDATE.ADP.DATELIB,                                        
//             DISP=SHR                                                         
//*                                                                             
//B1FIL    DD  DSN=&B1FIL,                                      I/P             
//             DISP=SHR                                                         
//*                                                                             
//TFRSFLI   DD DSN=&HNB..CAT820.&ID.ACATDLVF.&TMP&GENP1,        I/P             
//             DISP=SHR                                                         
//CASHADJ   DD DSN=&HNB..CAT820.&ID.CSHADJ&GENP1,               I/P             
//             DISP=SHR                                                         
//OTHADJ    DD DSN=PBS&STREAM..BMI40J.OACATFL&GEN,              I/P     00056500
//             DISP=SHR                                                         
//CATMATH   DD DSN=&HNB..CAT821.&ID.MATH&GENP1,                 O/P             
//          DISP=(,CATLG,DELETE),                                               
//          UNIT=&UNIT,                                                         
//          SPACE=&SPACE8,                                                      
//          DCB=(&GDG.RECFM=FB,LRECL=100)                                       
//SYSOUT    DD SYSOUT=&PRTCL1                                                   
//SYSUDUMP  DD SYSOUT=&PRTCL2                                                   
//SYSABOUT  DD SYSOUT=&PRTCL2                                                   
