//CAT7800N JOB (BN1P,DY00),'ACAT TLE SPLIT',CLASS=1,MSGCLASS=W,                 
//         SCHENV=STREAMN,                                                      
//        USER=BN1P,                                                            
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
//             STREAM=NNN,                *3 BYTE STREAM OR CLIENT ID *         
//             HNB='BNNN',                *O/P .CAT780.TAXLOT     GDG *         
//             HNB1='BZZZ',               *I/P .CAT780.TAXLOT.MAS GDG *         
//             B1FIL='BZZZ.B1FL',                                               
//             RUNDATE=                                                         
