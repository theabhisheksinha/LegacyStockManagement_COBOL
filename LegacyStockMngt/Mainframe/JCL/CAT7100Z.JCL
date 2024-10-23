//CAT7100Z JOB (BP00,DY00),'SIAC ACAT POSN  ',CLASS=5,MSGCLASS=W,               
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE5                                                              
//*JOBAFF BALANCE5                                                              
//CA11    EXEC CA11                                                             
//*********************************************************************         
//* PROCESS ACATS POSITION FILE BZZZ.SIAC0718.ACAT.POSN               *         
//* UPDATE TRANSFER DB2 TABLE WITH SETTLEMENT DATE AND STATUS         *         
//*********************************************************************         
//STEP10  EXEC CAT710                                                           
//*********************************************************************         
//*  SET COND CODE = 02 WHEN TOMORROW IS BANK HOILDAY                           
//*********************************************************************         
//STEPBANK EXEC PGM=BANKHOL,                                                    
//             PARM='DATE=999999,DISP=P001,RC=0002'                             
//SYSOUT  DD SYSOUT=*                                                           
//*********************************************************************         
//* SAVE CAMS DB2 DATABASE OF MONEY MARKET FUNDS RECORDS TO GDG FILE  *         
//*********************************************************************         
//STEP15  EXEC CATMMF,                                                          
//             COND=(2,EQ,STEPBANK)                                             
//*-------------------------------------------------------------------*         
//*  SPLIT NSCC POSITION FILE IN THE SAME FORMAT FOR SPECIFIC CLIENT            
//*-------------------------------------------------------------------*         
//STEP17  EXEC CAT512,                                                          
//             BRKR='0385'                * SELECT BROKER NUMBER      *         
//CAT512.INFILE   DD DSN=BZZZ.SIAC0718.ACAT.POSN(0),DISP=SHR                    
//CAT512.OUTFILE  DD DSN=BIOS.C237.OUT.SIAC0718.POSN(+1)                        
