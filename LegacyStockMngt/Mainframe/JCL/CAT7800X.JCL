//CAT7800X JOB (BX0P,DY00),'ACAT TAXLOT SPLIT',CLASS=1,MSGCLASS=W,              
//         SCHENV=STREAMX,                                                      
//        USER=BX0P,SECLABEL=BISG                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//*                                                                             
//CA11    EXEC CA11                                                             
//*                                                                             
//*-------------------------------------------------------------------*         
//* CREATE TAX LOT ENGINE FEED OF EXISTING ACAT FULL DELIVERIES.      *         
//* THIS FILE IS USED TO REQUEST THE TAXLOT ENGINE TO LOOKUP COST     *         
//* BASIS INFORMATION TO BE FORWARDED ON TO THE RECEIVER OF THE ASSETS*         
//*-------------------------------------------------------------------*         
//STEP10  EXEC CAT780SP,                                                        
//             STREAM=XXX,                *3 BYTE STREAM OR CLIENT ID *         
//             HNB='BXXX',                *O/P .CAT780.TAXLOT     GDG *         
//             HNB1='BZZZ',               *I/P .CAT780.TAXLOT.MASTER  *         
//             RUNDATE=                                                         
//*-------------------------------------------------------------------*         
//* CREATE CLIENT 115 FEED OF EXISTING ACAT FULL DELIVERIES.          *         
//*-------------------------------------------------------------------*         
//STEP20  EXEC CAT780SP,                                                        
//             STREAM=XXX,                *3 BYTE STREAM OR CLIENT ID *         
//             HNB='BXXX',                *O/P .CAT780.TAXLOT     GDG *         
//             HNB1='BZZZ',               *I/P .CAT780.TAXLOT.MASTER  *         
//             SPLITCL='CL115'            *SINGLE CLIENT EXTR 'CL###' *         
//CAT780SP.ACATTAXO DD DSN=BIOS.C115.OUT.CBRS.REQUEST(+1),                      
//             DISP=(NEW,CATLG,DELETE),                                         
//             DCB=(&GDG.DSORG=PS,RECFM=FB,LRECL=1000)                          
//*-------------------------------------------------------------------*         
//* CREATE CLIENT 289 FEED OF EXISTING ACAT FULL DELIVERIES.          *         
//*-------------------------------------------------------------------*         
//STEP30  EXEC CAT780SP,                                                        
//             STREAM=XXX,                *3 BYTE STREAM OR CLIENT ID *         
//             HNB='BXXX',                *O/P .CAT780.TAXLOT     GDG *         
//             HNB1='BZZZ',               *I/P .CAT780.TAXLOT.MASTER  *         
//             SPLITCL='CL289'            *SINGLE CLIENT EXTR 'CL###' *         
//CAT780SP.ACATTAXO DD DSN=BIOS.C289.OUT.CBRS.REQUEST(+1),                      
//             DISP=(NEW,CATLG,DELETE),                                         
//             DCB=(&GDG.DSORG=PS,RECFM=FB,LRECL=1000)                          
