//CAT50RLF JOB (BF0P,0000),'ACAT CYCLELOG',CLASS=1,MSGCLASS=W,                  
//         SCHENV=STREAMF,                                                      
//             USER=BF0P,                                                       
//  SECLABEL=BISG                                                               
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11     EXEC CA11                                                    00018000
//**                                                                    00019000
//*-------------------------------------------------------------------*         
//* CREATED 05/27/03 - FOR ETRADE MOCK RERUN ONLY                               
//*         'B' STREAM HOLD FILE IS USED AS INPUT                               
//*-------------------------------------------------------------------*         
//IDCAMS10 EXEC PGM=IDCAMS                                              00200000
//FILE1 DD DSN=SF.FFF.CAT500.CYCLELOG.HOLD,DISP=SHR                     00210002
//FILE2 DD DSN=BB.FFF.CAT500.CYCLELOG,DISP=SHR                          00220000
//SYSIN DD *                                                                    
  REPRO INFILE(FILE1) OUTFILE(FILE2) COUNT(1) REUSE                     00230000
//SYSPRINT DD SYSOUT=*                                                  00240000
//SYSOUT DD SYSOUT=*                                                    00250000
//**                                                                    00019000
//IDCAMS20 EXEC PGM=IDCAMS                                              00200000
//FILE1 DD DSN=BTTT.CAT511.CYCLELOG(0),DISP=SHR                         00210002
//FILE2 DD DSN=BFFF.CAT511.CYCLELOG(+1),DISP=(NEW,CATLG),               00220000
//  UNIT=BATCH,SPACE=(CYL,(1,1),RLSE),DCB=(GDG,LRECL=200,RECFM=FB)              
//SYSIN DD *                                                                    
  REPRO INFILE(FILE1) OUTFILE(FILE2) COUNT(1) REUSE                     00230000
//SYSPRINT DD SYSOUT=*                                                  00240000
//SYSOUT DD SYSOUT=*                                                    00250000
//*                                                                             
//BMT7100 EXEC PGM=BMT71,PARM='02'                                              
//DD01     DD  DSN=BFFF.CAT500R.TRAC(+1),DISP=(NEW,CATLG),                      
//  UNIT=BATCH,SPACE=(TRK,(1,1),RLSE),DCB=(LRECL=143,RECFM=FB)                  
//DD02     DD  DSN=BFFF.CAT500D.TRAC(+1),DISP=(NEW,CATLG),                      
//  UNIT=BATCH,SPACE=(TRK,(1,1),RLSE),DCB=(LRECL=143,RECFM=FB)                  
