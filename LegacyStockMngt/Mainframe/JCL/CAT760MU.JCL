//CAT760MU JOB (BU1P,0000),'ACAT FS RPT TRAC',CLASS=U,MSGCLASS=W,               
//         SCHENV=STREAMU,                                                      
//             REGION=4M,USER=BU1P,                                             
//  SECLABEL=BISG                                                               
//*NODAFF BALANCEU                                                              
//*JOBAFF BALANCEU                                                              
//**NON-CA11-JOB    BTR004/BTR06                                                
//STEP10  EXEC BTR004,                                                          
//             DSN='BUUU.CAT760.RPTPI(0)',                                      
//             PARAM='TRMX,REPLACE'                                             
//BTR04.PRINTER DD DSN=BUUU.CAT760.MXT,                                         
//             DISP=(NEW,CATLG,DELETE),                                         
//             UNIT=BATCH,                                                      
//             SPACE=(CYL,(5,10),RLSE),                                         
//             DCB=(RECFM=FBSA,LRECL=143,BLKSIZE=27885)                         
//STEP11  EXEC MIXFDPD,                                                         
//             DSN='BUUU.CAT760.MXT'                                            
