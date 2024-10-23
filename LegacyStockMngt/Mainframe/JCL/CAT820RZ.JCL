//CAT820RZ JOB (BZ0P,0000),'ACAT RET FIX ',CLASS=1,MSGCLASS=W,                  
//  SECLABEL=BISG,                                                              
//             USER=BZ0P,                                                       
//             SCHENV=STREAMZ                                                   
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//*                                                                             
//CA11    EXEC CA11                                                             
//*                                                                             
//*    FIX BATCH AND ENTRY CODE ON BLLL.CAT820.RET FILE                         
//*    IF BATCH CODE IS BLANK, POPULATE BATCH CODE WITH 'NS'                    
//*    IF ENTRY CODE IS BLANK, POPULATE ENTRY CODE WITH 'ADJ'                   
//*    POPULATE BOTH CUSTOMER ACCOUNT SIDE AND OFFSET ACCOUNT SIDE              
//*                                                                             
//STEP01   EXEC EZTPCG,REGION=4M                                                
//FILEIN   DD  DISP=SHR,DSN=BAAA.CAT820.RET(0)                                  
//FILEOT   DD  DSN=BAAA.CAT820.RET(+1),                                         
//             DISP=(NEW,CATLG,DELETE),UNIT=BATCH,                              
//             SPACE=(CYL,(1,1),RLSE),DCB=(GDG)                                 
//PRTFLE   DD  SYSOUT=*,                                                        
//             DCB=(RECFM=FBSA,LRECL=133)                                       
//SOURCE   DD *                                                                 
FILE FILEIN VB (631 27998)                                                      
IN-REC                                    1             631 A                   
IN-KEY                                    1             104 A                   
IN-CLT                                    1               3 A                   
IN-BATCH                                 29               2 A                   
IN-ENTRY                                 50               3 A                   
IN-BATCH2                               149               2 A                   
IN-ENTRY2                               170               3 A                   
FILE FILEOT VB (631 27998)                                                      
OT-REC                                    1             631 A                   
OT-CLT                                    1               3 A                   
OT-BATCH                                 29               2 A                   
OT-ENTRY                                 50               3 A                   
OT-BATCH2                               149               2 A                   
OT-ENTRY2                               170               3 A                   
FILE PRTFLE PRINTER                                                             
JOB INPUT FILEIN                                                                
IF  IN-CLT = '003'                                                              
  IF  IN-BATCH EQ ' '                                                           
      IN-BATCH = 'BK'                                                           
      IN-ENTRY = 'FEE'                                                          
    IF  IN-BATCH2 EQ '  '                                                       
        IN-BATCH2 = 'BK'                                                        
        IN-ENTRY2 = 'FEE'                                                       
    END-IF                                                                      
  END-IF                                                                        
  DISPLAY IN-KEY                                                                
ELSE                                                                            
  IF  IN-BATCH EQ ' '                                                           
      IN-BATCH = 'NS'                                                           
      IN-ENTRY = 'ADJ'                                                          
    IF  IN-BATCH2 EQ '  '                                                       
        IN-BATCH2 = 'NS'                                                        
        IN-ENTRY2 = 'ADJ'                                                       
    END-IF                                                                      
  DISPLAY IN-KEY                                                                
  END-IF                                                                        
