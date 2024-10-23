//CAT872  PROC CAT872=,                                                         
//          REG=2M,                                                             
//          HNB=,                      UNIVERSAL STREAM PREFIX          00033000
//          HNB1=PBSQ,                 UNIVERSAL STREAM PREFIX          00033000
//          STREAM=,                                                            
//          PARM872='N',                                                        
//          DB2SYS='DB2PROD',          DB2PROD/DB2TEST                          
//          DB2SYS1='DB2PROD',            DB2PROD/DB2TEST                       
//          CARDLIB='BISG.CARDLIB',    DB2 PLAN CARDLIB                         
//          PLAN='ACTBTCH',                                                     
//          RUNDATE=,                                                           
//          B1HDR='BZZZ.B1FL',                                                  
//          GEN='(0)',                                                          
//          GENP='(+1)',                                                        
//          PLYD='Y',                                                           
//          TMP=TMP,                                                    00028104
//          UNIT=BATCH                                                          
//*                                                                             
//********************************************************************  00058700
//SORT10   EXEC PGM=SORT,REGION=4M                                      00058800
//SYSPRINT DD SYSOUT=*                                                  00058900
//SYSOUT   DD SYSOUT=*                                                  00059000
//SORTLIST DD SYSOUT=*                                                  00059106
//SYSUDUMP DD SYSOUT=&PLYD                                              00051106
//SORTIN   DD DSN=&HNB1..BMI30.ABAL&GEN,DISP=SHR,DCB=BUFNO=15           00059200
//SORTOUT  DD DSN=&HNB..CAT872.ABAL.&TMP&GENP,                          00059304
//         UNIT=&UNIT,SPACE=(CYL,(50,50),RLSE),                         00059400
//         DISP=(,CATLG,DELETE),                                        00059500
//         DCB=(GDG,BUFNO=10)                                           00059602
//SORTWK01 DD UNIT=SYSDA,SPACE=(CYL,(50,50),RLSE)                       00059700
//SORTWK02 DD UNIT=SYSDA,SPACE=(CYL,(50,50),RLSE)                       00059800
//SORTWK03 DD UNIT=SYSDA,SPACE=(CYL,(50,50),RLSE)                       00059900
//SORTWK04 DD UNIT=SYSDA,SPACE=(CYL,(50,50),RLSE)                       00060000
//SORTWK05 DD UNIT=SYSDA,SPACE=(CYL,(50,50),RLSE)                       00060100
//SORTWK06 DD UNIT=SYSDA,SPACE=(CYL,(50,50),RLSE)                       00060200
//SYSIN    DD DSN=BISG.CARDLIB(BMI28S10),DISP=SHR                       00060300
//* SORT FIELDS=(5,3,A,13,8,A,10,3,A,9,1,A),FORMAT=BI                   00060400
//********************************************************************  00060500
//*-------------------------------------------------------------------  00004000
//* THIS STEP FLAGS TRANSFERS WITH ACTIVITY FROM B204                   00005000
//*-------------------------------------------------------------------  00006000
//CAT872  EXEC PGM=CAT872&CAT872,                                               
//             PARM='&STREAM.&PARM872',                                         
//             REGION=&REG                                                      
//*                                                                             
//B1FIL    DD DSN=&B1HDR,DISP=SHR                                       00050000
//*                                                                     00052000
//STEPLIB  DD  DSN=&RUNDATE.ADP.DATELIB,DISP=SHR                I/P             
//         DD  DSN=DBSYS.CAF.LOADLIB,DISP=SHR                                   
//         DD  DSN=&DB2SYS..SDSNEXIT,DISP=SHR                                   
//         DD  DSN=&DB2SYS1..SDSNLOAD,DISP=SHR                                  
//AFFOPCA  DD  DSN=OPCA.AFFCARD,DISP=SHR                                        
//DSNPLAN  DD  DSN=&CARDLIB(&PLAN),DISP=SHR                                     
//*                                                                             
//INB204  DD DSN=&HNB..BPU50.B204&GEN,                                  00060000
//         DISP=SHR,DCB=BUFNO=10                                        00053200
//*                                                                     00100000
//ACCTBAL DD DSN=&HNB..CAT872.ABAL.&TMP&GENP,                           00053100
//         DISP=(OLD,DELETE,KEEP),DCB=BUFNO=10                          00053200
//*                                                                     00053300
//TRANRPT DD DSN=&HNB..CAT872.ACTPI&GENP,                               00110000
//        DISP=(,CATLG,DELETE),                                         00120000
//        UNIT=&UNIT,SPACE=(CYL,(20,20),RLSE),                          00130000
//        DCB=(GDG,BUFNO=4)                                             00140000
//SYSOUT   DD  SYSOUT=*                                                 00360000
//SYSPRINT DD  SYSOUT=*                                                 00370000
//SYSUDUMP DD  SYSOUT=&PLYD                                             00381000
//*                                                                             
//****** END OF PROCEDURE                                                       
