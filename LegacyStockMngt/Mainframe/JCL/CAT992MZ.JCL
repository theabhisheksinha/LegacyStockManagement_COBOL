//CAT992MZ JOB (BZ0P,0000),'ACATS: REPORT LOAD',CLASS=U,MSGCLASS=W,             
//  SECLABEL=BISG,                                                              
//             USER=BZ0P,                                                       
//             SCHENV=STREAMZ                                                   
//*NODAFF BALANCEU                                                              
//*JOBAFF BALANCEU                                                              
//**NON-CA11-JOB                                                                
//*                                                                             
//STEPBANK EXEC PGM=BANKHOL,                                                    
//             PARM='DATE=999999,DISP=P001,RC=0002'                             
//SYSOUT    DD  SYSOUT=*                                                        
//*                                                                             
//BTR0410  EXEC BTR004,                                                         
//             UNIT=BATCH,                                                      
//             DSN='BZZZ.CAT992.STLPI(0)',                                      
//             PARAM='AUTO,REPLACE.AC=BP',                                      
//             COND=(2,EQ,STEPBANK)                                             
//BTR0415  EXEC BTR004,                                                         
//             UNIT=BATCH,                                                      
//             DSN='BZZZ.CAT992.REJPI(0)',                                      
//             PARAM='AUTO,REPLACE.AC=BP',                                      
//             COND=(2,EQ,STEPBANK)                                             
