000001* PDX    - CAT500D  C0157686 04/20/01 14:00:53 TBLAMUR            00001000
000001* PDX    - CAT500D  C0121373 02/04/99 19:49:48 TBTARYB            00001000
000001* PDX    - CAT500D  C0121307 02/04/99 10:34:48 TBTARYB            00001000
000001* PDX    - CAT500D  C0121098 02/03/99 17:03:32 TBTARYB            00001000
000001* PDX    - CAT500D  C0120194 01/11/99 13:13:01 TBTARYB            00001000
       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.    CAT500D.                                                  
                                                                                
       DATE-WRITTEN.  DEC 98.                                                   
      ******************************************************************        
      *                       REMARKS                                  *        
      ******************************************************************        
      * THIS PROGRAM CREATES FUND REGISTRATION REPORT FOR THE ORIGINAL *        
      * DELIVERER. IT USES 'AT' RECORDS FROM THE FILE CREATED BY CAT500*        
      ******************************************************************        
                                                                                
           EJECT                                                                
      ******************************************************************        
       ENVIRONMENT DIVISION.                                                    
      ******************************************************************        
                                                                                
       INPUT-OUTPUT SECTION.                                                    
                                                                                
       FILE-CONTROL.                                                            
                                                                                
           SELECT AT-INPUT          ASSIGN  TO  FRINPUT.                        
           SELECT FR-REPORT         ASSIGN  TO  FREPORT.                        
           SELECT SORT-FILE         ASSIGN  TO  SORTWK01.                       
                                                                                
      ******************************************************************        
       DATA DIVISION.                                                           
      ******************************************************************        
                                                                                
       FILE SECTION.                                                            
                                                                                
       FD  AT-INPUT                                                             
           RECORDING MODE IS V                                                  
           BLOCK CONTAINS 0 RECORDS.                                            
                                                                                
       01  AT-INPUT-REC                      PIC  X(2991).                      
                                                                                
       FD  FR-REPORT                                                            
           RECORDING MODE IS F                                                  
           BLOCK CONTAINS 0 RECORDS                                             
           LABEL RECORDS ARE STANDARD                                           
           RECORD CONTAINS 143 CHARACTERS.                                      
                                                                                
       01  FR-REPORT-REC                    PIC  X(143).                        
                                                                                
       SD  SORT-FILE.                                                           
                                                                                
       01  SORT-RECORD.                                                         
           05  SORT-KEY.                                                        
               10  SORT-CLIENT-NBR          PIC  9(03).                         
               10  SORT-RCV-NBR             PIC  X(04).                         
               10  SORT-ACATS-CNTL-NBR      PIC  X(14).                         
           05  SORT-BODY                    PIC  X(80).                         
                                                                                
           EJECT                                                                
      ******************************************************************        
       WORKING-STORAGE SECTION.                                                 
      ******************************************************************        
                                                                                
       77  EOF-AT-INPUT-SW                  PIC  X(01)  VALUE 'N'.              
           88  EOF-AT-INPUT                             VALUE 'Y'.              
       77  EOF-SORT-FILE-SW                 PIC  X(01)  VALUE 'N'.              
           88  EOF-SORT-FILE                            VALUE 'Y'.              
       77  ABEND-CODE               COMP    PIC S9(04)  VALUE +9999.            
       77  B1-SUB                           PIC  9(03)  VALUE ZEROES.           
       77  S1                               PIC  9(03)  VALUE ZEROES.           
       77  WS-PAGE-CNTR                     PIC  9(04)  VALUE ZEROES.           
       77  WS-LINE-CNTR                     PIC  9(02)  VALUE ZEROES.           
       77  WS-CLEARING-NBR                  PIC  X(04)  VALUE SPACES.           
       77  WS-PRTCP-NM                      PIC  X(60)  VALUE SPACES.           
       77  HOLD-DLVR-NBR                    PIC  X(04) VALUE LOW-VALUES.        
       77  HOLD-RCV-NBR                     PIC  X(04)  VALUE SPACES.           
       77  CLIENT-FOUND-SW                  PIC  X(01).                         
           88  CLIENT-FOUND                             VALUE 'Y'.              
           88  CLIENT-NOT-FOUND                         VALUE 'N'.              
           COPY STUBCPY.                                                        
       01  CLIENT-TABLE-CNTR                PIC  9(03)  VALUE ZEROES.           
       01  CLIENT-TABLE-AREA.                                                   
           05  CLIENT-TABLE OCCURS 500 TIMES.                                   
               10  CLIENT-NUM               PIC  9(03)  VALUE ZEROES.           
               10  CLIENT-NAME              PIC  X(30)  VALUE SPACES.           
               10  CLIENT-CLEARING-NBR      PIC  X(04)  VALUE SPACES.           
                                                                                
       01  FILLER                           PIC  X(12)  VALUE                   
           'DATES AREA'.                                                        
                                                                                
       01  FILLER.                                                              
                                                                                
           05  WS-DATE-TIME                 PIC  X(26).                         
           05  FILLER REDEFINES                                                 
               WS-DATE-TIME.                                                    
               10  WS-PROC-CC               PIC  X(02).                         
               10  WS-PROC-YY               PIC  X(02).                         
               10  FILLER                   PIC  X(01).                         
               10  WS-PROC-MM               PIC  X(02).                         
               10  FILLER                   PIC  X(01).                         
               10  WS-PROC-DD               PIC  X(02).                         
               10  FILLER                   PIC  X(01).                         
               10  WS-TIME-HH               PIC  X(02).                         
               10  FILLER                   PIC  X(01).                         
               10  WS-TIME-MM               PIC  X(02).                         
               10  FILLER                   PIC  X(01).                         
               10  WS-TIME-SS               PIC  X(02).                         
               10  FILLER                   PIC  X(01).                         
               10  FILLER                   PIC  X(06).                         
                                                                                
           05  WS-SUBMIT-DATE.                                                  
               10  WS-SUBMIT-MM             PIC  X(02)  VALUE SPACES.           
               10  WS-SUBMIT-DD             PIC  X(02)  VALUE SPACES.           
               10  WS-SUBMIT-CC             PIC  X(02)  VALUE SPACES.           
               10  WS-SUBMIT-YY             PIC  X(02)  VALUE SPACES.           
                                                                                
       01  WS-DATE.                                                             
           05  WS-DATE-MM                   PIC  X(02)  VALUE SPACES.           
           05  FILLER                       PIC  X(01)  VALUE '/'.              
           05  WS-DATE-DD                   PIC  X(02)  VALUE SPACES.           
           05  FILLER                       PIC  X(01)  VALUE '/'.              
           05  WS-DATE-YY                   PIC  X(02)  VALUE SPACES.           
                                                                                
       01  WS-CYCLE-NBR-AREA.                                                   
           05  FILLER                       PIC  X(01)  VALUE SPACES.           
           05  WS-CYCLE-NBR                 PIC  X(02)  VALUE SPACES.           
                                                                                
       01  SD-RECORD.                                                           
           05  SD-KEY.                                                          
               10  SD-CLIENT-NBR            PIC  9(03).                         
               10  SD-RCV-NBR               PIC  X(04).                         
               10  SD-ACATS-CNTL-NBR        PIC  X(14).                         
           05  SD-BODY.                                                         
               10  SD-DLVR-NBR              PIC  X(04).                         
               10  SD-DLVR-NAME             PIC  X(30).                         
               10  SD-ISIN-SECU-ISSU-ID     PIC  X(09).                         
               10  SD-ASSET-SEQ-NBR         PIC  X(06).                         
               10  SD-TRANS-TYPE            PIC  X(01).                         
               10  SD-MF-CUST-ACCT          PIC  X(20).                         
               10  SD-MF-SHR-IND            PIC  X(01).                         
               10  SD-MF-NTWK-CNTL-IND      PIC  X(01).                         
               10  SD-MF-ACCT-TYPE-IND      PIC  X(01).                         
               10  SD-DIVDND-CODE           PIC  X(01).                         
               10  SD-DIVDND-PAYEE-IND      PIC  X(01).                         
               10  SD-EXC-BROKR             PIC  X(04).                         
               10  SD-MF-FULPART-IND        PIC  X(01).                         
                                                                                
       01  TRAC-RECORD.                                                         
           05  TRAC-DETAIL                  PIC  X(133).                        
           05  TRAC-CONTROL.                                                    
               10  TRAC-CLIENT      COMP-3  PIC  9(03)  VALUE ZEROES.           
               10  TRAC-CYCLE               PIC  X(02)  VALUE SPACES.           
               10  FILLER                   PIC  X(08)  VALUE SPACES.           
                                                                                
       01  HDR1-RECORD.                                                         
           05  HDR1-CC                      PIC  X(01)  VALUE '1'.              
           05  FILLER                       PIC  X(06)  VALUE                   
               'DATE: '.                                                        
           05  HDR1-PROC-DATE               PIC  X(08)  VALUE SPACES.           
           05  FILLER                       PIC  X(30)  VALUE SPACES.           
           05  FILLER                       PIC  X(42)  VALUE                   
               'AUTOMATED CUSTOMER ACCOUNT TRANSFER SYSTEM'.                    
           05  FILLER                       PIC  X(34)  VALUE SPACES.           
           05  FILLER                       PIC  X(07)  VALUE                   
               'PAGE:  '.                                                       
           05  HDR1-PAGE-NBR                PIC  ZZZ9.                          
           05  FILLER                       PIC  X(01)  VALUE SPACES.           
                                                                                
                                                                                
       01  HDR2-RECORD.                                                         
           05  HDR2-CC                      PIC  X(01)  VALUE ' '.              
           05  FILLER                       PIC  X(06)  VALUE                   
               'TIME: '.                                                        
           05  HDR2-HH                      PIC  X(02)  VALUE SPACES.           
           05  FILLER                       PIC  X(01)  VALUE ':'.              
           05  HDR2-MM                      PIC  X(02)  VALUE SPACES.           
           05  FILLER                       PIC  X(01)  VALUE ':'.              
           05  HDR2-SS                      PIC  X(02)  VALUE SPACES.           
           05  FILLER                       PIC  X(27)  VALUE SPACES.           
           05  FILLER                       PIC  X(39)  VALUE                   
               'MUTUAL FUNDS DETAIL REPORT AS ORIGINAL '.                       
           05  FILLER                       PIC  X(17)  VALUE                   
               'ACCOUNT DELIVERER'.                                             
           05  FILLER                       PIC  X(37)  VALUE SPACES.           
                                                                                
       01  HDR3-RECORD.                                                         
           05  HDR3-CC                      PIC  X(01)  VALUE ' '.              
           05  FILLER                       PIC  X(54)  VALUE SPACES.           
           05  FILLER                       PIC  X(07)  VALUE                   
               'CYCLE  '.                                                       
           05  HDR3-CYCLE-NBR               PIC  X(02)  VALUE SPACES.           
           05  FILLER                       PIC  X(06)  VALUE                   
               ' FOR: '.                                                        
           05  HDR3-SUBMIT-MM               PIC  X(02)  VALUE SPACES.           
           05  FILLER                       PIC  X(01)  VALUE '/'.              
           05  HDR3-SUBMIT-DD               PIC  X(02)  VALUE SPACES.           
           05  FILLER                       PIC  X(01)  VALUE '/'.              
           05  HDR3-SUBMIT-CC               PIC  X(02)  VALUE SPACES.           
           05  HDR3-SUBMIT-YY               PIC  X(02)  VALUE SPACES.           
           05  FILLER                       PIC  X(53)  VALUE SPACES.           
                                                                                
       01  DTL1-RECORD.                                                         
           05  DTL1-CC                      PIC  X(01)  VALUE '0'.              
           05  FILLER                       PIC  X(17)  VALUE                   
               'DEL PARTICIPANT:'.                                              
           05  DTL1-DLVR-NBR                PIC  X(04)  VALUE ' '.              
           05  FILLER                       PIC  X(02)  VALUE SPACES.           
           05  DTL1-DLVR-NAME               PIC  X(35)  VALUE ' '.              
           05  FILLER                       PIC  X(15)  VALUE SPACES.           
           05  FILLER                       PIC  X(19)  VALUE SPACES.           
      *        'DEL CUST ACCT NUM: '.                                           
           05  DTL1-DLVR-ACCT-NBR           PIC  X(20)  VALUE SPACES.           
           05  FILLER                       PIC  X(20)  VALUE SPACES.           
                                                                                
       01  DTL2-RECORD.                                                         
           05  DTL2-CC                      PIC  X(01)  VALUE ' '.              
           05  FILLER                       PIC  X(17)  VALUE                   
               'REC PARTICIPANT:'.                                              
           05  DTL2-RCV-NBR                 PIC  X(04)  VALUE SPACES.           
           05  FILLER                       PIC  X(02)  VALUE SPACES.           
           05  DTL2-RCV-NAME                PIC  X(35)  VALUE SPACES.           
           05  FILLER                       PIC  X(15)  VALUE SPACES.           
           05  FILLER                       PIC  X(19)  VALUE SPACES.           
      *        'REC CUST ACCT NUM: '.                                           
           05  DTL2-RCV-ACCT-NBR            PIC  X(20)  VALUE SPACES.           
           05  FILLER                       PIC  X(17)  VALUE SPACES.           
      *        ' CUST ACCT TYPE: '.                                             
           05  DTL2-RCV-ACCT-TYPE           PIC  X(02)  VALUE SPACES.           
           05  FILLER                       PIC  X(01)  VALUE SPACES.           
                                                                                
       01  HDR4-RECORD.                                                         
           05  HDR4-CC                      PIC  X(01)  VALUE '0'.              
           05  FILLER                       PIC  X(10)  VALUE                   
               'ASSET ID  '.                                                    
           05  FILLER                       PIC  X(07)  VALUE                   
               'SEQ #  '.                                                       
           05  FILLER                       PIC  X(14)  VALUE                   
               'CONTROL NBR   '.                                                
           05  FILLER                       PIC  X(07)  VALUE                   
               'TRANS  '.                                                       
           05  FILLER                       PIC  X(20)  VALUE                   
               'FUND CUST ACCT      '.                                          
           05  FILLER                       PIC  X(09)  VALUE                   
               'BK/PHYS  '.                                                     
           05  FILLER                       PIC  X(12)  VALUE                   
               'NTWRK CNTL  '.                                                  
           05  FILLER                       PIC  X(11)  VALUE                   
               'ACCT TYPE  '.                                                   
           05  FILLER                       PIC  X(10)  VALUE                   
               'DIVD CDE  '.                                                    
           05  FILLER                       PIC  X(12)  VALUE                   
               'DIVD PAYEE  '.                                                  
           05  FILLER                       PIC  X(11)  VALUE                   
               'EXEC PART  '.                                                   
           05  FILLER                       PIC  X(09)  VALUE                   
               'FUL/PRTL '.                                                     
                                                                                
       01  DTL3-RECORD.                                                         
           05  DTL3-CC                      PIC  X(01)  VALUE ' '.              
                                                                                
           05  DTL3-ISIN-SECU-ISSU-ID       PIC  X(09).                         
           05  FILLER                       PIC  X(01)  VALUE ' '.              
                                                                                
           05  DTL3-ASSET-SEQ-NBR           PIC  X(06).                         
           05  FILLER                       PIC  X(01)  VALUE ' '.              
                                                                                
           05  DTL3-ACATS-CNTL-NBR          PIC  X(14).                         
                                                                                
           05  FILLER                       PIC  X(02)  VALUE ' '.              
           05  DTL3-TRANS-TYPE              PIC  X(01).                         
           05  FILLER                       PIC  X(04)  VALUE ' '.              
                                                                                
           05  DTL3-MF-CUST-ACCT            PIC  X(20).                         
                                                                                
           05  FILLER                       PIC  X(02)  VALUE ' '.              
           05  DTL3-MF-SHR-IND              PIC  X(01).                         
           05  FILLER                       PIC  X(06)  VALUE ' '.              
                                                                                
           05  FILLER                       PIC  X(04)  VALUE ' '.              
           05  DTL3-MF-NTWK-CNTL-IND        PIC  X(01).                         
           05  FILLER                       PIC  X(07)  VALUE ' '.              
                                                                                
           05  FILLER                       PIC  X(04)  VALUE ' '.              
           05  DTL3-MF-ACCT-TYPE-IND        PIC  X(01).                         
           05  FILLER                       PIC  X(06)  VALUE ' '.              
                                                                                
           05  FILLER                       PIC  X(04)  VALUE ' '.              
           05  DTL3-MF-DIVDND-CODE          PIC  X(01).                         
           05  FILLER                       PIC  X(05)  VALUE ' '.              
                                                                                
           05  FILLER                       PIC  X(04)  VALUE ' '.              
           05  DTL3-MF-DIVDND-PAYEE-IND     PIC  X(01).                         
           05  FILLER                       PIC  X(07)  VALUE ' '.              
                                                                                
           05  FILLER                       PIC  X(02)  VALUE ' '.              
           05  DTL3-EXC-BROKR               PIC  X(04).                         
           05  FILLER                       PIC  X(05)  VALUE ' '.              
                                                                                
           05  FILLER                       PIC  X(03)  VALUE ' '.              
           05  DTL3-MF-FULPART-IND          PIC  X(01).                         
           05  FILLER                       PIC  X(05)  VALUE ' '.              
                                                                                
       01  DSNTIAR                          PIC  X(08)  VALUE 'DSNTIAR'.        
       01  WS-DB2-MESSAGE-AREA.                                                 
           05  WS-DB2-MSG-LEN       COMP    PIC S9(04)  VALUE +960.             
           05  WS-ERROR-MSG                 PIC  X(80)  OCCURS 12 TIMES         
               INDEXED BY WS-ERROR-INDEX.                                       
       01  WS-ERR-LINE-LEN            COMP  PIC S9(09)  VALUE +80.              
                                                                                
           EJECT                                                                
           COPY BHINFO.                                                         
                                                                                
           EJECT                                                                
           COPY NSCCDHDR.                                                       
                                                                                
           EJECT                                                                
           COPY NSCCDAT.                                                        
                                                                                
           EJECT                                                                
           COPY GETNACOB.                                                       
       01  GETNA-SEGMENTS.                                                      
           COPY NASEGHDR.                                                       
           COPY NASEGPPA.                                                       
           COPY NASEGPPB.                                                       
           COPY NASEGEND.                                                       
                                                                                
           EJECT                                                                
           EXEC SQL                                                             
              INCLUDE VTRNFR                                                    
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
           EXEC SQL                                                             
              INCLUDE VPRTCPPF                                                  
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
           EXEC SQL                                                             
              INCLUDE SQLCA                                                     
           END-EXEC.                                                            
                                                                                
           EJECT                                                                
      ******************************************************************        
       LINKAGE SECTION.                                                         
      ******************************************************************        
                                                                                
       01  PARM-AREA.                                                           
           05  PARM-LENGTH          COMP    PIC S9(04).                         
           05  LS-STREAM-IND                PIC  X(01).                         
                                                                                
           EJECT                                                                
      ******************************************************************        
       PROCEDURE DIVISION USING PARM-AREA.                                      
      ******************************************************************        
                                                                                
           COPY MSGCOBO.                                                        
                                                                                
           PERFORM INITIAL-ROUTINE.                                             
                                                                                
           SORT SORT-FILE                                                       
              ASCENDING KEY     SORT-KEY                                        
              INPUT  PROCEDURE  SORT-INPUT-ROUTINE                              
              OUTPUT PROCEDURE  SORT-OUTPUT-ROUTINE.                            
                                                                                
           PERFORM EOJ-ROUTINE.                                                 
                                                                                
           GOBACK.                                                              
                                                                                
           EJECT                                                                
      ********************                                                      
       SORT-INPUT-ROUTINE.                                                      
      ********************                                                      
                                                                                
           PERFORM UNTIL EOF-AT-INPUT                                           
              IF NSCCAT-REQ-SET-LOCATION = '10'                                 
                 IF NSCCAT-ORG-DEL-NBR NOT = HOLD-DLVR-NBR                      
                    MOVE NSCCAT-ORG-DEL-NBR      TO  WS-CLEARING-NBR            
                                                     SD-DLVR-NBR                
                                                     HOLD-DLVR-NBR              
                    PERFORM SEARCH-CLIENT-TABLE                                 
                    IF CLIENT-FOUND                                             
                       MOVE CLIENT-NUM (S1 - 1)  TO  SD-CLIENT-NBR              
                       MOVE CLIENT-NAME (S1 - 1) TO  SD-DLVR-NAME               
                    END-IF                                                      
                 END-IF                                                         
                 IF CLIENT-FOUND                                                
                    MOVE NSCCAT-ORG-RCV-NBR       TO  SD-RCV-NBR                
                   MOVE NSCCAT-ISIN-SECU-ISSU-ID TO SD-ISIN-SECU-ISSU-ID        
                    MOVE NSCCAT-ASSET-SEQ-NBR     TO  SD-ASSET-SEQ-NBR          
                    MOVE NSCCAT-ACATS-CNTL-NBR    TO  SD-ACATS-CNTL-NBR         
                    MOVE NSCCAT-TRANS-TYPE        TO  SD-TRANS-TYPE             
                    MOVE NSCCAT-MF-CUST-ACCT      TO  SD-MF-CUST-ACCT           
                    MOVE NSCCAT-MF-SHR-IND        TO  SD-MF-SHR-IND             
                    MOVE NSCCAT-MF-NTWK-CNTL-IND  TO SD-MF-NTWK-CNTL-IND        
                    MOVE NSCCAT-MF-ACCT-TYPE-IND  TO SD-MF-ACCT-TYPE-IND        
                    MOVE NSCCAT-DIVDND-CODE       TO  SD-DIVDND-CODE            
                    MOVE NSCCAT-DIVDND-PAYEE-IND  TO SD-DIVDND-PAYEE-IND        
                    MOVE NSCCAT-EXC-BROKR         TO  SD-EXC-BROKR              
                    MOVE NSCCAT-MF-FULPART-IND    TO  SD-MF-FULPART-IND         
                    RELEASE SORT-RECORD         FROM  SD-RECORD                 
                 END-IF                                                         
              END-IF                                                            
              READ AT-INPUT                 INTO  NSCCAT-AREA                   
                 AT END SET EOF-AT-INPUT      TO  TRUE                          
              END-READ                                                          
           END-PERFORM.                                                         
                                                                                
           EJECT                                                                
      *********************                                                     
       SORT-OUTPUT-ROUTINE.                                                     
      *********************                                                     
                                                                                
           MOVE LOW-VALUES                  TO  HOLD-DLVR-NBR.                  
                                                                                
           RETURN SORT-FILE               INTO  SD-RECORD                       
              AT END SET EOF-SORT-FILE      TO  TRUE                            
           END-RETURN.                                                          
                                                                                
           PERFORM UNTIL EOF-SORT-FILE                                          
              IF SD-DLVR-NBR NOT = HOLD-DLVR-NBR                                
                 MOVE SD-CLIENT-NBR          TO  TRAC-CLIENT                    
                 MOVE SD-DLVR-NBR            TO  DTL1-DLVR-NBR                  
                 MOVE SD-DLVR-NAME           TO  DTL1-DLVR-NAME                 
                 MOVE SD-RCV-NBR             TO  WS-CLEARING-NBR                
                                                 DTL2-RCV-NBR                   
      *          PERFORM SEARCH-CLIENT-TABLE                                    
      *          IF CLIENT-FOUND                                                
      *             MOVE CLIENT-NAME (S1 - 1) TO DTL2-RCV-NAME                  
      *          ELSE                                                           
      *             MOVE SPACES              TO  DTL2-RCV-NAME                  
      *          END-IF                                                         
                 PERFORM GET-RECEIVER-NAME                                      
                 MOVE SD-DLVR-NBR            TO  HOLD-DLVR-NBR                  
                 MOVE SD-RCV-NBR             TO  HOLD-RCV-NBR                   
                 MOVE 0                      TO  WS-PAGE-CNTR                   
                 PERFORM WRITE-HEADER-ROUTINE                                   
              ELSE                                                              
                 IF SD-RCV-NBR NOT = HOLD-RCV-NBR                               
                    MOVE SD-RCV-NBR         TO  WS-CLEARING-NBR                 
                                                DTL2-RCV-NBR                    
                    PERFORM SEARCH-CLIENT-TABLE                                 
                    IF CLIENT-FOUND                                             
                       MOVE CLIENT-NAME (S1) TO  DTL2-RCV-NAME                  
                    ELSE                                                        
                       MOVE SPACES          TO  DTL2-RCV-NAME                   
                    END-IF                                                      
                    MOVE SD-RCV-NBR         TO  HOLD-RCV-NBR                    
                    PERFORM WRITE-HEADER-ROUTINE                                
                 END-IF                                                         
              END-IF                                                            
              IF WS-LINE-CNTR > 52                                              
                 PERFORM WRITE-HEADER-ROUTINE                                   
              END-IF                                                            
              PERFORM WRITE-DETAILS-ROUTINE                                     
              RETURN SORT-FILE            INTO  SD-RECORD                       
                 AT END SET EOF-SORT-FILE   TO  TRUE                            
              END-RETURN                                                        
           END-PERFORM.                                                         
                                                                                
                                                                                
           EJECT                                                                
      **********************                                                    
       WRITE-HEADER-ROUTINE.                                                    
      **********************                                                    
                                                                                
           ADD 1                            TO  WS-PAGE-CNTR.                   
           MOVE WS-PAGE-CNTR                TO  HDR1-PAGE-NBR.                  
                                                                                
           MOVE HDR1-RECORD                 TO  TRAC-DETAIL.                    
           WRITE FR-REPORT-REC            FROM  TRAC-RECORD.                    
                                                                                
           MOVE HDR2-RECORD                 TO  TRAC-DETAIL.                    
           WRITE FR-REPORT-REC            FROM  TRAC-RECORD.                    
                                                                                
           MOVE HDR3-RECORD                 TO  TRAC-DETAIL.                    
           WRITE FR-REPORT-REC            FROM  TRAC-RECORD.                    
                                                                                
           MOVE DTL1-RECORD                 TO  TRAC-DETAIL.                    
           WRITE FR-REPORT-REC            FROM  TRAC-RECORD.                    
                                                                                
           MOVE DTL2-RECORD                 TO  TRAC-DETAIL.                    
           WRITE FR-REPORT-REC            FROM  TRAC-RECORD.                    
                                                                                
           MOVE HDR4-RECORD                 TO  TRAC-DETAIL.                    
           WRITE FR-REPORT-REC            FROM  TRAC-RECORD.                    
                                                                                
           MOVE 7                           TO  WS-LINE-CNTR.                   
                                                                                
           EJECT                                                                
      ***********************                                                   
       WRITE-DETAILS-ROUTINE.                                                   
      ***********************                                                   
                                                                                
           MOVE SD-ISIN-SECU-ISSU-ID        TO  DTL3-ISIN-SECU-ISSU-ID.         
           MOVE SD-ASSET-SEQ-NBR            TO  DTL3-ASSET-SEQ-NBR.             
           MOVE SD-ACATS-CNTL-NBR           TO  DTL3-ACATS-CNTL-NBR.            
           MOVE SD-TRANS-TYPE               TO  DTL3-TRANS-TYPE.                
           MOVE SD-MF-CUST-ACCT             TO  DTL3-MF-CUST-ACCT.              
           MOVE SD-MF-SHR-IND               TO  DTL3-MF-SHR-IND.                
           MOVE SD-MF-NTWK-CNTL-IND         TO  DTL3-MF-NTWK-CNTL-IND.          
           MOVE SD-MF-ACCT-TYPE-IND         TO  DTL3-MF-ACCT-TYPE-IND.          
           MOVE SD-DIVDND-CODE              TO  DTL3-MF-DIVDND-CODE.            
           MOVE SD-DIVDND-PAYEE-IND         TO DTL3-MF-DIVDND-PAYEE-IND.        
           MOVE SD-EXC-BROKR                TO  DTL3-EXC-BROKR.                 
           MOVE SD-MF-FULPART-IND           TO  DTL3-MF-FULPART-IND.            
                                                                                
           MOVE DTL3-RECORD                 TO  TRAC-DETAIL.                    
           WRITE FR-REPORT-REC            FROM  TRAC-RECORD.                    
                                                                                
           ADD 1                            TO  WS-LINE-CNTR.                   
                                                                                
           EJECT                                                                
      ********************                                                      
       SEARCH-CLIENT-TABLE.                                                     
      ********************                                                      
                                                                                
           SET CLIENT-NOT-FOUND             TO  TRUE.                           
                                                                                
           PERFORM VARYING S1 FROM 1 BY 1                                       
              UNTIL (S1 > CLIENT-TABLE-CNTR) OR CLIENT-FOUND                    
              IF WS-CLEARING-NBR = CLIENT-CLEARING-NBR (S1)                     
                 SET CLIENT-FOUND           TO  TRUE                            
              END-IF                                                            
           END-PERFORM.                                                         
                                                                                
           IF CLIENT-NOT-FOUND                                                  
              DISPLAY '*********************************************'           
              DISPLAY '* CLEARING NUMBER ' WS-CLEARING-NBR                      
                      ' IS NOT ON ADP FILES! *'                                 
              DISPLAY '*********************************************'           
           END-IF.                                                              
                                                                                
           EJECT                                                                
      *******************                                                       
       GET-RECEIVER-NAME.                                                       
      *******************                                                       
                                                                                
           EXEC SQL                                                             
              SELECT PRTCP_NM                                                   
              INTO  :WS-PRTCP-NM                                                
              FROM   VPRTCPPF                                                   
              WHERE  PRTCP_NBR = :SD-RCV-NBR                                    
           END-EXEC.                                                            
                                                                                
           IF SQLCODE = -911                                                    
              PERFORM VARYING S1 FROM 1 BY 1                                    
                 UNTIL S1 > 10 OR                                               
                 SQLCODE NOT = -911                                             
                 EXEC SQL                                                       
                    SELECT PRTCP_NM                                             
                    INTO  :WS-PRTCP-NM                                          
                    FROM   VPRTCPPF                                             
                    WHERE  PRTCP_NBR = :SD-RCV-NBR                              
                 END-EXEC                                                       
              END-PERFORM                                                       
           END-IF.                                                              
                                                                                
           IF SQLCODE = +0                                                      
              MOVE WS-PRTCP-NM              TO  DTL2-RCV-NAME                   
           ELSE                                                                 
              PERFORM SEARCH-CLIENT-TABLE                                       
              IF CLIENT-FOUND                                                   
                 MOVE CLIENT-NAME (S1)      TO  DTL2-RCV-NAME                   
              ELSE                                                              
                 MOVE SPACES                TO  DTL2-RCV-NAME                   
              END-IF                                                            
           END-IF.                                                              
                                                                                
           EJECT                                                                
      *******************                                                       
       DB2-ERROR-ROUTINE.                                                       
      *******************                                                       
                                                                                
           CALL DSNTIAR               USING  SQLCA                              
                                             WS-DB2-MESSAGE-AREA                
                                             WS-ERR-LINE-LEN.                   
                                                                                
           DISPLAY ' '                                                          
                                                                                
           PERFORM VARYING WS-ERROR-INDEX FROM 1 BY 1                           
              UNTIL WS-ERROR-INDEX GREATER THAN 12                              
                 IF WS-ERROR-MSG (WS-ERROR-INDEX) > SPACES                      
                    DISPLAY '*** ' WS-ERROR-MSG (WS-ERROR-INDEX)                
                 END-IF                                                         
           END-PERFORM.                                                         
                                                                                
           EJECT                                                                
      ********************                                                      
       BUILD-CLIENT-TABLE.                                                      
      ********************                                                      
                                                                                
           MOVE ZEROES                      TO  S1.                             
                                                                                
           PERFORM VARYING B1-SUB FROM 1 BY 1 UNTIL B1-SUB > 500                
              MOVE SPACES                   TO  BH-BROKER-HEADER-INFO           
              MOVE '010'                    TO  BH-LOGICAL-RECORD-CODE          
              MOVE B1-SUB                   TO  BH-BROKER-NUMBER                
              CALL  GETB1V               USING  BH-BROKER-HEADER-INFO           
                                                                                
              IF BH-BROKER-ACTIVE                                               
                 ADD 1                      TO  S1                              
                 MOVE BH-BROKER-NUMBER      TO  CLIENT-NUM (S1)                 
                 MOVE BH-BROKER-NAME        TO  CLIENT-NAME (S1)                
                 MOVE BH-BROKER-OLD-CLEARING-HOUSE (2:4)                        
                                            TO  CLIENT-CLEARING-NBR (S1)        
              END-IF                                                            
           END-PERFORM.                                                         
                                                                                
           MOVE S1                          TO  CLIENT-TABLE-CNTR.              
                                                                                
           EJECT                                                                
      *****************                                                         
       INITIAL-ROUTINE.                                                         
      *****************                                                         
                                                                                
           OPEN INPUT  AT-INPUT                                                 
                OUTPUT FR-REPORT.                                               
                                                                                
           READ AT-INPUT                  INTO  NSCC-HDR-RECORD                 
              AT END  SET EOF-AT-INPUT      TO  TRUE                            
           END-READ.                                                            
                                                                                
           IF EOF-AT-INPUT                                                      
              DISPLAY ' '                                                       
              DISPLAY '***************************************'                 
              DISPLAY '* NSCC INBOUND FILE HEADER IS MISSING *'                 
              DISPLAY '* PROGRAM IS ABENDING!                *'                 
              DISPLAY '***************************************'                 
              CALL ABEND                 USING  ABEND-CODE                      
           END-IF.                                                              
                                                                                
           EXEC SQL                                                             
              SET :WS-DATE-TIME = CURRENT TIMESTAMP                             
           END-EXEC.                                                            
                                                                                
           IF SQLCODE NOT = +0                                                  
              MOVE SPACES                   TO  HDR1-PROC-DATE                  
           ELSE                                                                 
              DISPLAY '***********************************************'         
              DISPLAY '* RUN DATE & TIME: ' WS-DATE-TIME ' *'                   
              DISPLAY '***********************************************'         
              MOVE WS-PROC-MM               TO  WS-DATE-MM                      
              MOVE WS-PROC-DD               TO  WS-DATE-DD                      
              MOVE WS-PROC-YY               TO  WS-DATE-YY                      
              MOVE WS-DATE                  TO  HDR1-PROC-DATE                  
           END-IF.                                                              
                                                                                
           MOVE WS-TIME-HH                  TO  HDR2-HH.                        
           MOVE WS-TIME-MM                  TO  HDR2-MM.                        
           MOVE WS-TIME-SS                  TO  HDR2-SS.                        
                                                                                
           MOVE NSCCDHDR-SUBMIT-DATE        TO  WS-SUBMIT-DATE.                 
           MOVE WS-SUBMIT-MM                TO  HDR3-SUBMIT-MM.                 
           MOVE WS-SUBMIT-DD                TO  HDR3-SUBMIT-DD.                 
           MOVE WS-SUBMIT-CC                TO  HDR3-SUBMIT-CC.                 
           MOVE WS-SUBMIT-YY                TO  HDR3-SUBMIT-YY.                 
                                                                                
           MOVE NSCCDHDR-MULTI-BATCH-NBR    TO  WS-CYCLE-NBR-AREA.              
           MOVE WS-CYCLE-NBR                TO  HDR3-CYCLE-NBR                  
                                                TRAC-CYCLE.                     
                                                                                
           READ AT-INPUT                  INTO  NSCCAT-AREA                     
              AT END SET EOF-AT-INPUT       TO  TRUE                            
           END-READ.                                                            
                                                                                
           MOVE LOW-VALUES                  TO  HOLD-DLVR-NBR                   
                                                HOLD-RCV-NBR                    
                                                                                
           PERFORM BUILD-CLIENT-TABLE.                                          
                                                                                
           EJECT                                                                
      *************                                                             
       EOJ-ROUTINE.                                                             
      *************                                                             
                                                                                
           CLOSE AT-INPUT                                                       
                 FR-REPORT.                                                     
                                                                                
           DISPLAY ' '.                                                         
           DISPLAY '*************************************'.                     
           DISPLAY '* CAT500D: COMPLETION IS SUCCESSFUL *'.                     
           DISPLAY '*************************************'.                     
                                                                                