END-IF                                                                          
PUT FILEOT FROM FILEIN                                                          
/*                                                                              
//STEP02   EXEC EZTPCG,REGION=4M                                                
//FILEIN   DD  DISP=SHR,DSN=BBBB.CAT820.RET(0)                                  
//FILEOT   DD  DSN=BBBB.CAT820.RET(+1),                                         
//             DISP=(NEW,CATLG,DELETE),UNIT=BATCH,                              
//             SPACE=(CYL,(1,1),RLSE),DCB=(GDG)                                 
//PRTFLE   DD  SYSOUT=*,                                                        
//             DCB=(RECFM=FBSA,LRECL=133)                                       
//SOURCE   DD *                                                                 
FILE FILEIN VB (631 27998)                                                      
IN-REC                                    1             631 A                   
IN-KEY                                    1             104 A                   
IN-CLT                                    1               3 A                   
IN-BATCH                                 29               2 A                   
IN-ENTRY                                 50               3 A                   
IN-BATCH2                               149               2 A                   
IN-ENTRY2                               170               3 A                   
FILE FILEOT VB (631 27998)                                                      
OT-REC                                    1             631 A                   
OT-CLT                                    1               3 A                   
OT-BATCH                                 29               2 A                   
OT-ENTRY                                 50               3 A                   
OT-BATCH2                               149               2 A                   
OT-ENTRY2                               170               3 A                   
FILE PRTFLE PRINTER                                                             
JOB INPUT FILEIN                                                                
IF  IN-BATCH EQ ' '                                                             
    IN-BATCH = 'NS'                                                             
    IN-ENTRY = 'ADJ'                                                            
    IF  IN-BATCH2 EQ '  '                                                       
        IN-BATCH2 = 'NS'                                                        
        IN-ENTRY2 = 'ADJ'                                                       
    END-IF                                                                      
  DISPLAY IN-KEY                                                                
END-IF                                                                          
PUT FILEOT FROM FILEIN                                                          
/*                                                                              
//STEP03   EXEC EZTPCG,REGION=4M                                                
//FILEIN   DD  DISP=SHR,DSN=BIII.CAT820.RET(0)                                  
//FILEOT   DD  DSN=BIII.CAT820.RET(+1),                                         
//             DISP=(NEW,CATLG,DELETE),UNIT=BATCH,                              
//             SPACE=(CYL,(1,1),RLSE),DCB=(GDG)                                 
//PRTFLE   DD  SYSOUT=*,                                                        
//             DCB=(RECFM=FBSA,LRECL=133)                                       
//SOURCE   DD *                                                                 
FILE FILEIN VB (631 27998)                                                      
IN-REC                                    1             631 A                   
IN-KEY                                    1             104 A                   
IN-CLT                                    1               3 A                   
IN-BATCH                                 29               2 A                   
IN-ENTRY                                 50               3 A                   
IN-BATCH2                               149               2 A                   
IN-ENTRY2                               170               3 A                   
FILE FILEOT VB (631 27998)                                                      
OT-REC                                    1             631 A                   
OT-CLT                                    1               3 A                   
OT-BATCH                                 29               2 A                   
OT-ENTRY                                 50               3 A                   
OT-BATCH2                               149               2 A                   
OT-ENTRY2                               170               3 A                   
FILE PRTFLE PRINTER                                                             
JOB INPUT FILEIN                                                                
IF  IN-BATCH EQ ' '                                                             
    IN-BATCH = 'NS'                                                             
    IN-ENTRY = 'ADJ'                                                            
    IF  IN-BATCH2 EQ '  '                                                       
        IN-BATCH2 = 'NS'                                                        
        IN-ENTRY2 = 'ADJ'                                                       
    END-IF                                                                      
  DISPLAY IN-KEY                                                                
END-IF                                                                          
PUT FILEOT FROM FILEIN                                                          
/*                                                                              
//STEP04   EXEC EZTPCG,REGION=4M                                                
//FILEIN   DD  DISP=SHR,DSN=BJJJ.CAT820.RET(0)                                  
//FILEOT   DD  DSN=BJJJ.CAT820.RET(+1),                                         
//             DISP=(NEW,CATLG,DELETE),UNIT=BATCH,                              
//             SPACE=(CYL,(1,1),RLSE),DCB=(GDG)                                 
//PRTFLE   DD  SYSOUT=*,                                                        
//             DCB=(RECFM=FBSA,LRECL=133)                                       
//SOURCE   DD *                                                                 
FILE FILEIN VB (631 27998)                                                      
IN-REC                                    1             631 A                   
IN-KEY                                    1             104 A                   
IN-CLT                                    1               3 A                   
IN-BATCH                                 29               2 A                   
IN-ENTRY                                 50               3 A                   
IN-BATCH2                               149               2 A                   
IN-ENTRY2                               170               3 A                   
FILE FILEOT VB (631 27998)                                                      
OT-REC                                    1             631 A                   
OT-CLT                                    1               3 A                   
OT-BATCH                                 29               2 A                   
OT-ENTRY                                 50               3 A                   
OT-BATCH2                               149               2 A                   
OT-ENTRY2                               170               3 A                   
FILE PRTFLE PRINTER                                                             
JOB INPUT FILEIN                                                                
IF  IN-BATCH EQ ' '                                                             
    IN-BATCH = 'NS'                                                             
    IN-ENTRY = 'ADJ'                                                            
    IF  IN-BATCH2 EQ '  '                                                       
        IN-BATCH2 = 'NS'                                                        
        IN-ENTRY2 = 'ADJ'                                                       
    END-IF                                                                      
  DISPLAY IN-KEY                                                                
END-IF                                                                          
PUT FILEOT FROM FILEIN                                                          
/*                                                                              
//STEP05   EXEC EZTPCG,REGION=4M                                                
//FILEIN   DD  DISP=SHR,DSN=BLLL.CAT820.RET(0)                                  
//FILEOT   DD  DSN=BLLL.CAT820.RET(+1),                                         
//             DISP=(NEW,CATLG,DELETE),UNIT=BATCH,                              
//             SPACE=(CYL,(1,1),RLSE),DCB=(GDG)                                 
//PRTFLE   DD  SYSOUT=*,                                                        
//             DCB=(RECFM=FBSA,LRECL=133)                                       
//SOURCE   DD *                                                                 
FILE FILEIN VB (631 27998)                                                      
IN-REC                                    1             631 A                   
IN-KEY                                    1             104 A                   
IN-CLT                                    1               3 A                   
IN-BATCH                                 29               2 A                   
IN-ENTRY                                 50               3 A                   
IN-BATCH2                               149               2 A                   
IN-ENTRY2                               170               3 A                   
FILE FILEOT VB (631 27998)                                                      
OT-REC                                    1             631 A                   
OT-CLT                                    1               3 A                   
OT-BATCH                                 29               2 A                   
OT-ENTRY                                 50               3 A                   
OT-BATCH2                               149               2 A                   
OT-ENTRY2                               170               3 A                   
FILE PRTFLE PRINTER                                                             
JOB INPUT FILEIN                                                                
IF  IN-BATCH EQ ' '                                                             
    IN-BATCH = 'NS'                                                             
    IN-ENTRY = 'ADJ'                                                            
    IF  IN-BATCH2 EQ '  '                                                       
        IN-BATCH2 = 'NS'                                                        
        IN-ENTRY2 = 'ADJ'                                                       
    END-IF                                                                      
  DISPLAY IN-KEY                                                                
END-IF                                                                          
PUT FILEOT FROM FILEIN                                                          
/*                                                                              
//STEP06   EXEC EZTPCG,REGION=4M                                                
//FILEIN   DD  DISP=SHR,DSN=BNNN.CAT820.RET(0)                                  
//FILEOT   DD  DSN=BNNN.CAT820.RET(+1),                                         
//             DISP=(NEW,CATLG,DELETE),UNIT=BATCH,                              
//             SPACE=(CYL,(1,1),RLSE),DCB=(GDG)                                 
//PRTFLE   DD  SYSOUT=*,                                                        
//             DCB=(RECFM=FBSA,LRECL=133)                                       
//SOURCE   DD *                                                                 
FILE FILEIN VB (631 27998)                                                      
IN-REC                                    1             631 A                   
IN-KEY                                    1             104 A                   
IN-CLT                                    1               3 A                   
IN-BATCH                                 29               2 A                   
IN-ENTRY                                 50               3 A                   
IN-BATCH2                               149               2 A                   
IN-ENTRY2                               170               3 A                   
FILE FILEOT VB (631 27998)                                                      
OT-REC                                    1             631 A                   
OT-CLT                                    1               3 A                   
OT-BATCH                                 29               2 A                   
OT-ENTRY                                 50               3 A                   
OT-BATCH2                               149               2 A                   
OT-ENTRY2                               170               3 A                   
FILE PRTFLE PRINTER                                                             
JOB INPUT FILEIN                                                                
IF  IN-BATCH EQ ' '                                                             
    IN-BATCH = 'NS'                                                             
    IN-ENTRY = 'ADJ'                                                            
    IF  IN-BATCH2 EQ '  '                                                       
        IN-BATCH2 = 'NS'                                                        
        IN-ENTRY2 = 'ADJ'                                                       
    END-IF                                                                      
  DISPLAY IN-KEY                                                                
END-IF                                                                          
PUT FILEOT FROM FILEIN                                                          
/*                                                                              
//STEP07   EXEC EZTPCG,REGION=4M                                                
//FILEIN   DD  DISP=SHR,DSN=BPPP.CAT820.RET(0)                                  
//FILEOT   DD  DSN=BPPP.CAT820.RET(+1),                                         
//             DISP=(NEW,CATLG,DELETE),UNIT=BATCH,                              
//             SPACE=(CYL,(1,1),RLSE),DCB=(GDG)                                 
//PRTFLE   DD  SYSOUT=*,                                                        
//             DCB=(RECFM=FBSA,LRECL=133)                                       
//SOURCE   DD *                                                                 
FILE FILEIN VB (631 27998)                                                      
IN-REC                                    1             631 A                   
IN-KEY                                    1             104 A                   
IN-CLT                                    1               3 A                   
IN-BATCH                                 29               2 A                   
IN-ENTRY                                 50               3 A                   
IN-BATCH2                               149               2 A                   
IN-ENTRY2                               170               3 A                   
FILE FILEOT VB (631 27998)                                                      
OT-REC                                    1             631 A                   
OT-CLT                                    1               3 A                   
OT-BATCH                                 29               2 A                   
OT-ENTRY                                 50               3 A                   
OT-BATCH2                               149               2 A                   
OT-ENTRY2                               170               3 A                   
FILE PRTFLE PRINTER                                                             
JOB INPUT FILEIN                                                                
IF  IN-BATCH EQ ' '                                                             
    IN-BATCH = 'NS'                                                             
    IN-ENTRY = 'CLF'                                                            
    IF  IN-BATCH2 EQ '  '                                                       
        IN-BATCH2 = 'NS'                                                        
        IN-ENTRY2 = 'CLF'                                                       
    END-IF                                                                      
  DISPLAY IN-KEY                                                                
END-IF                                                                          
PUT FILEOT FROM FILEIN                                                          
/*                                                                              
//STEP08   EXEC EZTPCG,REGION=4M                                                
//FILEIN   DD  DISP=SHR,DSN=BUUU.CAT820.RET(0)                                  
//FILEOT   DD  DSN=BUUU.CAT820.RET(+1),                                         
//             DISP=(NEW,CATLG,DELETE),UNIT=BATCH,                              
//             SPACE=(CYL,(1,1),RLSE),DCB=(GDG)                                 
//PRTFLE   DD  SYSOUT=*,                                                        
//             DCB=(RECFM=FBSA,LRECL=133)                                       
//SOURCE   DD *                                                                 
FILE FILEIN VB (631 27998)                                                      
IN-REC                                    1             631 A                   
IN-KEY                                    1             104 A                   
IN-CLT                                    1               3 A                   
IN-BATCH                                 29               2 A                   
IN-ENTRY                                 50               3 A                   
IN-BATCH2                               149               2 A                   
IN-ENTRY2                               170               3 A                   
FILE FILEOT VB (631 27998)                                                      
OT-REC                                    1             631 A                   
OT-CLT                                    1               3 A                   
OT-BATCH                                 29               2 A                   
OT-ENTRY                                 50               3 A                   
OT-BATCH2                               149               2 A                   
OT-ENTRY2                               170               3 A                   
FILE PRTFLE PRINTER                                                             
JOB INPUT FILEIN                                                                
IF  IN-BATCH EQ ' '                                                             
    IN-BATCH = 'NS'                                                             
    IN-ENTRY = 'ADJ'                                                            
    IF  IN-BATCH2 EQ '  '                                                       
        IN-BATCH2 = 'NS'                                                        
        IN-ENTRY2 = 'ADJ'                                                       
    END-IF                                                                      
  DISPLAY IN-KEY                                                                
END-IF                                                                          
PUT FILEOT FROM FILEIN                                                          
/*                                                                              
//STEP09   EXEC EZTPCG,REGION=4M                                                
//FILEIN   DD  DISP=SHR,DSN=BXXX.CAT820.RET(0)                                  
//FILEOT   DD  DSN=BXXX.CAT820.RET(+1),                                         
//             DISP=(NEW,CATLG,DELETE),UNIT=BATCH,                              
//             SPACE=(CYL,(1,1),RLSE),DCB=(GDG)                                 
//PRTFLE   DD  SYSOUT=*,                                                        
//             DCB=(RECFM=FBSA,LRECL=133)                                       
//SOURCE   DD *                                                                 
FILE FILEIN VB (631 27998)                                                      
IN-REC                                    1             631 A                   
IN-KEY                                    1             104 A                   
IN-CLT                                    1               3 A                   
IN-BATCH                                 29               2 A                   
IN-ENTRY                                 50               3 A                   
IN-BATCH2                               149               2 A                   
IN-ENTRY2                               170               3 A                   
FILE FILEOT VB (631 27998)                                                      
OT-REC                                    1             631 A                   
OT-CLT                                    1               3 A                   
OT-BATCH                                 29               2 A                   
OT-ENTRY                                 50               3 A                   
OT-BATCH2                               149               2 A                   
OT-ENTRY2                               170               3 A                   
FILE PRTFLE PRINTER                                                             
JOB INPUT FILEIN                                                                
IF  IN-BATCH EQ ' '                                                             
    IN-BATCH = 'NS'                                                             
    IN-ENTRY = 'ADJ'                                                            
    IF  IN-BATCH2 EQ '  '                                                       
        IN-BATCH2 = 'NS'                                                        
        IN-ENTRY2 = 'ADJ'                                                       
    END-IF                                                                      
  DISPLAY IN-KEY                                                                
END-IF                                                                          
PUT FILEOT FROM FILEIN                                                          
/*                                                                              
//STEP10   EXEC EZTPCG,REGION=4M                                                
//FILEIN   DD  DISP=SHR,DSN=BYYY.CAT820.RET(0)                                  
//FILEOT   DD  DSN=BYYY.CAT820.RET(+1),                                         
//             DISP=(NEW,CATLG,DELETE),UNIT=BATCH,                              
//             SPACE=(CYL,(1,1),RLSE),DCB=(GDG)                                 
//PRTFLE   DD  SYSOUT=*,                                                        
//             DCB=(RECFM=FBSA,LRECL=133)                                       
//SOURCE   DD *                                                                 
FILE FILEIN VB (631 27998)                                                      
IN-REC                                    1             631 A                   
IN-KEY                                    1             104 A                   
IN-CLT                                    1               3 A                   
IN-BATCH                                 29               2 A                   
IN-ENTRY                                 50               3 A                   
IN-BATCH2                               149               2 A                   
IN-ENTRY2                               170               3 A                   
FILE FILEOT VB (631 27998)                                                      
OT-REC                                    1             631 A                   
OT-CLT                                    1               3 A                   
OT-BATCH                                 29               2 A                   
OT-ENTRY                                 50               3 A                   
OT-BATCH2                               149               2 A                   
OT-ENTRY2                               170               3 A                   
FILE PRTFLE PRINTER                                                             
JOB INPUT FILEIN                                                                
IF  IN-BATCH EQ ' '                                                             
    IN-BATCH = 'NS'                                                             
    IN-ENTRY = 'ADJ'                                                            
    IF  IN-BATCH2 EQ '  '                                                       
        IN-BATCH2 = 'NS'                                                        
        IN-ENTRY2 = 'ADJ'                                                       
    END-IF                                                                      
  DISPLAY IN-KEY                                                                
END-IF                                                                          
PUT FILEOT FROM FILEIN                                                          
/*                                                                              
