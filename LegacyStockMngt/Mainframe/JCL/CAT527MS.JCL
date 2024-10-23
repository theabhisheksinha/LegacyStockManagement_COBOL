//CAT527MS JOB (BS0P,0000),'ACAT MSD EXCP RPT',CLASS=U,MSGCLASS=W,              
//         SCHENV=STREAMS,                                                      
//  SECLABEL=BISG,USER=BS0P                                                     
//*NODAFF BALANCEU                                                              
//*JOBAFF BALANCEU                                                              
//*                                                                             
//**NON-CA11-JOB    BTR004/BTR06                                                
//*                                                                             
//STEP10  EXEC BTR004,                                                          
//             PARAM='AUTO,REPLACE',                                            
//             DSN='BSSS.CAT527.MSDPI(0)'                                       
