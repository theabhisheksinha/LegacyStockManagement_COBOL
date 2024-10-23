//CAT788SP PROC HNB1='BZZZ',              *I/P B***.SIAC0264.NDMS     *         
//             HNB2='BZZZ',               *O/P B***.CAT788SP.CL###    *         
//             BYP1=0,                    * 1=BYPASS DATE CHECK       *         
//             GEN='(0)',                 *I/P B***.SIAC0264.NDMS     *         
//             GENP1='(+1)',              *O/P B***.CAT788SP.CL####   *         
//             CL=000,                    *3 BYTE CLIENT NUMBER       *         
//             CBRS='0000',               *4 BYTE CBRS ACCOUNT NUMBER *         
//             GDG='GDG,',                                                      
//             UNIT='BATCH',                                                    
//             PRTCL1='*',                                                      
//             PRTCL2='Y',                                                      
//             REGSIZE=4M,                                                      
//             SPACE='(CYL,(10,10),RLSE)',                                      
//             RUNDATE=                                                         
//*                                                                             
//*********************************************************************         
//*   SPLIT COST BASIS TRANSACTION INPUT FILE FROM NSCC BY            *         
//*   BY CLEARING NUMBER.                                             *         
//*********************************************************************         
//*                                                                             
//CAT788SP EXEC PGM=CAT788SP,REGION=&REGSIZE,                                   
//            PARM='&CBRS&BYP1&CL'                                              
//STEPLIB  DD DSN=&RUNDATE.ADP.DATELIB,                                         
//            DISP=SHR                                                          
//INFILE   DD DSN=&HNB1..SIAC0264.NDMS&GEN,                     I/P             
//            DISP=SHR                                                          
//OUTFILE  DD DSN=&HNB2..CAT788SP.C&CL..CBRS0264&GENP1,         O/P             
//            DISP=(NEW,CATLG,DELETE),                                          
//            SPACE=&SPACE,                                                     
//            UNIT=&UNIT,                                                       
//            DCB=(&GDG.DSORG=PS,LRECL=4004,RECFM=VB)                           
//SYSOUT    DD SYSOUT=&PRTCL1                                                   
//SYSPRINT  DD SYSOUT=&PRTCL1                                                   
//SYSUDUMP  DD SYSOUT=&PRTCL2                                                   
//SYSABOUT  DD SYSOUT=&PRTCL2                                                   
