//CAT8250U JOB (BU1P,DY00),'ACATS ASCENDIS      ',CLASS=3,MSGCLASS=W,           
//         USER=BU1P,SECLABEL=BISG                                              
//*NODAFF BALANCE3                                                              
//*JOBAFF BALANCE3                                                              
//CA11    EXEC CA11                                                             
//*********************************************************************         
//*CAT525: CREATE EXCEPTION FILE FOR ASCENDIS(WORKFLOW)  DUMMY INPUT  *         
//*CAT525: MUST RUN BEFORE CAT500A                                    *         
//*********************************************************************         
//STEP20  EXEC CAT525,                                                          
//             STREAM='U',                * STREAM INDICATOR          *         
//             BYP1=1,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=1,                    * 1=BYPASS FILE CHECK       *         
//             CAT525='CAT825',           *FILE NAME CAT525/CAT825    *         
//             DUMMY='DUMMY,',            *I/P .CAT511.ACATTRNS       *         
//             HNB1='BUUU',               *I/P .CAT511.ACATTRNS   GDG *         
//             HNB2='BUUU',               *O/P .CAT525.EXCP       GDG *         
//             RUNDATE=                                                         
//*********************************************************************         
//*CAT500A/CAT501:EXTRACT REFRESHED ACATS TIF AND ASSETS FOR ASCENDIS           
//*********************************************************************         
//STEP10  EXEC CAT500A,                                                         
//             HNB=BUUU,                                                        
//             HNB1=SU.UUU,              *I/P NTWREGOP, NTWMAST,MFEXBR*         
//             HNB2=BUUU,                *O/P CAT500.ACATACTF.ASCENDIS*         
//             STRM1=U,                                                         
//             STRM2=UUU,                                                       
//             STRM3=CAT500A,                                                   
//             ASCENEOD=EOD,             ==> ASCEND EODRUN = EOD                
//             RUNDATE=                                                         
//*********************************************************************         
//*CAT825: EXTRACT/SPLIT ONE CLIENT FOR ASCENDIS FTP                            
//*********************************************************************         
//STEP30  EXEC CAT825,                                                          
//             CLIENT='0010',             *CLIENT NUMBER (4 BYTES)    *         
//             CLEARNO='0158',            *NSCC BROKER CLEARING NBR   *         
//             BYP1=1,                    *1=BYPASS DATE CHECK        *         
//             BYP2=1,                    *1=BYPASS FILE CHECK        *         
//             JOBNAME='CAT825  ',        *JOBNAME=CAT525   /CAT825   *         
//             DUMEXCP3=,                                                       
//             INWHLD='BUUU.CAT810.WHLD(+0)',                                   
//             INEXCP='BUUU.CAT825.EXCP(+1)',                                   
//             INEXCP3='BUUU.CAT810.EXCP(+0)',                                  
//             INMATH='BUUU.CAT821.MATH(+0)',                                   
//             INNSCC='BUUU.CAT500A.NSCCIN.ASCENDIS(+1)',                       
//             OTWHLD='BUUU.CAT825.WHLD.C010.ASCENDIS(+1)',                     
//             OTEXCP='BUUU.CAT825.EXCP.C010.ASCENDIS(+1)',                     
//             OTMATH='BUUU.CAT825.MATH.C010.ASCENDIS(+1)',                     
//             OTNSCC='BUUU.CAT825.NSCC.C010.ASCENDIS(+1)',                     
//             SPACE1='(CYL,(01,01),RLSE)', *O/P WHLD                 *         
//             SPACE2='(CYL,(01,01),RLSE)', *O/P EXCP                 *         
//             SPACE3='(CYL,(01,01),RLSE)', *O/P MATH                 *         
//             SPACE4='(CYL,(01,01),RLSE)', *O/P NSCC                 *         
//             RUNDATE=                                                         
