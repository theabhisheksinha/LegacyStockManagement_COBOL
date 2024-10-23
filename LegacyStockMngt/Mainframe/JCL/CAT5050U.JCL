//CAT5050U JOB (BU1P,DY00),'ACATS SIAC CONFIRM  ',CLASS=1,MSGCLASS=W,           
//         USER=BU1P,PRTY=15,SECLABEL=BISG                                      
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//*********************************************************************         
//* READ SIAC CONFIRM FILE. CHECK IF TRANSFERS WENT OUT ON TIME.      *         
//*********************************************************************         
//STEP10  EXEC CAT505,                                                          
//             STREAM='U',                         * STREAM INDICATOR *         
//             INF='SIAC.CONFIRM.CADPU.S36667(0)'  * I/P FROM SIAC    *         
//*                                                                             
//WTO1    EXEC ADRDSSU,PARM='TYPRUN=NORUN',COND=(1,NE,STEP10.CAT505)            
//SYSPRINT DD SYSOUT=*                                                          
//SYSUDUMP DD SYSOUT=Y                                                          
//SYSIN DD *                                                                    
 WTO 'ACAT CYCLE 1 U-STREAM FILE MISSED CUT-OFF AT SIAC'                        
//*                                                                             
//WTO2    EXEC ADRDSSU,PARM='TYPRUN=NORUN',COND=(2,NE,STEP10.CAT505)            
//SYSPRINT DD SYSOUT=*                                                          
//SYSUDUMP DD SYSOUT=Y                                                          
//SYSIN DD *                                                                    
 WTO 'ACAT CYCLE 2 U-STREAM FILE MISSED CUT-OFF AT SIAC'                        
//*                                                                             
//WTO3    EXEC ADRDSSU,PARM='TYPRUN=NORUN',COND=(3,NE,STEP10.CAT505)            
//SYSPRINT DD SYSOUT=*                                                          
//SYSUDUMP DD SYSOUT=Y                                                          
//SYSIN DD *                                                                    
 WTO 'ACAT CYCLE 3 U-STREAM FILE MISSED CUT-OFF AT SIAC'                        
//*                                                                             
//WTO4    EXEC ADRDSSU,PARM='TYPRUN=NORUN',COND=(4,NE,STEP10.CAT505)            
//SYSPRINT DD SYSOUT=*                                                          
//SYSUDUMP DD SYSOUT=Y                                                          
//SYSIN DD *                                                                    
 WTO 'ACAT CYCLE 4 U-STREAM FILE MISSED CUT-OFF AT SIAC'                        
//*                                                                             
//WTO5    EXEC ADRDSSU,PARM='TYPRUN=NORUN',COND=(5,NE,STEP10.CAT505)            
//SYSPRINT DD SYSOUT=*                                                          
//SYSUDUMP DD SYSOUT=Y                                                          
//SYSIN DD *                                                                    
 WTO 'ACAT CYCLE 5 U-STREAM FILE MISSED CUT-OFF AT SIAC'                        
//*                                                                             
//WTO6    EXEC ADRDSSU,PARM='TYPRUN=NORUN',COND=(6,NE,STEP10.CAT505)            
//SYSPRINT DD SYSOUT=*                                                          
//SYSUDUMP DD SYSOUT=Y                                                          
//SYSIN DD *                                                                    
 WTO 'ACAT CONFIRM FILE MISSING FOR CYCLE 1 U-STREAM'                           
//*                                                                             
//WTO7    EXEC ADRDSSU,PARM='TYPRUN=NORUN',COND=(7,NE,STEP10.CAT505)            
//SYSPRINT DD SYSOUT=*                                                          
//SYSUDUMP DD SYSOUT=Y                                                          
//SYSIN DD *                                                                    
 WTO 'ACAT CONFIRM FILE MISSING FOR CYCLE 2 U-STREAM'                           
//*                                                                             
//WTO8    EXEC ADRDSSU,PARM='TYPRUN=NORUN',COND=(8,NE,STEP10.CAT505)            
//SYSPRINT DD SYSOUT=*                                                          
//SYSUDUMP DD SYSOUT=Y                                                          
//SYSIN DD *                                                                    
 WTO 'ACAT CONFIRM FILE MISSING FOR CYCLE 3 U-STREAM'                           
//*                                                                             
//WTO9    EXEC ADRDSSU,PARM='TYPRUN=NORUN',COND=(9,NE,STEP10.CAT505)            
//SYSPRINT DD SYSOUT=*                                                          
//SYSUDUMP DD SYSOUT=Y                                                          
//SYSIN DD *                                                                    
 WTO 'ACAT CONFIRM FILE MISSING FOR CYCLE 4 U-STREAM'                           
//*                                                                             
//WTO10   EXEC ADRDSSU,PARM='TYPRUN=NORUN',COND=(10,NE,STEP10.CAT505)           
//SYSPRINT DD SYSOUT=*                                                          
//SYSUDUMP DD SYSOUT=Y                                                          
//SYSIN DD *                                                                    
 WTO 'ACAT CONFIRM FILE MISSING FOR CYCLE 5 U-STREAM'                           
//*                                                                             
