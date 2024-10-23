//CAT650LH JOB (BH0P,0000),'ACAT CAT650LN',CLASS=5,MSGCLASS=W,                  
//         SCHENV=STREAMH,                                                      
//             USER=BH0P,                                                       
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE5                                                              
//*JOBAFF BALANCE5                                                              
//CA11STEP EXEC CA11                                                            
//**                                                                            
//SORT10  EXEC SORT,                                                            
//             REGION=4M                                                        
//SORTIN  DD DSN=BTTT.CAT650DB.ACATPEND(0),DISP=SHR                             
//SORTOUT DD DSN=BHHH.CAT650DB.ACATPEND(+1),DISP=(,CATLG,DELETE),               
//             SPACE=(CYL,(2,5),RLSE),UNIT=BATCH,                               
//             DCB=(GDG,BUFNO=75)                                               
//SYSOUT DD SYSOUT=*                                                            
//SORTLIST DD SYSOUT=*                                                          
//SYSIN  DD *                                                                   
 RECORD TYPE=V                                                                  
 INCLUDE COND=(5,3,CH,EQ,C'012')                                                
 SORT FIELDS=COPY                                                               
 END                                                                            
//SORT15  EXEC SORT,                                                            
//             REGION=4M                                                        
//SORTIN  DD DSN=BTTT.CAT650SP.ACATPEND(0),DISP=SHR                             
//SORTOUT DD DSN=BHHH.CAT650SP.ACATPEND(+1),DISP=(,CATLG,DELETE),               
//             SPACE=(CYL,(2,5),RLSE),UNIT=BATCH,                               
//             DCB=(GDG,BUFNO=75)                                               
//SYSOUT DD SYSOUT=*                                                            
//SORTLIST DD SYSOUT=*                                                          
//SYSIN  DD *                                                                   
 RECORD TYPE=V                                                                  
 INCLUDE COND=(5,3,CH,EQ,C'012')                                                
 SORT FIELDS=COPY                                                               
 END                                                                            
//P2UTIL20 EXEC PGM=P2UTIL,PARM='A,500,9999999'                                 
//DISKF DD DSN=BTTT.CAT650.P2IPT(0),DISP=SHR                                    
//OUTF  DD DSN=BHHH.CAT650.P2IPT(+1),DISP=(NEW,CATLG,DELETE),                   
//         DCB=(RECFM=FB,LRECL=120),                                            
//         SPACE=(CYL,(2,20),RLSE),UNIT=BATCH                                   
//PRINTF  DD SYSOUT=*                                                           
//SYSIN   DD *                                                                  
001-05-C-EQ-DATE=                                                    OR         
001-08-C-EQ-REC-CNT=                                                            
/*                                                                              
//**********************************************                                
//*      ADJUST TRAILER                        *                                
//**********************************************                                
//ADJTRL20 EXEC PGM=ADJTRL,PARM='009,11,-1'                                     
//STEPLIB  DD  DSN=TSTBPS.SX.TESTLIB,DISP=SHR                                   
//INF      DD  DSN=BHHH.CAT650.P2IPT(+1),DISP=SHR                               
//OUTF     DD  DSN=BHHH.CAT650.P2IPT(+1),DISP=SHR                               
//*                                                                             
//P2UTIL30 EXEC PGM=P2UTIL,PARM='A,500,9999999'                                 
//DISKF DD DSN=BTTT.CAT820.P2FEE(0),DISP=SHR                                    
//OUTF  DD DSN=BHHH.CAT820.P2FEE(+1),DISP=(NEW,CATLG,DELETE),                   
//         DCB=(RECFM=FB,LRECL=120),                                            
//         SPACE=(CYL,(2,20),RLSE),UNIT=BATCH                                   
//PRINTF  DD SYSOUT=*                                                           
//SYSIN   DD *                                                                  
001-05-C-EQ-DATE=                                                    OR         
001-08-C-EQ-REC-CNT=                                                            
/*                                                                              
//**********************************************                                
//*      ADJUST TRAILER                        *                                
//**********************************************                                
//ADJTRL30 EXEC PGM=ADJTRL,PARM='009,11,-1'                                     
//STEPLIB  DD  DSN=TSTBPS.SX.TESTLIB,DISP=SHR                                   
//INF      DD  DSN=BHHH.CAT820.P2FEE(+1),DISP=SHR                               
//OUTF     DD  DSN=BHHH.CAT820.P2FEE(+1),DISP=SHR                               
//*                                                                             
//P2UTIL30 EXEC PGM=P2UTIL,PARM='A,500,9999999'                                 
//DISKF DD DSN=BTTT.CAT820.TACTL(0),DISP=SHR                                    
//OUTF  DD DSN=BHHH.CAT820.TACTL(+1),DISP=(NEW,CATLG,DELETE),                   
//         DCB=(RECFM=VB,LRECL=8004),                                           
//         SPACE=(CYL,(2,20),RLSE),UNIT=BATCH                                   
//PRINTF  DD SYSOUT=*                                                           
//SYSIN   DD *                                                                  
141-05-C-EQ-DATE=                                                    OR         
141-08-C-EQ-REC-CNT=                                                            
/*                                                                              
//BMT7105 EXEC PGM=BMT71,PARM='05'                                              
//DD01     DD  DSN=BHHH.CAT650.XSTLPI(+1),DISP=(NEW,CATLG),                     
//  UNIT=BATCH,SPACE=(TRK,(1,1),RLSE),DCB=(LRECL=143,RECFM=FB)                  
//DD02     DD  DSN=BHHH.CAT650.RPTPI(+1),DISP=(NEW,CATLG),                      
//  UNIT=BATCH,SPACE=(TRK,(1,1),RLSE),DCB=(LRECL=143,RECFM=FB)                  
//DD03     DD  DSN=BHHH.CAT610.PNDPI(+1),DISP=(NEW,CATLG),                      
//  UNIT=BATCH,SPACE=(TRK,(1,1),RLSE),DCB=(LRECL=143,RECFM=FB)                  
//DD04     DD  DSN=BHHH.CAT610.NAUPI(+1),DISP=(NEW,CATLG),                      
//  UNIT=BATCH,SPACE=(TRK,(1,1),RLSE),DCB=(LRECL=143,RECFM=FB)                  
//DD05     DD  DSN=BHHH.CAT820.LQRPI(+1),DISP=(NEW,CATLG),                      
//  UNIT=BATCH,SPACE=(TRK,(1,1),RLSE),DCB=(LRECL=143,RECFM=FB)                  
//*                                                                             
