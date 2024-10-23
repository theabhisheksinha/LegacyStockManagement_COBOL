//CAT761  PROC STREAM=A,                  *JOB STREAM                 *         
//             BYP1=1,                    *'1' BYPASS DATE CHECK      *         
//             BYP2=0,                    *'1' BYPASS EMPTY FILE      *         
//             B1HDR='BZZZ.B1FL',         *I/P B1 VSAM FILE           *         
//             CARDLIB='BISG.CARDLIB',                                          
//             GDGA='GDG,',               *O/P &HNB2.CAT761.ACTPI     *         
//             GEN00A='(+0)',             *I/P &HNB1.CAT500.ACATACTF  *         
//             GENP1A='(+1)',             *O/P &HNB2.CAT761.ACTPI     *         
//             HNB1='BAAA',               *I/P &HNB1.CAT500.ACATACTF  *         
//             HNB2='BAAA',               *O/P &HNB2.CAT761.ACTPI  GDG*         
//             DB2SYS='DB2PROD',         *DB2 SYSTEM DB2PROD/DB2TEST *          
//             DB2SYS1='DB2PROD',        *DB2 DB2PROD/DB2TEST        *          
//             PLAN='ACTBTCH',           *DB2 PLAN CARDLIB MEMBER    *          
//             REGSIZE=4M,                                                      
//             RUNDATE=,                                                        
//             SPACE='(CYL,(1,1),RLSE)',  *O/P SPACE               GDG*         
//             UNIT='BATCH'               *O/P UNIT                GDG*         
//*                                                                             
//*********************************************************************         
//*       CAT761A - ACATS AUDIT CONTROL REPORT EXTRACT                *         
//*********************************************************************         
//CAT761A  EXEC PGM=CAT761A,                                                    
//         PARM=&STREAM,                                                        
//         REGION=&REGSIZE                                                      
//STEPLIB  DD  DSN=&RUNDATE.ADP.DATELIB,                                        
//             DISP=SHR                                                         
//         DD  DSN=DBSYS.CAF.LOADLIB,                                           
//             DISP=SHR                                                         
//         DD  DSN=&DB2SYS..SDSNEXIT,                                           
//             DISP=SHR                                                         
//         DD  DSN=&DB2SYS1..SDSNLOAD,                                          
//             DISP=SHR                                                         
//AFFOPCA  DD  DSN=OPCA.AFFCARD,                                                
//             DISP=SHR                                                         
//DSNPLAN  DD  DSN=&CARDLIB(&PLAN),                                             
//             DISP=SHR                                                         
//B1FIL    DD  DSN=&B1HDR,                                       I/P            
//             DISP=SHR                                                         
//ACATACTF DD  DSN=&HNB2..CAT761A.ACATACTF&GENP1A,               O/P            
//             DISP=(NEW,CATLG,DELETE),                                         
//             SPACE=(CYL,(10,10),RLSE),                                        
//             UNIT=&UNIT,                                                      
//             DCB=(&GDGA.DSORG=PS,LRECL=200,RECFM=FB,BLKSIZE=27800)            
//SYSOUT   DD  SYSOUT=*                                                         
//SYSPRINT DD  SYSOUT=*                                                         
//SYSUDUMP DD  SYSOUT=Y                                                         
//SYSABOUT DD  SYSOUT=Y                                                         
//*                                                                             
//*********************************************************************         
//*       CAT761 - ACATS AUDIT CONTROL REPORT                         *         
//*********************************************************************         
//CAT761  EXEC PGM=CAT761,                                                      
//             PARM=&STREAM&BYP1&BYP2,                                          
//             REGION=&REGSIZE                                                  
//STEPLIB  DD  DSN=&RUNDATE.ADP.DATELIB,                                        
//             DISP=SHR                                                         
//B1FIL    DD  DSN=&B1HDR,                                       I/P            
//             DISP=SHR                                                         
//INFILE   DD  DSN=&HNB1..CAT500.ACATACTF(-4),DISP=SHR           I/P            
//         DD  DSN=&HNB1..CAT500.ACATACTF(-3),DISP=SHR           I/P            
//         DD  DSN=&HNB1..CAT500.ACATACTF(-2),DISP=SHR           I/P            
//         DD  DSN=&HNB1..CAT500.ACATACTF(-1),DISP=SHR           I/P            
//         DD  DSN=&HNB1..CAT500.ACATACTF&GEN00A,DISP=SHR        I/P            
//         DD  DSN=&HNB2..CAT761A.ACATACTF&GENP1A,DISP=SHR       I/P            
//ACTPI    DD  DSN=&HNB2..CAT761.ACTPI&GENP1A,                   O/P            
//             DISP=(NEW,CATLG,DELETE),                                         
//             SPACE=&SPACE,                                                    
//             UNIT=&UNIT,                                                      
//             DCB=(&GDGA.DSORG=PS,RECFM=FB,LRECL=143)                          
//SORTLIB  DD  DSN=SYS1.SORTLIB,                                                
//             DISP=SHR                                                         
//SORTWK01 DD  UNIT=SYSDA,                                                      
//             SPACE=(CYL,(50,50),RLSE)                                         
//SORTWK02 DD  UNIT=SYSDA,                                                      
//             SPACE=(CYL,(50,50),RLSE)                                         
//SORTWK03 DD  UNIT=SYSDA,                                                      
//             SPACE=(CYL,(50,50),RLSE)                                         
//SORTWK04 DD  UNIT=SYSDA,                                                      
//             SPACE=(CYL,(50,50),RLSE)                                         
//SORTWK05 DD  UNIT=SYSDA,                                                      
//             SPACE=(CYL,(50,50),RLSE)                                         
//SORTLIST DD  SYSOUT=*                                                         
//SYSOUT   DD  SYSOUT=*                                                         
//SYSPRINT DD  SYSOUT=*                                                         
//SYSUDUMP DD  SYSOUT=Y                                                         
//SYSABOUT DD  SYSOUT=Y                                                         
//*                                                                             
//*********************************************************************         
//*       CAT761P - ACATS AUDIT CONTROL REPORT PURGE                  *         
//*       DELETE EXTRACTED ROWS FROM AUDIT TABLE.                     *         
//*********************************************************************         
//CAT761P  EXEC PGM=CAT761P,                                                    
//         REGION=&REGSIZE                                                      
//STEPLIB  DD  DSN=&RUNDATE.ADP.DATELIB,                                        
//             DISP=SHR                                                         
//         DD  DSN=DBSYS.CAF.LOADLIB,                                           
//             DISP=SHR                                                         
//         DD  DSN=&DB2SYS..SDSNEXIT,                                           
//             DISP=SHR                                                         
//         DD  DSN=&DB2SYS1..SDSNLOAD,                                          
//             DISP=SHR                                                         
//AFFOPCA  DD  DSN=OPCA.AFFCARD,                                                
//             DISP=SHR                                                         
//DSNPLAN  DD  DSN=&CARDLIB(&PLAN),                                             
//             DISP=SHR                                                         
//ACATACTF DD  DSN=&HNB2..CAT761A.ACATACTF&GENP1A,               I/P            
//             DISP=SHR                                                         
//SYSOUT   DD  SYSOUT=*                                                         
//SYSPRINT DD  SYSOUT=*                                                         
//SYSUDUMP DD  SYSOUT=Y                                                         
//SYSABOUT DD  SYSOUT=Y                                                         
