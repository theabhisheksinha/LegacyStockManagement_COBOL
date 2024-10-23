//CAT750LN JOB (BN1P,DAC0),'ACAT CAT750LN',CLASS=5,MSGCLASS=W,                  
//         SCHENV=STREAMN,                                                      
//             USER=BN1P,                                                       
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE5                                                              
//*JOBAFF BALANCE5                                                              
//CA11STEP EXEC CA11                                                            
//**                                                                            
//SORT10  EXEC SORT,                                                            
//             REGION=4M                                                        
//SORTIN  DD DSN=BXXX.CAT650.T3RDFL(0),DISP=SHR                                 
//SORTOUT DD DSN=BNNN.CAT650.T3RDFL(+1),DISP=(,CATLG,DELETE),                   
//             SPACE=(CYL,(2,5),RLSE),UNIT=BATCH,                               
//             DCB=(GDG,BUFNO=75)                                               
//SYSOUT DD SYSOUT=*                                                            
//SORTLIST DD SYSOUT=*                                                          
//SYSIN  DD *                                                                   
 INCLUDE COND=(1,3,CH,EQ,C'DAT',OR,                                             
               1,3,CH,EQ,C'030',OR,                                             
               1,3,CH,EQ,C'REC')                                                
 SORT FIELDS=COPY                                                               
 END                                                                            
//**                                                                            
//SORT20  EXEC SORT,                                                            
//             REGION=4M                                                        
//SORTIN  DD DSN=BXXX.CAT650.CAGE13(-1),DISP=SHR                                
//SORTOUT DD DSN=BNNN.CAT650.CAGE13(+1),DISP=(,CATLG,DELETE),                   
//             SPACE=(CYL,(2,5),RLSE),UNIT=BATCH,                               
//             DCB=(GDG,BUFNO=75)                                               
//SYSOUT DD SYSOUT=*                                                            
//SORTLIST DD SYSOUT=*                                                          
//SYSIN  DD *                                                                   
 INCLUDE COND=(1,3,CH,EQ,C'DAT',OR,                                             
               1,3,CH,EQ,C'030')                                                
 SORT FIELDS=COPY                                                               
 END                                                                            
//**                                                                            
//SORT25  EXEC SORT,                                                            
//             REGION=4M                                                        
//SORTIN  DD DSN=BXXX.CAT650.CAGE13(0),DISP=SHR                                 
//SORTOUT DD DSN=BNNN.CAT650.CAGE13(+2),DISP=(,CATLG,DELETE),                   
//             SPACE=(CYL,(2,5),RLSE),UNIT=BATCH,                               
//             DCB=(GDG,BUFNO=75)                                               
//SYSOUT DD SYSOUT=*                                                            
//SORTLIST DD SYSOUT=*                                                          
//SYSIN  DD *                                                                   
 INCLUDE COND=(1,3,CH,EQ,C'DAT',OR,                                             
               1,3,CH,EQ,C'030')                                                
 SORT FIELDS=COPY                                                               
 END                                                                            
//**                                                                            
//SORT30  EXEC SORT,                                                            
//             REGION=4M                                                        
//SORTIN  DD DSN=BXXX.CAT650.CAG2FL(0),DISP=SHR                                 
//SORTOUT DD DSN=BNNN.CAT650.CAG2FL(+1),DISP=(,CATLG,DELETE),                   
//             SPACE=(CYL,(2,5),RLSE),UNIT=BATCH,                               
//             DCB=(GDG,BUFNO=75)                                               
//SYSOUT DD SYSOUT=*                                                            
//SORTLIST DD SYSOUT=*                                                          
//SYSIN  DD *                                                                   
 INCLUDE COND=(1,3,CH,EQ,C'DAT',OR,                                             
               1,3,CH,EQ,C'030')                                                
 SORT FIELDS=COPY                                                               
 END                                                                            
