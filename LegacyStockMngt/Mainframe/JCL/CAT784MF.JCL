//CAT784MF JOB (BF0P,DY00),'ACAT TAXLOT SPLIT',CLASS=U,MSGCLASS=W,              
//         SCHENV=STREAMF,                                                      
//        USER=BF0P,SECLABEL=BISG                                               
//*NODAFF BALANCEU                                                              
//*JOBAFF BALANCEU                                                              
//*                                                                             
//**NON-CA11-JOB    BTR004/BTR06                                                
//*                                                                             
//STEP10  EXEC BTR004,                                                          
//             BILFILE='BB.ZZZ.XBILL.BILLFL',                                   
//             BILLOG='BB.ZZZ.XBILL.BILLOG',                                    
//             C=STD2,                                                          
//             COPY=001,                                                        
//             DEST=W1GO,                                                       
//             DISP=SHR,                                                        
//             DSN='BFFF.CAT784R.TLPI(0)',                                      
//             DTSTAT='SZ.BTR04.DASH.AT1IFLE',                                  
//             PARAM='AUTO,REPLACE',                                            
//             Q=1,                                                             
//             TRACSTRM=ZZZ,                                                    
//             UNIT=                                                            
