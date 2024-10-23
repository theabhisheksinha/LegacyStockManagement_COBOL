//CAT7800L JOB (BL0P,DY00),'ACAT TLE274 SPLIT',CLASS=1,MSGCLASS=W,              
//         SCHENV=STREAML,                                                      
//        USER=BL0P,                                                            
//  SECLABEL=BISG                                                               
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
//*                                                                             
//STEP10  EXEC CAT780SP,                                                        
//             STREAM=274,                *3 BYTE STREAM OR CLIENT ID *         
//             HNB='BLLL',                *O/P .CAT780.TAXLOT     GDG *         
//             HNB1='BZZZ',               *I/P .CAT780.TAXLOT.MAS GDG *         
//             B1FIL='BZZZ.B1FL',                                               
//             RUNDATE=                                                         
//*                                                                             
//CAT780SP.ACATTAXO DD DSN=&HNB..CAT780SP.TAXLOT.CL274&GENP1                    
