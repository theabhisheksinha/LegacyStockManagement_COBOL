//CAT527MF JOB (BF0P,DY00),'ACAT MSD EXCP RPT',CLASS=U,MSGCLASS=W,              
//         SCHENV=STREAMF,                                                      
//   USER=BF0P,                                                                 
//  SECLABEL=BISG                                                               
//*NODAFF BALANCEU                                                              
//*JOBAFF BALANCEU                                                              
//**NON-CA11-JOB    BTR004/BTR06                                                
//**                                                                            
//BTR0405  EXEC BTR004,                                                         
//             UNIT=BATCH,                                                      
//             DSN='BFFF.CAT527.MSDPI(0)',                                      
//             PARAM='AUTO,REPLACE.AC=BP'                                       
