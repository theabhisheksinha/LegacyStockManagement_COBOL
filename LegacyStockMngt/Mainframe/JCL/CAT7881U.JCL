//CAT7881U JOB (BU1P,DY00),'CBRS FL EXTRACT',CLASS=1,MSGCLASS=W,                
//         SCHENV=STREAMU,                                                      
//         USER=BU1P,                                                           
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//*                                                                             
//*-------------------------------------------------------------------*         
//*   SPLIT COST BASIS TRANSACTION INPUT FILE FROM DTCC BY            *         
//*   BY CLEARING NUMBER FOR CLIENT 080.                              *         
//*-------------------------------------------------------------------*         
//STEP10  EXEC CAT788SP,                                                        
//             BYP1=0,                    * 1=BYPASS DATE CHECK       *         
//             HNB2=BAAA,                 * O/P BATCH STREAM                    
//             CL=080,                    *3 BYTE CLIENT NUMBER       *         
//             CBRS='A04S',               *4 BYTE CBRS ACCOUNT NBR    *         
//             RUNDATE=                                                         
//CAT788SP.OUTFILE DD DSN=BIOS.C080.OUT.CBRS0264(+1),                           
//            DISP=(NEW,CATLG,DELETE),                                          
//            SPACE=&SPACE,                                                     
//            UNIT=&UNIT,                                                       
//            DCB=(&GDG.DSORG=PS,LRECL=4004,RECFM=VB)                           
