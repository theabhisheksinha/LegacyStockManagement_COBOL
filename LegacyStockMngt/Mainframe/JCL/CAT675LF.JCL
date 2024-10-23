//CAT675LF JOB (BF0P,0000),'ACAT CAT675LN',CLASS=5,MSGCLASS=W,                  
//         SCHENV=STREAMF,                                                      
//             USER=BF0P,                                                       
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE5                                                              
//*JOBAFF BALANCE5                                                              
//CA11STEP EXEC CA11                                                            
//**                                                                            
//P2UTIL10 EXEC PGM=P2UTIL,PARM='A,500,9999999'                                 
//DISKF DD DSN=BTTT.CAT675.AIPP2(0),DISP=SHR                                    
//OUTF  DD DSN=BFFF.CAT675.AIPP2(+1),DISP=(NEW,CATLG,DELETE),                   
//         DCB=(RECFM=FB,LRECL=120),                                            
//         SPACE=(CYL,(2,20),RLSE),UNIT=BATCH                                   
//PRINTF  DD SYSOUT=*                                                           
//SYSIN   DD *                                                                  
001-05-C-EQ-DATE=                                                    OR         
001-08-C-EQ-REC-CNT=                                                            
/*                                                                              
//**********************************************                                
//*      ADJUST TRAILER                        *                                
//**********************************************                                
//ADJTRL6  EXEC PGM=ADJTRL,PARM='009,11,-1'                                     
//STEPLIB  DD  DSN=TSTBPS.SX.TESTLIB,DISP=SHR                                   
//INF      DD  DSN=BFFF.CAT675.AIPP2(+1),DISP=SHR                               
//OUTF     DD  DSN=BFFF.CAT675.AIPP2(+1),DISP=SHR                               
