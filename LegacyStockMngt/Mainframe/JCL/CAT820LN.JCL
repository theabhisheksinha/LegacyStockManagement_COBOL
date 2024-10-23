//CAT820LN JOB (BN1P,DAC0),'ACAT CAT820LP',CLASS=5,MSGCLASS=W,                  
//         SCHENV=STREAMN,                                                      
//             USER=BN1P,                                                       
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE5                                                              
//*JOBAFF BALANCE5                                                              
//CA11STEP EXEC CA11                                                            
//**                                                                            
//SORT10  EXEC SORT,                                                            
//             REGION=4M                                                        
//SORTIN  DD DSN=BXXX.CAT820.RET(0),DISP=SHR                                    
//SORTOUT DD DSN=BNNN.CAT820.RET(+1),DISP=(,CATLG,DELETE),                      
//             SPACE=(CYL,(2,5),RLSE),UNIT=BATCH,                               
//             DCB=(GDG,BUFNO=75)                                               
//SYSOUT DD SYSOUT=*                                                            
//SORTLIST DD SYSOUT=*                                                          
//SYSIN  DD *                                                                   
 RECORD TYPE=V                                                                  
 INCLUDE COND=(5,3,CH,EQ,C'030')                                                
 SORT FIELDS=COPY                                                               
 END                                                                            
//P2UTIL10 EXEC PGM=P2UTIL,PARM='A,500,9999999'                                 
//DISKF DD DSN=BXXX.CAT820.P2FEE(0),DISP=SHR                                    
//OUTF  DD DSN=BNNN.CAT820.P2FEE(+1),DISP=(NEW,CATLG,DELETE),                   
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
//ADJTRL10 EXEC PGM=ADJTRL,PARM='009,11,-1'                                     
//STEPLIB  DD  DSN=TSTBPS.SX.TESTLIB,DISP=SHR                                   
//INF      DD  DSN=BNNN.CAT820.P2FEE(+1),DISP=SHR                               
//OUTF     DD  DSN=BNNN.CAT820.P2FEE(+1),DISP=SHR                               
//*                                                                             
//P2UTIL20 EXEC PGM=P2UTIL,PARM='A,500,9999999'                                 
//DISKF DD DSN=BXXX.CAT820.TACTL(0),DISP=SHR                                    
//OUTF  DD DSN=BNNN.CAT820.TACTL(+1),DISP=(NEW,CATLG,DELETE),                   
//         DCB=(RECFM=VB,LRECL=8004),                                           
//         SPACE=(CYL,(2,20),RLSE),UNIT=BATCH                                   
//PRINTF  DD SYSOUT=*                                                           
//SYSIN   DD *                                                                  
141-05-C-EQ-DATE=                                                    OR         
141-08-C-EQ-REC-CNT=                                                 OR         
021-03-C-EQ-030                                                                 
/*                                                                              
