//CAT760MJ JOB (BJ0P,0000),'ACAT RV REPORT',CLASS=U,MSGCLASS=W,                 
//         SCHENV=STREAMJ,                                                      
//             REGION=4M,USER=BJ0P,                                             
//  SECLABEL=BISG                                                               
//*NODAFF BALANCEU                                                              
//*JOBAFF BALANCEU                                                              
//**NON-CA11-JOB    BTR004/BTR06                                                
//STEP10  EXEC BTR004,                                                          
//             DSN='BJJJ.CAT760.RPTPI(0)',                                      
//             PARAM='TRMX,REPLACE'                                             
//BTR04.PRINTER DD DSN=BJJJ.CAT760.RPTPI.TMP,                                   
//             DISP=(NEW,CATLG,DELETE),                                         
//             UNIT=BATCH,                                                      
//             SPACE=(CYL,(5,10),RLSE),                                         
//             DCB=(RECFM=FBSA,LRECL=143,BLKSIZE=27885)                         
//STEP11  EXEC MIXFDPD,                                                         
//             DSN='BJJJ.CAT760.RPTPI.TMP'                                      
