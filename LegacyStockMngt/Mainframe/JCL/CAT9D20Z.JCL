//CAT9D20Z JOB (BP00,DY00),'ACATS: REPORT SPLIT',CLASS=1,MSGCLASS=W,            
//        PRTY=15,                                                              
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//*-------------------------------------------------------------------*         
//*  APPEND TRACK SUFFIX TO NSCC REPORT FILE                                    
//*-------------------------------------------------------------------*         
//STEP10  EXEC CAT992,                                                          
//        HNB=BZZZ,                                                             
//        RPTID=EOD,CYCLE='2',                                                  
//        INFILE='BZZZ.SIAC0710.ACAT.TRN.RPT(0)'                                
//CAT992.OUTFILE  DD DSN=BZZZ.CAT992.TR2PI(+1)                                  
//*-------------------------------------------------------------------*         
//*  SPLIT NSCC REPORT FILE IN SAME FORMAT FOR A SPECIFIC CLIENT                
//*-------------------------------------------------------------------*         
//STEP15  EXEC CAT992,                                                          
//        HNB=BZZZ,                                                             
//        RPTID=EOD,CYCLE='2',                                                  
//        CL992='CL237',                                                        
//        DUMREG='DUMMY,',                                                      
//        DUMCLT=,                                                              
//        INFILE='BZZZ.SIAC0710.ACAT.TRN.RPT(0)'                                
//CAT992.OUTCLT   DD DSN=BIOS.C237.OUT.SIAC0710.ACATTR2(+1)                     
//*-------------------------------------------------------------------*         
//*  SPLIT NSCC TRANSACTION FILE IN THE SAME FORMAT FOR SPECIFIC CLIENT         
//*-------------------------------------------------------------------*         
//STEP17  EXEC CAT512,                                                          
//        BRKR='0385'                * SELECT BROKER NUMBER      *              
//CAT512.OUTFILE  DD DSN=BIOS.C237.OUT.SIAC0716.TRAN2(+1)                       
//*                                                                             
//STEP20  EXEC CAT530,                                                          
//             CARDLIB='BISG.CARDLIB',                                          
//             DB2SYS='DB2PROD.GROUP',    *DB2 SYSTEM DB2PROD/DB2TEST *         
//             PLAN='ACTBTCH',            *DB2 PLAN CARDLIB MEMBER    *         
//             B1FIL='BZZZ.B1FL.PROD',                                          
//             HNB=BZZZ,                                                        
//             RUNDATE=                                                         
