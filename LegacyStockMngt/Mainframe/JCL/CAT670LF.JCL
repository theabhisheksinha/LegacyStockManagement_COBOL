//CAT670LF JOB (BF0P,0000),'ACAT CAT670LN',CLASS=5,MSGCLASS=W,                  
//         SCHENV=STREAMF,                                                      
//             USER=BF0P,                                                       
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE5                                                              
//*JOBAFF BALANCE5                                                              
//CA11STEP EXEC CA11                                                            
//**                                                                            
//SORT10  EXEC SORT,                                                            
//             REGION=4M                                                        
//SORTIN  DD DSN=BTTT.CAT670.RET(0),DISP=SHR                                    
//SORTOUT DD DSN=BFFF.CAT670.RET(+1),DISP=(,CATLG,DELETE),                      
//             SPACE=(CYL,(2,5),RLSE),UNIT=BATCH,                               
//             DCB=(GDG,BUFNO=75)                                               
//SYSOUT DD SYSOUT=*                                                            
//SORTLIST DD SYSOUT=*                                                          
//SYSIN  DD *                                                                   
 RECORD TYPE=V                                                                  
 SORT FIELDS=COPY                                                               
 END                                                                            
//P2UTIL10 EXEC PGM=P2UTIL,PARM='A,500,9999999'                                 
//DISKF DD DSN=BTTT.CAT670.P2FEE(0),DISP=SHR                                    
//OUTF  DD DSN=BFFF.CAT670.P2FEE(+1),DISP=(NEW,CATLG,DELETE),                   
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
//ADJTRL10 EXEC PGM=ADJTRL,PARM='009,11,-1'                                     
//STEPLIB  DD  DSN=TSTBPS.SX.TESTLIB,DISP=SHR                                   
//INF      DD  DSN=BFFF.CAT670.P2FEE(+1),DISP=SHR                               
//OUTF     DD  DSN=BFFF.CAT670.P2FEE(+1),DISP=SHR                               
//*                                                                             
//P2UTIL20 EXEC PGM=P2UTIL,PARM='A,500,9999999'                                 
//DISKF DD DSN=BTTT.CAT670.TACTL(0),DISP=SHR                                    
//OUTF  DD DSN=BFFF.CAT670.TACTL(+1),DISP=(NEW,CATLG,DELETE),                   
//         DCB=(RECFM=VB,LRECL=8004),                                           
//         SPACE=(CYL,(2,20),RLSE),UNIT=BATCH                                   
//PRINTF  DD SYSOUT=*                                                           
//SYSIN   DD *                                                                  
141-05-C-EQ-DATE=                                                    OR         
141-08-C-EQ-REC-CNT=                                                            
