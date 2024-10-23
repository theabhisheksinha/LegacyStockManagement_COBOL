//CAT9D1MI JOB (BI0P,DY00),'ACATS: REPORT SPLIT',CLASS=U,MSGCLASS=W,            
//         SCHENV=STREAMI,                                                      
//   USER=BI0P,                                                                 
//  SECLABEL=BISG                                                               
//*NODAFF BALANCEU                                                              
//*JOBAFF BALANCEU                                                              
//**NON-CA11-JOB    BTR004/BTR06                                        00012001
//SORT05  EXEC SORT,                                                            
//             REGION=4M                                                        
//SORTIN  DD DSN=BZZZ.CAT992.TR1PI(0),DISP=SHR                                  
//SORTOUT DD DSN=BIII.CAT992.TR1PI(+1),DISP=(,CATLG,DELETE),                    
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
//             DSN='BIII.CAT992.TR1PI(+1)',                                     
//             PARAM='AUTO,REPLACE.AC=BP'                                       
//SORT10  EXEC SORT,                                                            
//             REGION=4M                                                        
//SORTIN  DD DSN=BZZZ.CAT530.RVEPI(0),DISP=SHR                                  
//SORTOUT DD DSN=BIII.CAT530.RVEPI(+1),DISP=(,CATLG,DELETE),                    
//             SPACE=(CYL,(2,5),RLSE),UNIT=BATCH,                               
//             DCB=(GDG,BUFNO=75)                                               
//SYSOUT DD SYSOUT=*                                                            
//SORTLIST DD SYSOUT=*                                                          
//SYSIN  DD *                                                                   
 INCLUDE COND=(134,2,CH,EQ,X'041F')                                             
 SORT FIELDS=COPY                                                               
 END                                                                            
//BTR0410  EXEC  BTR004,                                                        
//            UNIT=BATCH,                                                       
//            DSN='BIII.CAT530.RVEPI(+1)',                                      
//            PARM='AUTO,REPLACE.AC=BP'                                         
