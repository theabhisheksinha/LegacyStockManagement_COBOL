//CAT5070U JOB (BU1P,DY00),'ACATS CBRS CONFIRM',CLASS=1,MSGCLASS=W,             
//         SCHENV=STREAMU,                                                      
//         USER=BU1P,SECLABEL=BISG                                              
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//*********************************************************************         
//* READ SIAC CONFIRM FILE. CHECK IF TRANSFERS WENT OUT ON TIME.      *         
//* IF NOT, SET CC=04 TO CAUSE EMAIL STEP TO RUN.                     *         
//*********************************************************************         
//STEP10  EXEC CAT507,                                                          
//             STREAM='U',                         * STREAM INDICATOR *         
//             INF='SIAC.CONFIRM.CADPU.S36708.NDMS(0)', I/P FROM SIAC *         
//             OUTF='BUUU.CAT507.CBRS.EMAIL'       *                  *         
//*                                                                             
//*********************************************************************         
//* CONDITIONAL BASED ON RC=04, SEND EMAIL WITH PROGRAM GENERATED     *         
//* MESSAGE TO THE ADDRESSES DEFINED IN THE CARDLIB.                  *         
//*********************************************************************         
//EMAIL   EXEC SORT,COND=(4,NE,STEP10.CAT507)                                   
//SORTIN  DD DISP=SHR,DSN=BISG.CARDLIB(CAT507EM)                                
//        DD DISP=SHR,DSN=BUUU.CAT507.CBRS.EMAIL                                
//SORTOUT DD SYSOUT=B,DEST=(ADPJSP1,SMTP1)                                      
//SYSOUT  DD SYSOUT=*                                                           
//SORTLIST DD SYSOUT=*                                                          
//SYSIN   DD DSN=BISG.CARDLIB(COPY),DISP=SHR                                    
