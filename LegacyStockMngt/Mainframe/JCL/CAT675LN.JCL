//CAT675LN JOB (BN1P,DAC0),'ACAT CAT675LN',CLASS=5,MSGCLASS=W,                  
//         SCHENV=STREAMN,                                                      
//             USER=BN1P,                                                       
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE5                                                              
//*JOBAFF BALANCE5                                                              
//CA11STEP EXEC CA11                                                            
//**                                                                            
//P2UTIL10 EXEC PGM=P2UTIL,PARM='A,500,9999999'                                 
//DISKF DD DSN=BXXX.CAT675.AIPP2(0),DISP=SHR                                    
//OUTF  DD DSN=BNNN.CAT675.AIPP2(+1),DISP=(NEW,CATLG,DELETE),                   
//         DCB=(RECFM=FB,LRECL=120),                                            
//         SPACE=(CYL,(2,20),RLSE),UNIT=BATCH                                   
//PRINTF  DD SYSOUT=*                                                           
//SYSIN   DD *                                                                  
001-05-C-EQ-DATE=                                                    OR         
001-08-C-EQ-REC-CNT=                                                 OR         
004-03-C-EQ-030                                                                 
/*                                                                              
//**********************************************                                
//*      ADJUST TRAILER                        *                                
//**********************************************                                
//ADJTRL6  EXEC PGM=ADJTRL,PARM='009,11,-1'                                     
//STEPLIB  DD  DSN=TSTBPS.SX.TESTLIB,DISP=SHR                                   
//INF      DD  DSN=BNNN.CAT675.AIPP2(+1),DISP=SHR                               
//OUTF     DD  DSN=BNNN.CAT675.AIPP2(+1),DISP=SHR                               
