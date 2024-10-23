//CAT802   PROC CARDLIB='BISG.CARDLIB',     *DB2 PLAN CARDLIB         *         
//             GEN='(0)',                 *I/P .DIVI                  *         
//             GDG='GDG,',                *O/P .CAT802.PEND.DVND      *         
//             GENP1='(+1)',              *O/P .CAT802.PEND.DVND      *         
//             HNB='BZZZ',                *O/P .CAT802.PEND.DVND  GDG *         
//             STREAM=ZZZ,                *O/P .CAT802.PEND.DVND  VSM *         
//             CARDLIB='BISG.CARDLIB',                                          
//             UNIT='BATCH',                                                    
//             PRTCL1='*',                                                      
//             PRTCL2='Y',                                                      
//             SPACE1='(CYL,(5,10),RLSE)'  *O/P .CAT802.DIVI      GDG *         
//*                                                                             
//*-------------------------------------------------------------------*         
//* SORT DIVIDEND FEED INTO /CLIENT/BR/ACCT/SECUITY/REC DATE/ SEQUENCE*         
//*-------------------------------------------------------------------*         
//SORT10  EXEC PGM=SORT,                                                00522000
//             REGION=4M,                                               00523000
//             PARM='SIZE=4M,MSG=AP'                                    00524000
//SORTIN    DD DSN=&HNB..BDS620CL.ACAT&GEN,                             00524100
//             DISP=OLD,DCB=BUFNO=5                                     00526000
//SORTOUT   DD DSN=&HNB..CAT802.PEND.DVND&GENP1,                        00527100
//             DISP=(NEW,CATLG,DELETE),                                 00528000
//             UNIT=&UNIT,                                              00529000
//             SPACE=&SPACE1,                                           00529100
//             DCB=(&GDG.LRECL=100,RECFM=FB)                            00529200
//SORTLIST  DD SYSOUT=&PRTCL1                                           00529300
//*                                                                             
//* RECORD TYPE=F                                                       00010000
//*  SORT FIELDS=(01,30,CH,A)                                           00020001
//*  SUM FIELDS=(50,9,59,9,68,9),FORMAT=PD                              00020001
//*  END                                                                00529400
//SYSIN    DD  DSN=&CARDLIB(CAT802S1),                                          
//             DISP=SHR                                                         
//SYSOUT    DD SYSOUT=&PRTCL1                                                   
//SYSUDUMP  DD SYSOUT=&PRTCL2                                                   
//*                                                                             
//IDCAM20 EXEC PGM=FASTVSAM                                                     
//SYSPRINT DD SYSOUT=&PRTCL1                                                    
//DD1      DD  DSN=&HNB..CAT802.PEND.DVND&GENP1,                                
//             DISP=SHR                                                         
//DD2      DD DSN=BB.&STREAM..CAT802.PEND.DVND,                                 
//             DISP=OLD                                                         
//SYSIN    DD DSN=BISG.CARDLIB(REPRO),                                          
//             DISP=SHR                                                         
//*                                                                             
