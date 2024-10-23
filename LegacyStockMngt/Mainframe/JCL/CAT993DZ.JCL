//CAT993DZ JOB (BZ0P,0000),'ACATS: REPORT SPLIT',CLASS=1,MSGCLASS=W,            
//             USER=BZ0P,SECLABEL=BISG,                                         
//             SCHENV=STREAMZ                                                   
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//STEPBANK EXEC PGM=BANKHOL,                                                    
//             PARM='DATE=999999,DISP=P001,RC=0002'                             
//SYSOUT  DD SYSOUT=*                                                           
//*                                                                             
//STEP10  EXEC CAT993A,                                                         
//        HNB=BZZZ,                                                             
//        RPTID=DLV,                                                            
//        INFILE='BZZZ.SIAC0713.ACAT.DLV.RPT(0)',                               
//        COND=(2,EQ,STEPBANK)                                                  
//BTR0405 EXEC BTR004,                                                          
//             UNIT=BATCH,                                                      
//             DSN='BZZZ.CAT993.DLVPI(+1)',                                     
//             PARAM='AUTO,REPLACE.AC=BP',                                      
//             COND=(2,EQ,STEPBANK)                                             
