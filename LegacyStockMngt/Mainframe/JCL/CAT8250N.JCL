//CAT8250N JOB (BN1P,DAC0),'ACATS ASCENDIS      ',CLASS=3,MSGCLASS=W,           
//         USER=BN1P,SECLABEL=BISG                                              
//*NODAFF BALANCE3                                                              
//*JOBAFF BALANCE3                                                              
//CA11    EXEC CA11                                                             
//*********************************************************************         
//*CAT525: CREATE EXCEPTION FILE FOR ASCENDIS(WORKFLOW)  DUMMY INPUT  *         
//*CAT525: MUST RUN BEFORE CAT500A                                    *         
//*********************************************************************         
//STEP20  EXEC CAT525,                                                          
//             STREAM='N',                * STREAM INDICATOR          *         
//             BYP1=1,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=1,                    * 1=BYPASS FILE CHECK       *         
//             CAT525='CAT825',           *FILE NAME CAT525/CAT825    *         
//             DUMMY='DUMMY,',            *I/P .CAT511.ACATTRNS       *         
//             HNB1='BNNN',               *I/P .CAT511.ACATTRNS   GDG *         
//             HNB2='BNNN',               *O/P .CAT525.EXCP       GDG *         
//             RUNDATE=                                                         
//*********************************************************************         
//*CAT500A/CAT501:EXTRACT REFRESHED ACATS TIF AND ASSETS FOR ASCENDIS           
//*********************************************************************         
//STEP10  EXEC CAT500A,                                                         
//             HNB=BNNN,                                                        
//             HNB1=SN.NNN,              *I/P NTWREGOP, NTWMAST,MFEXBR*         
//             HNB2=BNNN,                *O/P CAT500.ACATACTF.ASCENDIS*         
//             STRM1=N,                                                         
//             STRM2=NNN,                                                       
//             STRM3=CAT500A,                                                   
//             ASCENEOD=EOD,             ==> ASCEND EODRUN = EOD                
//             RUNDATE=                                                         
//*********************************************************************         
//*CAT825: EXTRACT/SPLIT ONE CLIENT FOR ASCENDIS FTP                            
//*********************************************************************         
//STEP30  EXEC CAT825,                                                          
//             CLIENT='0080',             *CLIENT NUMBER (4 BYTES)    *         
//             CLEARNO='0220',            *NSCC BROKER CLEARING NBR   *         
//             BYP1=1,                    *1=BYPASS DATE CHECK        *         
//             BYP2=1,                    *1=BYPASS FILE CHECK        *         
//             JOBNAME='CAT825  ',        *JOBNAME=CAT525   /CAT825   *         
//             DUMEXCP3=,                                                       
//             INWHLD='BNNN.CAT810.WHLD(+0)',                                   
//             INEXCP='BNNN.CAT825.EXCP(+1)',                                   
//             INEXCP3='BNNN.CAT810.EXCP(+0)',                                  
//             INMATH='BNNN.CAT821.MATH(+0)',                                   
//             INNSCC='BNNN.CAT500A.NSCCIN.ASCENDIS(+1)',                       
//             OTWHLD='BNNN.CAT825.WHLD.C080.ASCENDIS(+1)',                     
//             OTEXCP='BNNN.CAT825.EXCP.C080.ASCENDIS(+1)',                     
//             OTMATH='BNNN.CAT825.MATH.C080.ASCENDIS(+1)',                     
//             OTNSCC='BNNN.CAT825.NSCC.C080.ASCENDIS(+1)',                     
//             SPACE1='(CYL,(01,01),RLSE)', *O/P WHLD                 *         
//             SPACE2='(CYL,(01,01),RLSE)', *O/P EXCP                 *         
//             SPACE3='(CYL,(01,01),RLSE)', *O/P MATH                 *         
//             SPACE4='(CYL,(01,01),RLSE)', *O/P NSCC                 *         
//             RUNDATE=                                                         
