//CAT527MR JOB (BR0P,0000),'ACAT MSD EXCP RPT',CLASS=U,MSGCLASS=W,              
//         SCHENV=STREAMR,                                                      
//  SECLABEL=BISG,USER=BR0P                                                     
//*NODAFF BALANCEU                                                              
//*JOBAFF BALANCEU                                                              
//*                                                                             
//**NON-CA11-JOB    BTR004/BTR06                                                
//*                                                                             
//STEP10  EXEC BTR004,                                                          
//             PARAM='AUTO,REPLACE',                                            
//             DSN='BRRR.CAT527.MSDPI(0)'                                       
