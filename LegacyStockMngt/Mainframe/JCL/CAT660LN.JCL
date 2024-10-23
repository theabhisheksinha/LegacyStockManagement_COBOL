//CAT660LN JOB (BN1P,DAC0),'ACAT CAT660LP',CLASS=5,MSGCLASS=W,                  
//         SCHENV=STREAMN,                                                      
//             USER=BN1P,                                                       
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE5                                                              
//*JOBAFF BALANCE5                                                              
//CA11STEP EXEC CA11                                                            
//**                                                                            
//SORT10  EXEC SORT,                                                            
//             REGION=4M                                                        
//SORTIN  DD DSN=BXXX.CAT660.ACATPEND(0),DISP=SHR                               
//SORTOUT DD DSN=BNNN.CAT660.ACATPEND(+1),DISP=(,CATLG,DELETE),                 
//             SPACE=(CYL,(2,5),RLSE),UNIT=BATCH,                               
//             DCB=(GDG,BUFNO=75)                                               
//SYSOUT DD SYSOUT=*                                                            
//SORTLIST DD SYSOUT=*                                                          
//SYSIN  DD *                                                                   
 RECORD TYPE=V                                                                  
 INCLUDE COND=(5,3,CH,EQ,C'030',OR,5,1,CH,EQ,C'H')                              
 SORT FIELDS=COPY                                                               
 END                                                                            
//**                                                                            
//SORT20  EXEC SORT,                                                            
//             REGION=4M                                                        
//SORTIN  DD DSN=BXXX.CAT660.ACATMFNL(0),DISP=SHR                               
//SORTOUT DD DSN=BNNN.CAT660.ACATMFNL(+1),DISP=(,CATLG,DELETE),                 
//             SPACE=(CYL,(2,5),RLSE),UNIT=BATCH,                               
//             DCB=(GDG,BUFNO=75)                                               
//SYSOUT DD SYSOUT=*                                                            
//SORTLIST DD SYSOUT=*                                                          
//SYSIN  DD *                                                                   
 INCLUDE COND=(1,3,CH,EQ,X'000000',OR,1,3,CH,EQ,C'030')                         
 SORT FIELDS=COPY                                                               
 END                                                                            
//**                                                                            
//SORT30  EXEC SORT,                                                            
//             REGION=4M                                                        
//SORTIN  DD DSN=BXXX.CAT660.ACATPENS(0),DISP=SHR                               
//SORTOUT DD DSN=BNNN.CAT660.ACATPENS(+1),DISP=(,CATLG,DELETE),                 
//             SPACE=(CYL,(2,5),RLSE),UNIT=BATCH,                               
//             DCB=(GDG,BUFNO=75)                                               
//SYSOUT DD SYSOUT=*                                                            
//SORTLIST DD SYSOUT=*                                                          
//SYSIN  DD *                                                                   
 INCLUDE COND=(1,3,CH,EQ,C'DAT',OR,1,3,CH,EQ,C'030')                            
 SORT FIELDS=COPY                                                               
 END                                                                            
//**                                                                            
//SORT40  EXEC SORT,                                                            
//             REGION=4M                                                        
//SORTIN  DD DSN=BXXX.CAT660.BNWTRAN(0),DISP=SHR                                
//SORTOUT DD DSN=BNNN.CAT660.BNWTRAN(+1),DISP=(,CATLG,DELETE),                  
//             SPACE=(CYL,(2,5),RLSE),UNIT=BATCH,                               
//             DCB=(GDG,BUFNO=75)                                               
//SYSOUT DD SYSOUT=*                                                            
//SORTLIST DD SYSOUT=*                                                          
//SYSIN  DD *                                                                   
 INCLUDE COND=(1,3,CH,EQ,X'000000',OR,1,3,CH,EQ,C'030')                         
 SORT FIELDS=COPY                                                               
 END                                                                            
