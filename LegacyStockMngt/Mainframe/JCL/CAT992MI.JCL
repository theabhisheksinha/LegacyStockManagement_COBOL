//CAT992MI JOB (BI0P,DY00),'ACATS: REPORT LOAD',CLASS=U,MSGCLASS=W,             
//         SCHENV=STREAMI,                                                      
//   USER=BI0P,                                                                 
//  SECLABEL=BISG                                                               
//*NODAFF BALANCEU                                                              
//*JOBAFF BALANCEU                                                              
//**NON-CA11-JOB    BTR004/BTR06                                        00012001
//SORT05  EXEC SORT,                                                            
//             REGION=4M                                                        
//SORTIN  DD DSN=BZZZ.CAT992.EODPI(0),DISP=SHR                                  
//SORTOUT DD DSN=BIII.CAT992.EODPI(+1),DISP=(,CATLG,DELETE),                    
//             SPACE=(CYL,(2,5),RLSE),UNIT=BATCH,                               
//             DCB=(GDG,BUFNO=75)                                               
//SYSOUT DD SYSOUT=*                                                            
//SORTLIST DD SYSOUT=*                                                          
//SYSIN  DD *                                                                   
 INCLUDE COND=(134,2,CH,EQ,X'041F')                                             
 SORT FIELDS=COPY                                                               
 END                                                                            
//BTR0405  EXEC BTR004,                                                         
//             UNIT=BATCH,                                                      
//             DSN='BIII.CAT992.EODPI(+1)',                                     
//             PARAM='AUTO,REPLACE.AC=BP'                                       
//SORT10  EXEC SORT,                                                            
//             REGION=4M                                                        
//SORTIN  DD DSN=BZZZ.CAT992.STLPI(0),DISP=SHR                                  
//SORTOUT DD DSN=BIII.CAT992.STLPI(+1),DISP=(,CATLG,DELETE),                    
//             SPACE=(CYL,(2,5),RLSE),UNIT=BATCH,                               
//             DCB=(GDG,BUFNO=75)                                               
//SYSOUT DD SYSOUT=*                                                            
//SORTLIST DD SYSOUT=*                                                          
//SYSIN  DD *                                                                   
 INCLUDE COND=(134,2,CH,EQ,X'041F')                                             
 SORT FIELDS=COPY                                                               
 END                                                                            
//BTR0410  EXEC BTR004,                                                         
//             UNIT=BATCH,                                                      
//             DSN='BIII.CAT992.STLPI(+1)',                                     
//             PARAM='AUTO,REPLACE.AC=BP'                                       
