//CAT8250Y JOB (BY0P,DAC0),'ACATS ASCENDIS      ',CLASS=3,MSGCLASS=W,           
//         USER=BY0P,SECLABEL=BISG                                              
//*NODAFF BALANCE3                                                              
//*JOBAFF BALANCE3                                                              
//CA11    EXEC CA11                                                             
//*********************************************************************         
//*CAT525: CREATE EXCEPTION FILE FOR ASCENDIS(WORKFLOW)  DUMMY INPUT  *         
//*CAT525: MUST RUN BEFORE CAT500A                                    *         
//*********************************************************************         
//STEP20  EXEC CAT525,                                                          
//             STREAM='S',                * STREAM INDICATOR          *         
//             BYP1=1,                    * 1=BYPASS DATE CHECK       *         
//             BYP2=1,                    * 1=BYPASS FILE CHECK       *         
//             CAT525='CAT825',           *FILE NAME CAT525/CAT825    *         
//             DUMMY='DUMMY,',            *I/P .CAT511.ACATTRNS       *         
//             HNB1='BSSS',               *I/P .CAT511.ACATTRNS   GDG *         
//             HNB2='BYYY',               *O/P .CAT525.EXCP       GDG *         
//             RUNDATE=                                                         
//*********************************************************************         
//*CAT500A/CAT501:EXTRACT REFRESHED ACATS TIF AND ASSETS FOR ASCENDIS           
//*********************************************************************         
//STEP10  EXEC CAT500A,                                                         
//             HNB=BYYY,                                                        
//             HNB1=S3.YYY,              *I/P NTWREGOP, NTWMAST,MFEXBR*         
//             HNB2=BYYY,                *O/P CAT500.ACATACTF.ASCENDIS*         
//             STRM1=S,                                                         
//             STRM2=YYY,                                                       
//             STRM3=CAT500A,                                                   
//             ASCENEOD=EOD,             ==> ASCEND EODRUN = EOD                
//             RUNDATE=                                                         
//*********************************************************************         
//*CAT825: EXTRACT/SPLIT ONE CLIENT FOR ASCENDIS FTP                            
//*********************************************************************         
//STEP30  EXEC CAT825,                                                          
//             CLIENT='0313',             *CLIENT NUMBER (4 BYTES)    *         
//             CLEARNO='0701',            *NSCC BROKER CLEARING NBR   *         
//             BYP1=1,                    *1=BYPASS DATE CHECK        *         
//             BYP2=1,                    *1=BYPASS FILE CHECK        *         
//             JOBNAME='CAT825  ',        *JOBNAME=CAT525   /CAT825   *         
//             DUMEXCP3=,                                                       
//             INWHLD='BSSS.CAT810.WHLD(+0)',                                   
//             INEXCP='BYYY.CAT825.EXCP(+1)',                                   
//             INEXCP3='BSSS.CAT810.EXCP(+0)',                                  
//             INMATH='BYYY.CAT821.MATH(+0)',                                   
//             INNSCC='BYYY.CAT500A.NSCCIN.ASCENDIS(+1)',                       
//             OTWHLD='BYYY.CAT825.WHLD.C313.ASCENDIS(+1)',                     
//             OTEXCP='BYYY.CAT825.EXCP.C313.ASCENDIS(+1)',                     
//             OTMATH='BYYY.CAT825.MATH.C313.ASCENDIS(+1)',                     
//             OTNSCC='BYYY.CAT825.NSCC.C313.ASCENDIS(+1)',                     
//             SPACE1='(CYL,(01,01),RLSE)', *O/P WHLD                 *         
//             SPACE2='(CYL,(01,01),RLSE)', *O/P EXCP                 *         
//             SPACE3='(CYL,(01,01),RLSE)', *O/P MATH                 *         
//             SPACE4='(CYL,(01,01),RLSE)', *O/P NSCC                 *         
//             RUNDATE=                                                         
