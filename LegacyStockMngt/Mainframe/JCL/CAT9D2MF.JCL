//CAT9D2MF JOB (BF0P,DY00),'ACATS: REPORT SPLIT',CLASS=U,MSGCLASS=W,            
//         SCHENV=STREAMF,                                                      
//   USER=BF0P,                                                                 
//  SECLABEL=BISG                                                               
//*NODAFF BALANCEU                                                              
//*JOBAFF BALANCEU                                                              
//**NON-CA11-JOB    BTR004/BTR06                                                
//**                                                                            
//SORT05  EXEC SORT,                                                            
//             REGION=4M                                                        
//SORTIN  DD DSN=BZZZ.CAT992.TR2PI(0),DISP=SHR                                  
//SORTOUT DD DSN=BFFF.CAT992.TR2PI(+1),DISP=(,CATLG,DELETE),                    
//             SPACE=(CYL,(2,5),RLSE),UNIT=BATCH,                               
//             DCB=(GDG,BUFNO=75)                                               
//SYSOUT DD SYSOUT=*                                                            
//SORTLIST DD SYSOUT=*                                                          
//SYSIN  DD *                                                                   
 INCLUDE COND=(134,2,CH,EQ,X'006F')                                             
 SORT FIELDS=COPY                                                               
 END                                                                            
//BTR0405  EXEC BTR004,                                                         
//             UNIT=BATCH,                                                      
//             DSN='BFFF.CAT992.TR2PI(+1)',                                     
//             PARAM='AUTO,REPLACE.AC=BP'                                       
//SORT10  EXEC SORT,                                                            
//             REGION=4M                                                        
//SORTIN  DD DSN=BZZZ.CAT530.RVEPI(0),DISP=SHR                                  
//SORTOUT DD DSN=BFFF.CAT530.RVEPI(+1),DISP=(,CATLG,DELETE),                    
//             SPACE=(CYL,(2,5),RLSE),UNIT=BATCH,                               
//             DCB=(GDG,BUFNO=75)                                               
//SYSOUT DD SYSOUT=*                                                            
//SORTLIST DD SYSOUT=*                                                          
//SYSIN  DD *                                                                   
 INCLUDE COND=(134,2,CH,EQ,X'006F')                                             
 SORT FIELDS=COPY                                                               
 END                                                                            
//BTR0410  EXEC  BTR004,                                                        
//            UNIT=BATCH,                                                       
//            DSN='BFFF.CAT530.RVEPI(+1)',                                      
//            PARM='AUTO,REPLACE.AC=BP'                                         
