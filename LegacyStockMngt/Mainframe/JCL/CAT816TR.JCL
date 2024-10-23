//CAT816TR JOB (BR0P,0000),'WITHHELD ASSETS RPT ',CLASS=U,MSGCLASS=W,           
//  SECLABEL=BISG,                                                              
//             USER=BR0P                                                        
//*NODAFF BALANCEU                                                              
//*JOBAFF BALANCEU                                                              
//*                                                                             
//**NON-CA11-JOB    BTR004/BTR06                                                
//*                                                                             
//STEP10  EXEC BTR004,                                                          
//             PARAM='AUTO,REPLACE',                                            
//             DSN='BRRR.CAT816.WHDPI(0)'                                       
