//CAT7800F JOB (BF0P,DY00),'ACAT TAXLOT SPLIT',CLASS=1,MSGCLASS=W,              
//         SCHENV=STREAMF,                                                      
//        USER=BF0P,SECLABEL=BISG                                               
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
//             STREAM=FFF,                *3 BYTE STREAM OR CLIENT ID *         
//             HNB='BFFF',                *O/P .CAT780.TAXLOT     GDG *         
//             HNB1='BZZZ',               *I/P .CAT780.TAXLOT.MASTER  *         
//             RUNDATE=                                                         
