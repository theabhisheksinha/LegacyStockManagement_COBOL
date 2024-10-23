//CAT580  PROC CAT580=,                                                         
//             STREAM=Z,                  *1 BYTE BATCH STREAM ID     *         
//             BYP1=0,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=0,                    * 1=BYPASS FILE CHECK       *         
//             BYP3=0,                    * 1=BYPASS RECORD COUNT <100*         
//             HNB=BZZZ,                                                        
//             HNB1='BB.ZZZ',                                                   
//             UNIT=BATCH,                                                      
//             GENP='(+1)',                                                     
//             B1HDR='BZZZ.B1FL.PROD',    *I/P B1 VSAM FILE           *         
//             INF='BZZZ.SIAC0720.ACAT.FUND(0)',  *I/P FROM NSCC/SIAC *         
//             CARDLIB='BISG.CARDLIB',    *DB2 PLAN CARDLIB           *         
//             DB2SYS='DB2PROD',          *DB2 SYSTEM DB2PROD/DB2TEST *         
//             PLAN='ACTBTCH',            *DB2 PLAN CARDLIB MEMBER    *         
//             DB2SYS1='DB2PROD',         *DB2 SYSTEM DB2PROD/DB2TEST *         
//             MSDPRE='BB.ZZZ',           *MSD FILE PREFIX BB/QSYAV   *         
//             MSDSUF='.DUPE',            *MSD FILE SUFFIX .DUPE/BLANK*         
//             MSDCLT='BB.ZZZ.BMS90.MSDCLT.DUPE',  MSD SINGLE CLIENT  *         
//             PRTCL1='*',                                                      
//             PRTCL2='Y',                                                      
//             REGSIZE=8M,                                                      
//             RUNDATE='RERUN.EARLY.'                                           
//*                                                                             
//*********************************************************************         
//*                                                                   *         
//* PROCESS SIAC0720 TRANSMISSION FROM NSCC AND UPDATE FUND/SERV      *         
//* STAT TABLE                                                        *         
//*                                                                   *         
//*********************************************************************         
//*                                                                             
//CAT580  EXEC PGM=CAT580&CAT580,                                               
//             PARM='&STREAM&BYP1&BYP2&BYP3',                                   
//             REGION=&REGSIZE                                                  
//STEPLIB   DD DSN=&RUNDATE.ADP.DATELIB,                                        
//             DISP=SHR                                                         
//          DD DSN=DBSYS.CAF.LOADLIB,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS..SDSNEXIT,                                           
//             DISP=SHR                                                         
//          DD DSN=&DB2SYS1..SDSNLOAD,                                          
//             DISP=SHR                                                         
//AFFOPCA   DD DSN=OPCA.AFFCARD,                               *FOR DB2         
//             DISP=SHR                                                         
//DSNPLAN   DD DSN=&CARDLIB(&PLAN),                            *FOR DB2         
//             DISP=SHR                                                         
//B1FIL     DD DSN=&B1HDR,                                          I/P         
//             DISP=SHR                                                         
//FIDMSD   DD  DSN=&MSDCLT,                                         I/P         
//             DISP=SHR,                                                        
//             AMP='BUFNI=50,BUFND=90'                                          
//FIDXRF   DD  DSN=&MSDPRE..BMS90.MSDXRF&MSDSUF,                    I/P         
//             DISP=SHR,                                                        
//             AMP='BUFNI=50,BUFND=90'                                          
//FIDCLT    DD DSN=&MSDCLT,                                         I/P         
//             DISP=SHR,                                                        
//             AMP=('BUFNI=8,BUFND=4')                                          
//INFILE   DD  DSN=&INF,                                            I/P         
//             DISP=SHR                                                         
//OSTATFL  DD  DSN=&HNB..CAT580.STATFL&GENP,                        I/P         
//             DISP=(,CATLG,DELETE),                                            
//             UNIT=&UNIT,                                                      
//             SPACE=(CYL,(5,5),RLSE),                                          
//             DCB=(GDG,RECFM=FB,LRECL=520)                                     
//SYSOUT    DD SYSOUT=&PRTCL1                                                   
//SYSPRINT  DD SYSOUT=&PRTCL1                                                   
//SYSUDUMP  DD SYSOUT=&PRTCL2                                                   
//SPIESNAP  DD SYSOUT=&PRTCL2                                                   
//SYSABOUT  DD SYSOUT=&PRTCL2                                                   
//*-------------------------------------------------------------------*         
//*                                                                             
//*                                                                             
//SORT1   EXEC PGM=SYNCSORT,                                                    
//             REGION=10M                                                       
//SORTIN    DD DSN=&HNB..CAT580.STATFL&GENP,                                    
//             DISP=SHR                                                         
//SORTOUT   DD DSN=&HNB..CAT580.STATFL.TMP,                                     
//             DISP=(,CATLG,DELETE),                                            
//             UNIT=&UNIT,                                                      
//             SPACE=(CYL,(10,15),RLSE)                                         
//SORTLIB   DD DSN=SYS1.SORTLIB,                                                
//             DISP=SHR                                                         
//SORTLIST  DD SYSOUT=*,                                                        
//             SPACE=(TRK,(1,1),RLSE)                                           
//$ORTPARM  DD DSN=BISG.CARDLIB(COREMAX),                                       
//             DISP=SHR                                                         
//SORTWK01  DD SPACE=(CYL,100),                                                 
//             UNIT=SYSDA                                                       
//SORTWK02  DD SPACE=(CYL,100),                                                 
//             UNIT=SYSDA                                                       
//SORTWK03  DD SPACE=(CYL,100),                                                 
//             UNIT=SYSDA                                                       
//SORTWK04  DD SPACE=(CYL,100),                                                 
//             UNIT=SYSDA                                                       
//SORTWK05  DD SPACE=(CYL,100),                                                 
//             UNIT=SYSDA                                                       
//SORTWK06  DD SPACE=(CYL,100),                                                 
//             UNIT=SYSDA                                                       
//SYSPRINT  DD SYSOUT=*                                                         
//SYSOUT    DD SYSOUT=*                                                         
//SYSIN     DD DSN=BISG.CARDLIB(CAT580S),DISP=SHR                               
//*                                                                             
//*                                                                             
//IDCAM01 EXEC PGM=IDCAMS                                                       
//DD1     DD  DSN=&HNB..CAT580.STATFL.TMP,                                      
//            DISP=(OLD,DELETE,KEEP)                                            
//DD2     DD  DSN=&HNB1..CAT580.STAT,                                           
//           DISP=OLD                                                           
//SYSPRINT DD SYSOUT=*                                                          
//SYSIN    DD DSN=BISG.CARDLIB(REPROREP),DISP=SHR                               
//*                                                                             
