//CAT6201  PROC CARDLIB='BISG.CARDLIB',   *CARDLIB                    *         
//             HNB=,                      *I/P ZIPF FILE          GDG *         
//             HNB2=,                     *O/P .CAT620.FILES      GDG *         
//             GDG='GDG,',                                            *         
//             GENP1='(+1)',              *O/P                        *         
//             OUTFILE=,                                                        
//             UNIT='BATCH',                                                    
//             PRTCL1='*',                                                      
//             PRTCL2='Y',                                                      
//             SPACE1='(CYL,(5,10),RLSE)'  *O/P .CAT620.PAPERFEE GDG *          
//*                                                                             
//*********************************************************************         
//* SORT ZIFP FEE FILE INTO CLIENT/BRAC/FEE KEY SEQUENCE.             *         
//*********************************************************************         
//SORT10  EXEC PGM=SORT,                                                00522000
//             REGION=4M,                                               00523000
//             PARM='SIZE=4M,MSG=AP'                                    00524000
//SORTIN    DD DSN=&HNB..IFP27A.OUTFEAC(0),                             00524100
//             DISP=SHR                                                 00526000
//SORTOUT   DD DSN=&HNB2..CAT6201.PAPER.STMNT.FEE&GENP1,                00527100
//             DISP=(NEW,CATLG,DELETE),                                 00528000
//             UNIT=&UNIT,                                              00529000
//             SPACE=&SPACE1,                                           00529100
//             DCB=(&GDG.BUFNO=5)                                       00529200
//SORTLIST  DD SYSOUT=&PRTCL1                                           00529300
//*                                                                             
//* SORT FIELDS=(1,21,CH,A)                                             00020001
//* SUM FIELDS=NONE                                                             
//SYSIN     DD DSN=&CARDLIB(CAT620S1),                                  00529400
//             DISP=SHR                                                 00529500
//SYSOUT    DD SYSOUT=&PRTCL1                                                   
//SYSUDUMP  DD SYSOUT=&PRTCL2                                                   
//*                                                                     00529800
//*********************************************************************         
//* REPRO FILE INTO VSAM                                                        
//*********************************************************************         
//*                                                                             
//IDCAMS   EXEC PGM=IDCAMS                                                      
//SYSPRINT  DD SYSOUT=&PRTCL1                                           00529300
//DD1       DD DSN=&HNB2..CAT6201.PAPER.STMNT.FEE&GENP1,                00527100
//             DISP=SHR                                                 00529500
//DD2       DD DSN=&OUTFILE,                                                    
//             DISP=SHR                                                 00529500
//SYSIN     DD DSN=&CARDLIB(REPRO),DISP=SHR                             00529400
