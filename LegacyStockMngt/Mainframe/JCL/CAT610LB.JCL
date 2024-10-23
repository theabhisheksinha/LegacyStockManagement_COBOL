//CAT610LB JOB (BB0P,0000),'ACAT CAT610LN',CLASS=5,MSGCLASS=W,                  
//         SCHENV=STREAMB,                                                      
//             USER=BB0P,                                                       
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE5                                                              
//*JOBAFF BALANCE5                                                              
//CA11STEP EXEC CA11                                                            
//**                                                                            
//SORT10  EXEC SORT,                                                            
//             REGION=4M                                                        
//SORTIN  DD DSN=BTTT.CAT610.NAUPD(0),DISP=SHR                                  
//SORTOUT DD DSN=BBBB.CAT610.NAUPD(+1),DISP=(,CATLG,DELETE),                    
//             SPACE=(CYL,(2,5),RLSE),UNIT=BATCH,                               
//             DCB=(GDG,BUFNO=75)                                               
//SYSOUT DD SYSOUT=*                                                            
//SORTLIST DD SYSOUT=*                                                          
//SYSIN  DD *                                                                   
 INCLUDE COND=(1,3,CH,EQ,C'DAT',OR,                                             
               1,3,CH,EQ,C'REC')                                                
 SORT FIELDS=COPY                                                               
 END                                                                            
//**********************************************                                
//*      ADJUST TRAILER                        *                                
//**********************************************                                
//ADJTRL10 EXEC PGM=ADJTRL,PARM='009,11,-1'                                     
//STEPLIB  DD  DSN=TSTBPS.SX.TESTLIB,DISP=SHR                                   
//INF      DD  DSN=BBBB.CAT610.NAUPD(+1),DISP=SHR                               
//OUTF     DD  DSN=BBBB.CAT610.NAUPD(+1),DISP=SHR                               
//**                                                                            
//SORT20  EXEC SORT,                                                            
//             REGION=4M                                                        
//SORTIN  DD DSN=BTTT.CAT610.MGNINT(0),DISP=SHR                                 
//SORTOUT DD DSN=BBBB.CAT610.MGNINT(+1),DISP=(,CATLG,DELETE),                   
//             SPACE=(CYL,(2,5),RLSE),UNIT=BATCH,                               
//             DCB=(GDG,BUFNO=75)                                               
//SYSOUT DD SYSOUT=*                                                            
//SORTLIST DD SYSOUT=*                                                          
//SYSIN  DD *                                                                   
 INCLUDE COND=(1,3,CH,EQ,X'000000',OR,                                          
               1,3,CH,EQ,X'FFFFFF')                                             
 SORT FIELDS=COPY                                                               
 END                                                                            
//**                                                                            
//SORT30  EXEC SORT,                                                            
//             REGION=4M                                                        
//SORTIN  DD DSN=BTTT.CAT610.PPMNT(0),DISP=SHR                                  
//SORTOUT DD DSN=BBBB.CAT610.PPMNT(+1),DISP=(,CATLG,DELETE),                    
//             SPACE=(CYL,(2,5),RLSE),UNIT=BATCH,                               
//             DCB=(GDG,BUFNO=75)                                               
//SYSOUT DD SYSOUT=*                                                            
//SORTLIST DD SYSOUT=*                                                          
//SYSIN  DD *                                                                   
 INCLUDE COND=(1,3,CH,EQ,C'DAT')                                                
 SORT FIELDS=COPY                                                               
 END                                                                            
