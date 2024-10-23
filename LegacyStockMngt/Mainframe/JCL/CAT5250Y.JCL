//CAT5250Y JOB (BY0P,DAC0),'ACATS ASCENDIS      ',CLASS=1,MSGCLASS=W,           
//         USER=BY0P,PRTY=15,SECLABEL=BISG                                      
//*NODAFF BALANCE1                                                              
//*JOBAFF BALANCE1                                                              
//CA11    EXEC CA11                                                             
//*********************************************************************         
//* THIS JOB RUNS FIVE TIMES A DAY TRIGGERED BY CAT5110U              *         
//*********************************************************************         
//*********************************************************************         
//*CAT525: CREATE EXCEPTION FILE FOR ASCENDIS                                   
//*CAT525: MUST RUN BEFORE CAT500A                                              
//*********************************************************************         
//STEP20  EXEC CAT525,                                                          
//             STREAM='S',                * STREAM INDICATOR          *         
//             HNB1='BSSS',               *I/P .CAT511.ACATTRNS   GDG *         
//             HNB2='BYYY',               *O/P .CAT525.EXCP       GDG *         
//             RUNDATE='RERUN.EARLY.'                                           
//*********************************************************************         
//*CAT500A/CAT501:EXTRACT ACATS TIF AND ASSETS CYCLE FEED FOR ASCENDIS          
//*********************************************************************         
//STEP10  EXEC CAT500A,                                                         
//             HNB=BYYY,                                                        
//             HNB1=S3.YYY,              *I/P NTWREGOP, NTWMAST,MFEXBR*         
//             HNB2=BYYY,                *O/P CAT500.ACATACTF.ASCENDIS*         
//             STRM1=S,                                                         
//             STRM2=YYY                                                        
//*********************************************************************         
//*CAT825: EXTRACT/SPLIT ONE CLIENT FOR ASCENDIS FTP                            
//*********************************************************************         
//STEP30  EXEC CAT825,                                                          
//             CLIENT='0313',             *CLIENT NUMBER (4 BYTES)    *         
//             CLEARNO='0701',            *NSCC BROKER CLEARING NBR   *         
//             BYP1=0,                    *1=BYPASS DATE CHECK        *         
//             BYP2=0,                    *1=BYPASS FILE CHECK        *         
//             JOBNAME='CAT525  ',        *JOBNAME=CAT525   /CAT825   *         
//             DUMEXCP2=,                                                       
//             DUMEXCP3=,                                                       
//             INWHLD='BSSS.CAT519.WHLD(+0)',                                   
//             INEXCP='BYYY.CAT525.EXCP(+1)',                                   
//             INEXCP2='BSSS.CAT518.EXCP(+0)',                                  
//             INEXCP3='BSSS.CAT519.EXCP(+0)',                                  
//             INMATH='BSSS.CAT821.ID.MATH(+0)',                                
//             INNSCC='BYYY.CAT500A.NSCCIN.ASCENDIS(+1)',                       
//             OTWHLD='BYYY.CAT525.WHLD.C313.ASCENDIS(+1)',                     
//             OTEXCP='BYYY.CAT525.EXCP.C313.ASCENDIS(+1)',                     
//             OTMATH='BYYY.CAT525.MATH.C313.ASCENDIS(+1)',                     
//             OTNSCC='BYYY.CAT525.NSCC.C313.ASCENDIS(+1)',                     
//             RUNDATE='RERUN.EARLY.',                                          
//             SPACE1='(CYL,(01,01),RLSE)', *O/P WHLD                 *         
//             SPACE2='(CYL,(01,01),RLSE)', *O/P EXCP                 *         
//             SPACE3='(CYL,(01,01),RLSE)', *O/P MATH                 *         
//             SPACE4='(CYL,(01,01),RLSE)'  *O/P NSCC                 *         
//*                                                                             
//*********************************************************************         
//*EVENT TRIGGER: TRIGGER THE FTP JOBS BASED ON CYCLE NBR(COND CODE)            
//*********************************************************************         
//*  TRIGGER CYCLE 1 JOBS                                                       
//STEP41   EXEC PGM=EQQEVPGM,COND=(1,NE,STEP30.CAT825)                          
//EQQMLIB   DD  DISP=SHR,DSN=SYS1.SEQQMSG0                                      
//EQQMLOG   DD  SYSOUT=*                                                        
//SYSIN     DD  *                                                               
SRSTAT 'CAT5250Y.CAT5EAXY' SUBSYS(OPCT) AVAIL(YES)                              
//*                                                                             
//*  TRIGGER CYCLE 2 JOBS                                                       
//STEP42   EXEC PGM=EQQEVPGM,COND=(2,NE,STEP30.CAT825)                          
//EQQMLIB   DD  DISP=SHR,DSN=SYS1.SEQQMSG0                                      
//EQQMLOG   DD  SYSOUT=*                                                        
//SYSIN     DD  *                                                               
SRSTAT 'CAT5250Y.CAT5EBXY' SUBSYS(OPCT) AVAIL(YES)                              
//*                                                                             
//*  TRIGGER CYCLE 3 JOBS                                                       
//STEP43   EXEC PGM=EQQEVPGM,COND=(3,NE,STEP30.CAT825)                          
//EQQMLIB   DD  DISP=SHR,DSN=SYS1.SEQQMSG0                                      
//EQQMLOG   DD  SYSOUT=*                                                        
//SYSIN     DD  *                                                               
SRSTAT 'CAT5250Y.CAT5ECXY' SUBSYS(OPCT) AVAIL(YES)                              
//*                                                                             
//*  TRIGGER CYCLE 4 JOBS                                                       
//STEP44   EXEC PGM=EQQEVPGM,COND=(4,NE,STEP30.CAT825)                          
//EQQMLIB   DD  DISP=SHR,DSN=SYS1.SEQQMSG0                                      
//EQQMLOG   DD  SYSOUT=*                                                        
//SYSIN     DD  *                                                               
SRSTAT 'CAT5250Y.CAT5EDXY' SUBSYS(OPCT) AVAIL(YES)                              
//*                                                                             
//*  TRIGGER CYCLE 5 JOBS                                                       
//STEP45   EXEC PGM=EQQEVPGM,COND=(5,NE,STEP30.CAT825)                          
//EQQMLIB   DD  DISP=SHR,DSN=SYS1.SEQQMSG0                                      
//EQQMLOG   DD  SYSOUT=*                                                        
//SYSIN     DD  *                                                               
SRSTAT 'CAT5250Y.CAT5EEXY' SUBSYS(OPCT) AVAIL(YES)                              
//*                                                                             
