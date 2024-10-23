000001* PDX    - ACATMSD  C0330859 10/09/12 13:21:17 TBLAMUR            00001000
LRM003* SSR 85105 REQUEST EXPANDED MSD AREA TO OBTAIN ISIN.                     
000001* PDX    - ACATMSD  C0318727 01/10/12 07:41:27 TBLAMUR            00001000
LRM002* SSR 80728 RETURN MSD SYMBOL NEEDED FOR MFRS READ OF NTWMAST.            
000001* PDX    - ACATMSD  C0225431 09/13/05 11:55:17 TBLAMUR            00001000
LRM001* SSR 398389 LEFT JUSTIFY FIRST MSD DESC LINE                             
000001* PDX    - ACATMSD  C0119769 01/05/99 09:56:42 TBLAMUR            00001000
000001* PDX    - ACATMSD  C0109165 08/21/98 09:56:15 TBLAMUR            00001000
000100 ID DIVISION.                                                     00010000
000200 PROGRAM-ID. ACATMSD.                                             00020000
000250 AUTHOR.  LARRY MUREY.                                            00020000
000300*REMARKS.                                                         00030000
      *-----------------------------------------------------------------00030000
      * ACAT MSD I/O MODULE (VSAM).  THIS MAY BE REPLACED BY DB/2 MSD           
      * VERSION AT SOME FUTURE PERIOD.                                          
      * A MISSING CUSIP NUMBER IS FORMATTED LIKE STOCK RECORD.  THE             
      * 9 BYTE FIELD WILL CONTAIN XX FOLLOWED BY THE ADP NUMBER ON THE          
      * RETURNED CUSIP, AND RECOGNIZED AS SUCH ON THE WAY IN.                   
      *-----------------------------------------------------------------00030000
000500                                                                  00050000
000300 ENVIRONMENT DIVISION.                                            00030000
000400 DATA DIVISION.                                                   00040000
000500                                                                  00050000
000600 WORKING-STORAGE SECTION.                                         00060000
           COPY PDXIDCOB.                                                       
                                                                                
00056  77  CICSRESP                    PIC S9(8) COMP.                  MRGICP02
                                                                                
      * MSD WORK AREA                                                           
       77  LENGTH-OF-MSDIO-AREA        PIC S9(4) COMP-4 VALUE +2026.    MRGICP02
       77  WS-DEFAULT-SUFFIX-IND       PIC X(1)  VALUE 'N'.             MRGICP02
           88  DEFUALT-SUFFIX-000           VALUE 'Y'.                          
LRM001 77  SUB1                        PIC S9(4) COMP.                          
LRM001 77  SUB2                        PIC S9(4) COMP.                          
LRM001 77  WS-DESC                     PIC X(30) VALUE SPACES.                  
                                                                                
LRM003 01  WS-CALLED-EIBCALEN         PIC S9(4) COMP.                           
       01  WS-COMMAREA.                                                         
           COPY ACATMSDI.                                                       
                                                                                
00507  01  SEC-TYPEA1.                                                  BDV0384 
00508      03  SEC-TYPEA1-PACKED       PIC X(02).                       BDV0384 
00509      03  FILLER                  PIC S9(1)   COMP-3  VALUE ZERO.  BDV0384 
00510  01  SEC-TYPEA2  REDEFINES  SEC-TYPEA1                            BDV0384 
00511                                  PIC S9(5)   COMP-3.              BDV0384 
00512 *                                                                 BDV0384 
00513  01  SEC-TYPEB1.                                                  BDV0384 
00514      03  SEC-TYPEB1-COL-71       PIC X(01).                       BDV0384 
00515      03  SEC-TYPEB1-COL-72       PIC X(01).                       BDV0384 
00516      03  SEC-TYPEB1-COL-73       PIC X(01).                       BDV0384 
00517      03  SEC-TYPEB1-COL-74       PIC X(01).                       BDV0384 
00518      03  FILLER                  PIC X(01).                       BDV0384 
00519 *                                                                 BDV0384 
00520  01  SEC-TYPEB2  REDEFINES  SEC-TYPEB1                            BDV0384 
00521                                  PIC 9(5).                        BDV0384 
00522                                                                   BDV0384 
00523 *                                                                 BDV0384 
00524  01  WK-CLASS.                                                       CL*70
00525      05  WK-CLASS-1              PIC 9.                              CL*70
00526      05  WK-CLASS-2-5.                                               CL*70
00528          10  WK-CLASS-2          PIC 9.                              CL*70
00529          10  WK-CLASS-3          PIC 9.                              CL*70
00528          10  WK-CLASS-4          PIC 9.                              CL*70
00529          10  WK-CLASS-5          PIC 9.                              CL*70
00527      05  WK-CLASS-6-7.                                               CL*70
00528          10  WK-CLASS-6          PIC 9.                              CL*70
00529          10  WK-CLASS-7          PIC 9.                              CL*70
00523                                                                   BDV0384 
        01  FILLER REDEFINES WK-CLASS.                                          
            05 WK-CLASS-1-2            PIC 9(2).                                
            05 FILLER                  PIC 9(5).                                
                                                                                
