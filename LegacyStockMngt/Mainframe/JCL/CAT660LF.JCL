//CAT660LF JOB (BF0P,0000),'ACAT CAT660LP',CLASS=5,MSGCLASS=W,                  
//         SCHENV=STREAMF,                                                      
//             USER=BF0P,                                                       
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE5                                                              
//*JOBAFF BALANCE5                                                              
//CA11STEP EXEC CA11                                                            
//**                                                                            
//SORT10  EXEC SORT,                                                            
//             REGION=4M                                                        
//SORTIN  DD DSN=BTTT.CAT660.ACATPEND(-1),DISP=SHR                              
//SORTOUT DD DSN=BFFF.CAT660.ACATPEND(+1),DISP=(,CATLG,DELETE),                 
//             SPACE=(CYL,(2,5),RLSE),UNIT=BATCH,                               
//             DCB=(GDG,BUFNO=75)                                               
//SYSOUT DD SYSOUT=*                                                            
//SORTLIST DD SYSOUT=*                                                          
//SYSIN  DD *                                                                   
 RECORD TYPE=V                                                                  
 INCLUDE COND=(5,1,CH,EQ,C'H')                                                  
 SORT FIELDS=COPY                                                               
 END                                                                            
//**                                                                            
//SORT20  EXEC SORT,                                                            
//             REGION=4M                                                        
//SORTIN  DD DSN=BTTT.CAT660.ACATMFNL(0),DISP=SHR                               
//SORTOUT DD DSN=BFFF.CAT660.ACATMFNL(+1),DISP=(,CATLG,DELETE),                 
//             SPACE=(CYL,(2,5),RLSE),UNIT=BATCH,                               
//             DCB=(GDG,BUFNO=75)                                               
//SYSOUT DD SYSOUT=*                                                            
//SORTLIST DD SYSOUT=*                                                          
//SYSIN  DD *                                                                   
 INCLUDE COND=(1,3,CH,EQ,X'000000')                                             
 SORT FIELDS=COPY                                                               
 END                                                                            
//**                                                                            
//SORT30  EXEC SORT,                                                            
//             REGION=4M                                                        
//SORTIN  DD DSN=BTTT.CAT660.ACATPENS(0),DISP=SHR                               
//SORTOUT DD DSN=BFFF.CAT660.ACATPENS(+1),DISP=(,CATLG,DELETE),                 
//             SPACE=(CYL,(2,5),RLSE),UNIT=BATCH,                               
//             DCB=(GDG,BUFNO=75)                                               
//SYSOUT DD SYSOUT=*                                                            
//SORTLIST DD SYSOUT=*                                                          
//SYSIN  DD *                                                                   
 INCLUDE COND=(1,3,CH,EQ,C'DAT')                                                
 SORT FIELDS=COPY                                                               
 END                                                                            
//**                                                                            
//SORT40  EXEC SORT,                                                            
//             REGION=4M                                                        
//SORTIN  DD DSN=BTTT.CAT660.BNWTRAN(0),DISP=SHR                                
//SORTOUT DD DSN=BFFF.CAT660.BNWTRAN(+1),DISP=(,CATLG,DELETE),                  
//             SPACE=(CYL,(2,5),RLSE),UNIT=BATCH,                               
//             DCB=(GDG,BUFNO=75)                                               
//SYSOUT DD SYSOUT=*                                                            
//SORTLIST DD SYSOUT=*                                                          
//SYSIN  DD *                                                                   
 INCLUDE COND=(1,3,CH,EQ,X'000000')                                             
 SORT FIELDS=COPY                                                               
 END                                                                            
