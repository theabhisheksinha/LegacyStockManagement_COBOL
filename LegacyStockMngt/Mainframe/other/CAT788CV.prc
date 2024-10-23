//CAT788CV PROC GEN='(0)',                *I/P BZZZ.SIAC0264.NDMS     *         
//             GENP1='(+1)',              *O/P B***.CAT788CV.TAXLOT   *         
//             HNB1='BZZZ',               *I/P BZZZ.SIAC0264.NDMS     *         
//             HNB2='BUUU',               *O/P B***.CAT788.TAXLOT     *         
//             HNB3='BUUU',               *O/P B***.CAT788CV.TAXLOT   *         
//             GDG='GDG,',                                                      
//             UNIT='BATCH',                                                    
//             PRTCL1='*',                                                      
//             PRTCL2='Y',                                                      
//             REGSIZE=8M,                                                      
//             SPACE='(CYL,(10,10),RLSE)',                                      
//             RUNDATE=                                                         
//*                                                                             
//*********************************************************************         
//*   CONVERT CAT788.TAXLOT FILE BACK TO SIAC0264 FORMAT              *         
//*********************************************************************         
//*                                                                             
//CAT788CV EXEC PGM=CAT788CV,                                                   
//             REGION=&REGSIZE                                                  
//STEPLIB  DD DSN=&RUNDATE.ADP.DATELIB,                                         
//            DISP=SHR                                                          
//INCBRS   DD DSN=&HNB1..SIAC0264.NDMS&GEN,                     I/P             
//            DISP=SHR                                                          
//INFILE   DD DSN=&HNB2..CAT788.TAXLOT&GEN,                     I/P             
//            DISP=SHR                                                          
//OUTFILE  DD DSN=&HNB3..CAT788CV.CBRS0264&GENP1,               O/P             
//            DISP=(NEW,CATLG,DELETE),                                          
//            SPACE=&SPACE,                                                     
//            UNIT=&UNIT,                                                       
//            DCB=(&GDG.DSORG=PS,LRECL=4004,RECFM=VB)                           
//SYSOUT    DD SYSOUT=&PRTCL1                                                   
//SYSPRINT  DD SYSOUT=&PRTCL1                                                   
//SYSUDUMP  DD SYSOUT=&PRTCL2                                                   
//SPIESNAP  DD SYSOUT=&PRTCL2                                                   
//SYSABOUT  DD SYSOUT=&PRTCL2                                                   