00208 *01  MSDIO-CALLING-AREA.                                                  
00209 *    03 MSDIO-ACCESS                PIC X.                        MRGICP02
00210 *    03 MSDIO-ACTION                PIC X.                        MRGICP02
00211 *    03 MSDIO-SEARCH-KEY            PIC X(12).                    MRGICP02
00212 *    03 MSDIO-WHEN-ISSUE            PIC X.                        MRGICP02
00213 *    03 MSDIO-RETURN-CODE           PIC X.                        MRGICP02
00214 *    03 MSDIO-SEGMENT-INDS          PIC X(24).                    MRGICP02
LRM003*****COPY  RECMSDCO.                                              MRGICP02
LRM003     COPY MSDIOCE.                                                        
00216      EJECT                                                        MRGICP02
014700 LINKAGE SECTION.                                                 01470000
014800                                                                  01480000
014900 01  DFHCOMMAREA.                                                 01490000
           05  FILLER                     PIC X(500).                           
           EJECT                                                                
       PROCEDURE DIVISION.                                              01540000
                                                                                
           IF EIBCALEN NOT > ZERO                                               
              EXEC CICS RETURN END-EXEC.                                06880000
                                                                                
           MOVE DFHCOMMAREA(1 : EIBCALEN) TO WS-COMMAREA.                       
LRM003     MOVE EIBCALEN TO WS-CALLED-EIBCALEN.                                 
           IF ACATMSD-SEARCH-KEY NOT > SPACES                           MRGICP02
              SET ACATMSD-NOT-FOUND TO TRUE                                     
              MOVE WS-COMMAREA TO DFHCOMMAREA(1 : EIBCALEN)                     
              EXEC CICS RETURN END-EXEC.                                06880000
                                                                                
       READ-MSD-RTN.                                                            
LRMXXX     MOVE 'E'                  TO MSDIO-ACCESS.                           
LRMXXX     MOVE ' '                  TO MSDIO-ACTION.                           
00532***   MOVE 'R'                TO MSDIO-ACCESS.                     MRGICP02
00533      MOVE SPACES             TO MSDIO-SEARCH-KEY.                 MRGICP02
           IF ACATMSD-SEARCH-KEY(1 : 2) = 'XX'                          MRGICP02
              MOVE ACATMSD-SEARCH-KEY(3 : 7) TO MSDIO-SEARCH-KEY        MRGICP02
           ELSE                                                                 
              MOVE ACATMSD-SEARCH-KEY        TO MSDIO-SEARCH-KEY        MRGICP02
              IF ACATMSD-SEARCH-KEY(1 : 1) > ' '                                
              AND ACATMSD-SEARCH-KEY(9 : 1) > ' '                               
              AND ACATMSD-SEARCH-KEY(10 : 1) NOT > ' '                          
                 SET DEFUALT-SUFFIX-000      TO TRUE                            
                 MOVE '000'                  TO MSDIO-SEARCH-KEY(10 : 3)        
           END-IF.                                                              
00535      MOVE '0'                TO MSDIO-WHEN-ISSUE.                 MRGICP02
00536      MOVE SPACE              TO MSDIO-RETURN-CODE.                MRGICP02
00988      EXEC CICS LINK PROGRAM ('MSDIO') NOHANDLE                    MRGICP02
00989                    COMMAREA (MSDIO-CALLING-AREA)                  MRGICP02
00990                      LENGTH (LENGTH-OF-MSDIO-AREA)                MRGICP02
00991                        RESP (CICSRESP)                            MRGICP02
00992      END-EXEC.                                                    MRGICP02
                                                                                
           IF MSDIO-RETURN-CODE NOT = SPACE                             MRGICP02
           AND DEFUALT-SUFFIX-000                                               
                 MOVE SPACES             TO MSDIO-SEARCH-KEY(10 : 3)            
                                            MSDIO-RETURN-CODE           MRGICP02
                 EXEC CICS LINK PROGRAM ('MSDIO') NOHANDLE                    MR
                               COMMAREA (MSDIO-CALLING-AREA)                  MR
                                 LENGTH (LENGTH-OF-MSDIO-AREA)                MR
                                   RESP (CICSRESP)                            MR
                 END-EXEC                                               MRGICP02
           END-IF.                                                              
                                                                                
           IF MSDIO-RETURN-CODE EQUAL SPACE                             MRGICP02
              SET ACATMSD-FOUND TO TRUE                                         
              MOVE MS-CUSIP-AREA TO ACATMSD-CUSIP                               
              IF ACATMSD-CUSIP NOT > SPACES                                     
                 MOVE 'XX'       TO ACATMSD-CUSIP                               
                 MOVE MS-ADP-NO  TO ACATMSD-CUSIP(3 : 7)                        
              END-IF                                                            
              MOVE MS-ADP-NO TO ACATMSD-ADP-NBR                         MRGICP02
