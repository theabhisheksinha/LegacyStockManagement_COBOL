//CAT7800B JOB (BB0P,DY00),'ACAT TAXLOT SPLIT',CLASS=1,MSGCLASS=W,              
//         SCHENV=STREAMB,                                                      
//        USER=BB0P,SECLABEL=BISG                                               
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
//             STREAM=BBB,                *3 BYTE STREAM OR CLIENT ID *         
//             HNB='BBBB',                *O/P .CAT780.TAXLOT     GDG *         
//             HNB1='BZZZ',               *I/P .CAT780.TAXLOT.MASTER  *         
//             RUNDATE=                                                         
//*                                                                             
//*-------------------------------------------------------------------*         
//* CREATE CLIENT 237 FEED OF EXISTING ACAT FULL DELIVERIES.          *         
//*-------------------------------------------------------------------*         
//STEP20  EXEC CAT780SP,                                                        
//             STREAM=BBB,                *3 BYTE STREAM OR CLIENT ID *         
//             HNB='BBBB',                *O/P .CAT780.TAXLOT     GDG *         
//             HNB1='BZZZ',               *I/P .CAT780.TAXLOT.MASTER  *         
//             SPLITCL='CL237'            *SINGLE CLIENT EXTR 'CL###' *         
//CAT780SP.ACATTAXO DD DSN=BIOS.C237.OUT.CBRS.REQUEST(+1),                      
//             DISP=(NEW,CATLG,DELETE),                                         
//             DCB=(&GDG.DSORG=PS,RECFM=FB,LRECL=1000)                          
