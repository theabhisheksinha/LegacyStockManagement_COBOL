//CAT820CZ JOB (BP00,DY00),'ACATS FEE CONV',CLASS=1,MSGCLASS=W,                 
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//*-------------------------------------------------------------------*         
//*  COVERT B***.CAT820.RET(0) FROM LRECL=631 VB TO LRECL=644 VB                
//*-------------------------------------------------------------------*         
//*                                                                             
//STEP1   EXEC CAT820CV,                                                        
//             HNB=BAAA                                                         
//*                                                                             
//STEP2   EXEC CAT820CV,                                                        
//             HNB=BBBB                                                         
//*                                                                             
//STEP3   EXEC CAT820CV,                                                        
//             HNB=BFFF                                                         
//*                                                                             
//STEP4   EXEC CAT820CV,                                                        
//             HNB=BHHH                                                         
//*                                                                             
//STEP5   EXEC CAT820CV,                                                        
//             HNB=BIII                                                         
//*                                                                             
//STEP6   EXEC CAT820CV,                                                        
//             HNB=BJJJ                                                         
//*                                                                             
//STEP7   EXEC CAT820CV,                                                        
//             HNB=BLLL                                                         
//*                                                                             
//STEP8   EXEC CAT820CV,                                                        
//             HNB=BNNN                                                         
//*                                                                             
//STEP9   EXEC CAT820CV,                                                        
//             HNB=BPPP                                                         
//*                                                                             
//STEP10  EXEC CAT820CV,                                                        
//             HNB=BTTT                                                         
//*                                                                             
//STEP11  EXEC CAT820CV,                                                        
//             HNB=BUUU                                                         
//*                                                                             
//STEP12  EXEC CAT820CV,                                                        
//             HNB=BXXX                                                         
//*                                                                             
//STEP13  EXEC CAT820CV,                                                        
//             HNB=BYYY                                                         
//**********************************************************************        
//*            INTRA-DAY FEE PROCESSING                                         
//**********************************************************************        
//BMT713A EXEC BMT71,DD=12                                                      
//DD01     DD DSN=BAAA.CAT820.ID.RET(+1),                                       
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=644,RECFM=VB)                             
//DD02     DD DSN=BBBB.CAT820.ID.RET(+1),                                       
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=644,RECFM=VB)                             
//DD03     DD DSN=BFFF.CAT820.ID.RET(+1),                                       
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=644,RECFM=VB)                             
//DD04     DD DSN=BHHH.CAT820.ID.RET(+1),                                       
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=644,RECFM=VB)                             
//DD05     DD DSN=BIII.CAT820.ID.RET(+1),                                       
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=644,RECFM=VB)                             
//DD06     DD DSN=BJJJ.CAT820.ID.RET(+1),                                       
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=644,RECFM=VB)                             
//DD07     DD DSN=BLLL.CAT820.ID.RET(+1),                                       
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=644,RECFM=VB)                             
//DD08     DD DSN=BNNN.CAT820.ID.RET(+1),                                       
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=644,RECFM=VB)                             
//DD09     DD DSN=BPPP.CAT820.ID.RET(+1),                                       
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=644,RECFM=VB)                             
//DD10     DD DSN=BUUU.CAT820.ID.RET(+1),                                       
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=644,RECFM=VB)                             
//DD11     DD DSN=BXXX.CAT820.ID.RET(+1),                                       
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=644,RECFM=VB)                             
//DD12     DD DSN=BYYY.CAT820.ID.RET(+1),                                       
//         DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(1,1),RLSE),UNIT=BATCH,           
//            DCB=(GDG,DSORG=PS,LRECL=644,RECFM=VB)                             
