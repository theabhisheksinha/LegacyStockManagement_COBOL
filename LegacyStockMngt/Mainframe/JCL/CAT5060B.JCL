//CAT5060B JOB (BB0P,DY00),'ACATS SIAC CONFIRM 2',CLASS=1,MSGCLASS=W,           
//         USER=BB0P,PRTY=15,SECLABEL=BISG,SCHENV=STREAMB                       
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//*********************************************************************         
//*COMPARE RECORD COUNT ON SIAC CONFIRM FILE TO SIAC ACATTRAN FILE.   *         
//*********************************************************************         
//STEP10  EXEC CAT506,                                                          
//             STREAM='B',                         * STREAM INDICATOR *         
//             HNB1='BBBB',               *I/P .CAT511.ACATTRNS   GDG *         
//             INF='SIAC.CONFIRM.CADPB.S36667(0)'  * I/P FROM SIAC    *         
//*                                                                             
//WTO1    EXEC ADRDSSU,PARM='TYPRUN=NORUN',COND=(1,NE,STEP10.CAT506)            
//SYSPRINT DD SYSOUT=*                                                          
//SYSUDUMP DD SYSOUT=Y                                                          
//SYSIN DD *                                                                    
 WTO 'ACAT CYCLE 1 B-STREAM SIAC RECORDS PROCESSED < SENT'                      
//*                                                                             
//WTO2    EXEC ADRDSSU,PARM='TYPRUN=NORUN',COND=(2,NE,STEP10.CAT506)            
//SYSPRINT DD SYSOUT=*                                                          
//SYSUDUMP DD SYSOUT=Y                                                          
//SYSIN DD *                                                                    
 WTO 'ACAT CYCLE 2 B-STREAM SIAC RECORDS PROCESSED < SENT'                      
//*                                                                             
//WTO3    EXEC ADRDSSU,PARM='TYPRUN=NORUN',COND=(3,NE,STEP10.CAT506)            
//SYSPRINT DD SYSOUT=*                                                          
//SYSUDUMP DD SYSOUT=Y                                                          
//SYSIN DD *                                                                    
 WTO 'ACAT CYCLE 3 B-STREAM SIAC RECORDS PROCESSED < SENT'                      
//*                                                                             
//WTO4    EXEC ADRDSSU,PARM='TYPRUN=NORUN',COND=(4,NE,STEP10.CAT506)            
//SYSPRINT DD SYSOUT=*                                                          
//SYSUDUMP DD SYSOUT=Y                                                          
//SYSIN DD *                                                                    
 WTO 'ACAT CYCLE 4 B-STREAM SIAC RECORDS PROCESSED < SENT'                      
//*                                                                             
//WTO5    EXEC ADRDSSU,PARM='TYPRUN=NORUN',COND=(5,NE,STEP10.CAT506)            
//SYSPRINT DD SYSOUT=*                                                          
//SYSUDUMP DD SYSOUT=Y                                                          
//SYSIN DD *                                                                    
 WTO 'ACAT CYCLE 5 B-STREAM SIAC RECORDS PROCESSED < SENT'                      
//*                                                                             
