//CAT7800T JOB (BT0P,DY00),'ACAT TLE SPLIT',CLASS=O,MSGCLASS=W,                 
//         SCHENV=STREAMT,                                                      
//        PRTY=9,USER=BT0P,                                                     
//  SECLABEL=BISG                                                               
//*NODAFF BALANCEO                                                              
//*JOBAFF BALANCEO                                                              
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
//             STREAM=TTT,                *3 BYTE STREAM OR CLIENT ID *         
//             HNB='BTTT',                *O/P .CAT780.TAXLOT     GDG *         
//             HNB1='BZZZ',               *I/P .CAT780.TAXLOT.MAS GDG *         
//             B1FIL='BZZZ.B1FL',                                               
//             RUNDATE=                                                         
