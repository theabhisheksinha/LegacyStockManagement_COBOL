//CAT611TX JOB (BX0P,DY00),'NA INTRA DAY RPTPT ',CLASS=U,MSGCLASS=W,            
//         SCHENV=STREAMX,                                                      
//  SECLABEL=BISG,USER=BX0P                                                     
//*NODAFF BALANCEU                                                              
//*JOBAFF BALANCEU                                                              
//**NON-CA11-JOB    BTR004/BTR06                                                
//*********************************************************************         
//STEP10    EXEC BTR004,                                                        
//             UNIT=BATCH,                                                      
//             DSN='BXXX.CAT611.NA1PI(0)',                                      
//             PARAM='AUTO,REPLACE.AC=BP'                                       