LRM001        IF MS-DESC1 (1 : 1) NOT > SPACES                                  
LRM001           PERFORM VARYING SUB1 FROM 2 BY 1                               
LRM001              UNTIL SUB1 > 30 OR MS-DESC1 (SUB1 : 1) > SPACES             
LRM001           END-PERFORM                                                    
LRM001           MOVE 1 TO SUB2                                                 
LRM001           MOVE SPACES TO WS-DESC                                         
LRM001           PERFORM VARYING SUB1 FROM SUB1 BY 1                            
LRM001              UNTIL SUB1 > 30                                             
LRM001              MOVE MS-DESC1 (SUB1 : 1) TO WS-DESC (SUB2 : 1)              
LRM001              ADD 1 TO SUB2                                               
LRM001           END-PERFORM                                                    
LRM001           MOVE WS-DESC TO MS-DESC1                                       
LRM001        END-IF                                                            
              MOVE MS-DESC1  TO ACATMSD-DESC                                    
010400        IF NOT MS-DESC-SEGMENT-ABSENT                                     
010500           MOVE MS-DESC2 TO ACATMSD-DESC2                                 
010500           MOVE MS-DESC3 TO ACATMSD-DESC3                                 
              ELSE                                                              
                 MOVE SPACES   TO ACATMSD-DESC2                                 
                                  ACATMSD-DESC3                                 
              END-IF                                                            
              MOVE MS-FORMAT-IND          TO WK-CLASS-1                    CL*46
              MOVE MS-SECURITY-TYPE       TO SEC-TYPEA1                 BDV0384 
              MOVE SEC-TYPEA2             TO SEC-TYPEB2                 BDV0384 
              MOVE SEC-TYPEB1             TO WK-CLASS-2-5                       
              MOVE MS-SECURITY-TYPE-2     TO WK-CLASS-6-7                       
              MOVE WK-CLASS               TO ACATMSD-CLASS-CD                   
              MOVE MS-CLOSING-PRICE       TO ACATMSD-CLOSING-PRICE              
              MOVE MS-BOND-REG-CODE       TO ACATMSD-BOND-REG-CODE              
LRM002        MOVE MS-SYMBOL              TO ACATMSD-SYMBOL                     
LRM003        IF NOT MSD-SEG-14-ABSENT                                          
LRM003           MOVE MSD-ISIN            TO ACATMSD-ISIN                       
LRM003        ELSE                                                              
LRM003           MOVE SPACES              TO ACATMSD-ISIN                       
LRM003        END-IF                                                            
LRM003***     IF NOT MSD-SEG-15-ABSENT                                          
LRM003***        MOVE MSD-ISO-COUNTRY-CODE TO ACATMSD-COUNTRY-CODE              
LRM003***     ELSE                                                              
LRM003***        MOVE SPACES               TO ACATMSD-COUNTRY-CODE              
LRM003***     END-IF                                                            
           ELSE                                                                 
01033         IF MSDIO-RETURN-CODE LESS THAN 'E'                        MRGICP02
01034            SET ACATMSD-NOT-AVAIL TO TRUE                          MRGICP02
01036         ELSE                                                      MRGICP02
01037            IF MSDIO-RETURN-CODE LESS THAN 'I'                     MRGICP02
01039               SET ACATMSD-ERROR TO TRUE                           MRGICP02
01040            ELSE                                                   MRGICP02
                    SET ACATMSD-NOT-FOUND TO TRUE                               
           END-IF.                                                              
                                                                                
LRM003     MOVE WS-COMMAREA TO DFHCOMMAREA(1 : WS-CALLED-EIBCALEN).             
           EXEC CICS RETURN END-EXEC.                                   06880000
                                                                                
           EJECT                                                                
069600 9990-END-PROGRAM.                                                06960057
069700     STOP RUN.                                                    06970000
