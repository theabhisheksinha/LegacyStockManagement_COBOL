//*********************************************************************         
//*  PROC CAT813 IS USED IN JOB CAT8100-                              *         
//*********************************************************************         
//CAT813  PROC STREAM=Z,                  *JOB STREAM                 *         
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
//             HNB1='BXXX',               *I/P &HNB1.CAT812.ACATRCRF  *         
//             HNB2='BXXX',               *O/P &HNB2.CAT813.RCRPI  GDG*         
//             HNB3='BXXX',               *O/P &HNB3.CAT813.NONPI  GDG*         
//             HNB4='BXXX',               *O/P &HNB4.CAT813.EXCPI  GDG*         
//             PERMUN='BATCH',            *O/P UNIT                GDG*         
//             REGSIZE=4M,                                                      
//             RUNDATE=,                                                        
//             SPACE='(CYL,(1,1),RLSE)'   *O/P SPACE               GDG*         
//*                                                                             
//*********************************************************************         
//*       CAT813 - ACATS RESIDUAL CREDIT (RCR) REPORT                 *         
//*********************************************************************         
//*                                                                             
//CAT813  EXEC PGM=CAT813,                                                      
//             PARM=&STREAM&BYP1&BYP2,                                          
//             REGION=&REGSIZE                                                  
//STEPLIB   DD DSN=&RUNDATE.ADP.DATELIB,                                        
//             DISP=SHR                                                         
//B1FIL     DD DSN=&B1HDR,                                       I/P            
//             DISP=SHR                                                         
//INFILE    DD DSN=&HNB1..CAT812.ACATRCRF&GEN00A,                I/P            
//             DISP=SHR                                                         
//RCRPI     DD DSN=&HNB2..CAT813.RCRPI&GENP1A,                   O/P            
//             DISP=(NEW,CATLG,DELETE),                                         
//             SPACE=&SPACE,                                                    
//             UNIT=&PERMUN,                                                    
//             DCB=(&GDGA.DSORG=PS,RECFM=FB,LRECL=143)                          
//NONPI     DD DSN=&HNB3..CAT813.NONPI&GENP1B,                   O/P            
//             DISP=(NEW,CATLG,DELETE),                                         
//             SPACE=&SPACE,                                                    
//             UNIT=&PERMUN,                                                    
//             DCB=(&GDGB.DSORG=PS,RECFM=FB,LRECL=143)                          
//EXCPI     DD DSN=&HNB4..CAT813.EXCPI&GENP1C,                   O/P            
//             DISP=(NEW,CATLG,DELETE),                                         
//             SPACE=&SPACE,                                                    
//             UNIT=&PERMUN,                                                    
//             DCB=(&GDGC.DSORG=PS,RECFM=FB,LRECL=143)                          
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
//SYSOUT    DD SYSOUT=*                                                         
//SYSPRINT  DD SYSOUT=*                                                         
//SYSUDUMP  DD SYSOUT=Y                                                         
//SPIESNAP  DD SYSOUT=Y                                                         
//SYSABOUT  DD SYSOUT=Y                                                         
//*                                                                             
