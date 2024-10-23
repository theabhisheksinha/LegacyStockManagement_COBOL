//CAT527MB JOB (BB0P,DY00),'ACATS MSD EXCP RPT',CLASS=U,MSGCLASS=W,             
//         SCHENV=STREAMB,                                                      
//   USER=BB0P,                                                                 
//  SECLABEL=BISG                                                               
//*NODAFF BALANCEU                                                              
//*JOBAFF BALANCEU                                                              
//**NON-CA11-JOB    BTR004/BTR06                                                
//**                                                                            
//BTR0405  EXEC BTR004,                                                         
//             UNIT=BATCH,                                                      
//             DSN='BBBB.CAT527.MSDPI(0)',                                      
//             PARAM='TRMX,REPLACE.AC=BP'                                       
