//CAT760MH JOB (BH0P,0000),'ACAT FS RPT TRAC',CLASS=U,MSGCLASS=W,               
//         SCHENV=STREAMH,                                                      
//             REGION=4M,USER=BH0P,                                             
//  SECLABEL=BISG                                                               
//*NODAFF BALANCEU                                                              
//*JOBAFF BALANCEU                                                              
//**NON-CA11-JOB    BTR004/BTR06                                                
//STEP10  EXEC BTR004,                                                          
//             BILFILE='BB.ZZZ.XBILL.BILLFL',                                   
//             BILLOG='BB.ZZZ.XBILL.BILLOG',                                    
//             C=STD2,                                                          
//             COPY=001,                                                        
//             DEST=W1GO,                                                       
//             DISP=SHR,                                                        
//             DSN='BHHH.CAT760.RPTPI(0)',                                      
//             DTSTAT='SZ.BTR04.DASH.AT1IFLE',                                  
//             PARAM='AUTO,REPLACE',                                            
//             Q=1,                                                             
//*                                                                             
//             TRACSTRM=ZZZ,                                                    
//             UNIT=                                                            
