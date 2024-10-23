//CAT7881X JOB (BX0P,DY00),'CBRS FL EXTRACT',CLASS=1,MSGCLASS=W,                
//         SCHENV=STREAMX,                                                      
//         USER=BX0P,                                                           
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//*                                                                             
//*-------------------------------------------------------------------*         
//*   SPLIT COST BASIS TRANSACTION INPUT FILE FROM DTCC BY            *         
//*   BY CLEARING NUMBER FOR CLIENT 115.                              *         
//*-------------------------------------------------------------------*         
//STEP10  EXEC CAT788SP,                                                        
//             BYP1=0,                    * 1=BYPASS DATE CHECK       *         
//             HNB2=BXXX,                 * O/P BATCH STREAM                    
//             CL=115,                    *3 BYTE CLIENT NUMBER       *         
//             CBRS='A026',               *4 BYTE CBRS ACCOUNT NBR    *         
//             RUNDATE=                                                         
//CAT788SP.OUTFILE DD DSN=BIOS.C115.OUT.CBRS0264(+1),                           
//            DISP=(NEW,CATLG,DELETE),                                          
//            SPACE=&SPACE,                                                     
//            UNIT=&UNIT,                                                       
//            DCB=(&GDG.DSORG=PS,LRECL=4004,RECFM=VB)                           
//*-------------------------------------------------------------------*         
//*   SPLIT COST BASIS TRANSACTION INPUT FILE FROM DTCC BY            *         
//*   BY CLEARING NUMBER FOR CLIENT 289.                              *         
//*-------------------------------------------------------------------*         
//STEP20  EXEC CAT788SP,                                                        
//             BYP1=0,                    * 1=BYPASS DATE CHECK       *         
//             HNB2=BXXX,                 * O/P BATCH STREAM                    
//             CL=289,                    *3 BYTE CLIENT NUMBER       *         
//             CBRS='A027',               *4 BYTE CBRS ACCOUNT NBR    *         
//             RUNDATE=                                                         
//CAT788SP.OUTFILE DD DSN=BIOS.C289.OUT.CBRS0264(+1),                           
//            DISP=(NEW,CATLG,DELETE),                                          
//            SPACE=&SPACE,                                                     
//            UNIT=&UNIT,                                                       
//            DCB=(&GDG.DSORG=PS,LRECL=4004,RECFM=VB)                           
