000001* PDX    - CAT712   C0361186 01/07/15 15:50:58 TBLAMUR            00001000
LRM013* SSR 103323 NEW COL FOR PAPER FEE AMOUNT.                                
000001* PDX    - CAT712   C0348882 12/06/13 06:48:53 TBCHKOP            00001000
CSG001* SSR 91356 MOVE SPACES TO BPDATES-CALENDAR-TYPE.                         
000001* PDX    - CAT712   C0329036 07/19/12 14:48:41 TBLAMUR            00001000
LRM012* SSR 84763 80728 NEW COL FOR DELIVERING NON U$ POSITIONS.                
000001* PDX    - CAT712   C0317345 11/29/11 19:01:59 TBLAMUR            00001000
LRM011* SSR 79096 80728 NEW COLS FOR PENDING DIVIDEND AND NTWLVL4 FUND.         
LRM011*   REDUCE COMMIT AFTER 10 TO 5 VTRNFR DELETES.                           
000001* PDX    - CAT712   C0296621 09/14/10 20:24:35 TBLAMUR            00001000
LRM010* SSR 71810 NEW COLS FOR FOREIGN FEES                                     
000001* PDX    - CAT712   C0296134 05/07/10 14:18:21 TBLAMUR            00001000
LRM009* SSR 65158 GEO-CD ON VTRNFR                                              
000001* PDX    - CAT712   C0287774 12/09/09 15:26:40 TBLAMUR            00001000
LRM008* SSR 65670 SUB-PENNY PRICE COL AND INTEGER2.AMT                          
000001* PDX    - CAT712   C0283838 09/28/09 10:03:44 TBEDTAK            00001000
ET0001* SSR 64624 CHANGE CAT7120Z TO RUN BY STREAM                              
000001* PDX    - CAT712   C0276888 04/06/09 10:51:56 TBDOJUN            00001000
DJ0003* SSR 61684 AUCTION RATE SECURITY                                         
000001* PDX    - CAT712   C0272583 12/08/08 09:47:43 TBDOJUN            00001000
DJ0002* SSR 0061164 POSITION TRANSFER FUND(PTF)                                 
000001* PDX    - CAT712   C0256193 10/25/07 15:09:42 TBLAMUR            00001000
LRM007* SSR 0054956 ISSUE DELETE ON ACTIAST WHEN PTR DLVY REJECT                
LRM007* IS MOVED TO HISTORY. (RESOLVE DUPE INSERT ISSUE IN CAT518).             
000001* PDX    - CAT712   C0253977 09/07/07 12:10:38 TBLAMUR            00001000
LRM006* SSR 0054091 NEW COL FOR CONVERSION ACCOUNT                              
000001* PDX    - CAT712   C0240752 10/23/06 15:29:06 TBLAMUR            00001000
LRM005* SSR 0049202 NEW COLS GIFT IND, ONLINE FLAGS                             
000001* PDX    - CAT712   C0236781 07/05/06 09:11:23 TBLAMUR            00001000
LRM004* SSR 0045744 COPY ALTBR AND FRZN DETAILS TO HISTORY.                     
000001* PDX    - CAT712   C0222440 07/05/05 07:52:29 TBLAMUR            00001000
LRM003* SSR 0039849 COPY 866 DETAILS TO HISTORY.                                
LRM003* SSR    - MIGRATE PTRS IN 510 OR 600 STATUS TO HSTY.                     
000001* PDX    - CAT712   C0218155 03/09/05 09:57:56 TBLAMUR            00001000
LRM002* SSR 0040042 MOVE CLP STATUS=400 TO HISTORY.                             
000001* PDX    - CAT712   C0210469 10/11/04 08:07:07 TBLAMUR            00001000
      * SSR 0034535 COPY CAGE TAG FROM VASSET TO VASTHSTY.                      
      * REMOVE Q STREAM LOGIC ABOUT PRIOR S/D MIGRATION TO HSTY.                
000001* PDX    - CAT712   C0152174 01/02/01 12:07:26 TBLAMUR            00001000
000001* PDX    - CAT712   C0151178 12/18/00 08:41:06 TBDOJUN            00001000
      * DJ0001 COBOL LE                                                 CAT712  
000001* PDX    - CAT712   C0131028 09/09/99 10:55:12 TBLAMUR            CAT712  
000001* PDX    - CAT712   C0127169 08/05/99 10:16:06 TBLAMUR            CAT712  
000001* PDX    - CAT712   C0125684 05/11/99 10:27:49 TBLAMUR            CAT712  
000001* PDX    - CAT712   C0124189 04/09/99 10:31:18 TBLAMUR            CAT712  
000001* PDX    - CAT712   C0120996 01/27/99 15:33:01 TBYOHON            CAT712  
000001* PDX    - CAT712   C0118608 12/08/98 16:11:13 TBDOJUN            CAT712  
000001* PDX    - CAT712   C0115343 10/23/98 16:59:40 TBYOHON            CAT712  
       IDENTIFICATION DIVISION.                                         CAT712  
       PROGRAM-ID.  CAT712.                                             CAT712  
      *REMARK.                                                          CAT712  
      *  ACATS REDESIGN -                                               CAT712  
      *        THIS PROGRAM DOES ACAT DATABASE MAINTENACE -             CAT712  
      *        REMOVE AGED PENDING TRANSFER  AND  TIF THAT WAS REJECTED CAT712  
      *                                                                 CAT712  
       AUTHOR.      T. KUO.                                             CAT712  
       DATE-WRITTEN.  SEPT 1998.                                        CAT712  
       ENVIRONMENT DIVISION.                                            CAT712  
       INPUT-OUTPUT SECTION.                                            CAT712  
       FILE-CONTROL.                                                    CAT712  
       DATA DIVISION.                                                   CAT712  
      ******************************************************************CAT712  
       WORKING-STORAGE SECTION.                                         CAT712  
      ******************************************************************CAT712  
                                                                        CAT712  
DJ0001     COPY PDXIDCOB.                                               CAT712  
                                                                        CAT712  
       77  FILLER                      PIC X(06) VALUE 'CAT712'.        CAT712  
       77  WS-COUNT                    PIC S9(9) COMP   VALUE +0.       CAT712  
       77  WS-DLTE-COUNT               PIC S9(3) COMP-3 VALUE +0.       CAT712  
       77  WS-COMMIT-CNT               PIC 9(009) COMP-3 VALUE 0.       CAT712  
       77  WS-STREAM-ID                PIC X(01)  VALUE SPACES.         CAT712  
ET0001 77  TBL-CNT                     PIC 9(03) COMP-3 VALUE 0.        CAT712  
ET0001 77  B1-SUB                      PIC 9(03) COMP-3 VALUE 0.        CAT712  
ET0001 77  GETB1V-PROG                 PIC X(08) VALUE 'ZGETB1V '.      CAT712  
      /                                                                 CAT712  
DJ0001***===> COBOL LE                                                  CAT712  
DJ0001 01  W-ABEND-AREA.                                                CAT712  
DJ0001     05  ABEND-CODE                PIC S9(04) COMP SYNC.          CAT712  
DJ0001 01  CALL-MODULES.                                                CAT712  
DJ0001     05  DSNTIAR                   PIC  X(08) VALUE 'DSNTIAR '.   CAT712  
DJ0001 01  FILLER                        PIC  X(08) VALUE 'STUBCPY '.   CAT712  
DJ0001     COPY STUBCPY.                                                CAT712  
DJ0001***<=== COBOL LE                                                  CAT712  
      /                                                                 CAT712  
       01  WS-CAT712-WORK-AREA.                                         CAT712  
ET0001     03  WS-END-OF-TRANSFER-SW   PIC X(1)    VALUE ' '.           CAT712  
               88  END-OF-TRANSFER     VALUE 'Y'.                       CAT712  
           03  END-OF-ASSET-SW         PIC X(1)    VALUE ' '.           CAT712  
               88  END-OF-ASSET        VALUE 'Y'.                       CAT712  
           03  END-OF-OPTION-SW        PIC X(1)    VALUE ' '.           CAT712  
               88  END-OF-OPTION       VALUE 'Y'.                       CAT712  
           03  END-OF-MF-SW            PIC X(1)    VALUE ' '.           CAT712  
               88  END-OF-MF           VALUE 'Y'.                       CAT712  
           03  WS-FIRST-TIME-SW        PIC X(1)    VALUE 'Y'.           CAT712  
               88  FIRST-TIME          VALUE 'Y'.                       CAT712  
           03  SV-CLIENT-NBR           PIC X(04)   VALUE LOW-VALUES.    CAT712  
           03  WS-CLIENT-NBR           PIC X(04)   VALUE LOW-VALUES.    CAT712  
           03  WS-ACAT-CNTL-NBR        PIC X(14)   VALUE LOW-VALUES.    CAT712  
           03  WS-ACAT-PARTL-NN-DAY    PIC 9(02)   VALUE 0.             CAT712  
           03  WK-STTLM-DATE.                                           CAT712  
               05  STTLM-YYYY.                                          CAT712  
                   07 STTLM-CC         PIC X(02).                       CAT712  
                   07 STTLM-YY         PIC X(02).                       CAT712  
               05  FILLER              PIC X.                           CAT712  
               05  STTLM-MM            PIC X(02).                       CAT712  
               05  FILLER              PIC X.                           CAT712  
               05  STTLM-DD            PIC X(02).                       CAT712  
               05  FILLER              PIC X(16).                       CAT712  
           03  WS-STTLM-DATE.                                           CAT712  
               05  WS-STTLM-YYYY       PIC X(04).                       CAT712  
               05  WS-STTLM-MM         PIC X(02).                       CAT712  
               05  WS-STTLM-DD         PIC X(02).                       CAT712  
009918     03  WS-TODAY-CCYYMMDD-AREA.                                  CAT712  
               05  WS-TODAY-CC         PIC XX.                          CAT712  
               05  WS-TODAY-YY         PIC XX.                          CAT712  
               05  WS-TODAY-MM         PIC XX.                          CAT712  
               05  WS-TODAY-DD         PIC XX.                          CAT712  
009918     03  WS-TODAY-CCYYMMDD REDEFINES                              CAT712  
               WS-TODAY-CCYYMMDD-AREA  PIC 9(08).                       CAT712  
009918     03  WS-PROC-DAY             PIC X(10).                       CAT712  
           03  FILLER REDEFINES WS-PROC-DAY.                            CAT712  
               05  WS-PROC-YYYY.                                        CAT712  
                   07 WS-PROC-CC       PIC X(02).                       CAT712  
                   07 WS-PROC-YY       PIC X(02).                       CAT712  
               05  FILLER-1            PIC X.                           CAT712  
               05  WS-PROC-MM          PIC X(02).                       CAT712  
               05  FILLER-2            PIC X.                           CAT712  
               05  WS-PROC-DD          PIC X(02).                       CAT712  
           03  WS-AGED-PROC-CCYYMMDD.                                   CAT712  
               05  WS-AGED-PROC-CCYY   PIC X(04).                       CAT712  
               05  WS-AGED-PROC-MM     PIC X(02).                       CAT712  
               05  WS-AGED-PROC-DD     PIC X(02).                       CAT712  
           03  WS-AGED-PROC-DAY        PIC X(10).                       CAT712  
           03  WS-AGED-PROC-DAY-GROUP REDEFINES WS-AGED-PROC-DAY.       CAT712  
               05  WS-AGED-PROC-CCYY   PIC X(04).                       CAT712  
               05  AGED-FILLER-1       PIC X.                           CAT712  
               05  WS-AGED-PROC-MM     PIC X(02).                       CAT712  
               05  AGED-FILLER-2       PIC X.                           CAT712  
               05  WS-AGED-PROC-DD     PIC X(02).                       CAT712  
009918     03  WS-DATE-CCYYMMDD        PIC 9(08).                       CAT712  
009919     03  WS-DATE-CCYYMMDD-AREA REDEFINES WS-DATE-CCYYMMDD.        CAT712  
009920         05  WS-DATE-CCYYMMDD-CC           PIC X(02).             CAT712  
009930         05  WS-DATE-CCYYMMDD-YY           PIC X(02).             CAT712  
009940         05  WS-DATE-CCYYMMDD-MM           PIC X(02).             CAT712  
009950         05  WS-DATE-CCYYMMDD-DD           PIC X(02).             CAT712  
           03  WS-DATE-MMDDCCYY        PIC 9(08).                       CAT712  
           03  WS-DATE-MMDDCCYY-AREA REDEFINES WS-DATE-MMDDCCYY.        CAT712  
               05  WS-DATE-MMDDCCYY-MM           PIC X(02).             CAT712  
               05  WS-DATE-MMDDCCYY-DD           PIC X(02).             CAT712  
               05  WS-DATE-MMDDCCYY-CC           PIC X(02).             CAT712  
               05  WS-DATE-MMDDCCYY-YY           PIC X(02).             CAT712  
           03  WS-DATE-MMDDYY          PIC 9(06).                       CAT712  
           03  FILLER REDEFINES WS-DATE-MMDDYY.                         CAT712  
               05  WS-DATE-MMDDYY-MM   PIC X(02).                       CAT712  
               05  WS-DATE-MMDDYY-DD   PIC X(02).                       CAT712  
               05  WS-DATE-MMDDYY-YY   PIC X(02).                       CAT712  
           03  WS-NEXT-MMDDYY          PIC 9(06).                       CAT712  
ET0001 01  B1-TABLE-AREA.                                               CAT712  
ET0001     03  B1-TABLE OCCURS 500 TIMES.                               CAT712  
ET0001         05  B1-CLT-NO                PIC 9(04).                  CAT712  
ET0001         05  B1-CLT-NAME              PIC X(30).                  CAT712  
ET0001         05  B1-BKR-CLR-NO            PIC X(04).                  CAT712  
ET0001         05  B1-STREAM                PIC X(01).                  CAT712  
ET0001         05  B1-STATUS                PIC X(01).                  CAT712  
ET0001         05  B1-ACAT-STATUS           PIC X(01).                  CAT712  
       01  DB2-WORK-AREA.                                               CAT712  
           03  WS-VTRNFR-DLTE-COUNT          PIC 9(5)  VALUE  0.        CAT712  
           03  WS-VTRNFR-DLTE-TOTAL          PIC 9(5)  VALUE  0.        CAT712  
           03  WS-VTRNHSTY-ISRT-COUNT        PIC 9(5)  VALUE  0.        CAT712  
           03  WS-VTRNHSTY-ISRT-TOTAL        PIC 9(5)  VALUE  0.        CAT712  
           03  WS-VASTHSTY-ISRT-TOTAL        PIC 9(5)  VALUE  0.        CAT712  
           03  WS-VOPTHSTY-ISRT-TOTAL        PIC 9(5)  VALUE  0.        CAT712  
           03  WS-VMFHSTY-ISRT-TOTAL         PIC 9(5)  VALUE  0.        CAT712  
LRM007     03  WS-ACTIAST-DLTE-COUNT         PIC 9(5)  VALUE  0.        CAT712  
LRM007     03  W-SQLERRD-3                   PIC 9(9).                          
           03  VTRNHSTY-SW                   PIC X     VALUE SPACE.     CAT712  
               88  VTRNHSTY-ROW-INSERTED               VALUE 'Y'.       CAT712  
           03  VASSET-SW                     PIC X     VALUE SPACE.     CAT712  
               88  VASSET-FETCHED                      VALUE 'Y'.       CAT712  
           03  VOPTION-SW                    PIC X     VALUE SPACE.     CAT712  
               88  VOPTION-FETCHED                     VALUE 'Y'.       CAT712  
           03  VMF-SW                        PIC X     VALUE SPACE.     CAT712  
               88  VMF-FETCHED                         VALUE 'Y'.       CAT712  
           03  VASTHSTY-SW                   PIC X     VALUE SPACE.     CAT712  
               88  VASTHSTY-ROW-INSERTED               VALUE 'Y'.       CAT712  
           03  VOPTHSTY-SW                   PIC X     VALUE SPACE.     CAT712  
               88  VOPTHSTY-ROW-INSERTED               VALUE 'Y'.       CAT712  
           03  VMFHSTY-SW                    PIC X     VALUE SPACE.     CAT712  
               88  VMFHSTY-ROW-INSERTED                VALUE 'Y'.       CAT712  
       01  DB2-ABEND-WORK-AREA.                                         CAT712  
           03  WS-NSCC-PEND-IND              PIC X(01)  VALUE SPACES.   CAT712  
           03  WS-DB2-MESSAGE-AREA.                                     CAT712  
               05  WS-DB2-MSG-LEN            PIC S9(04) COMP VALUE +960.CAT712  
               05  WS-ERROR-MSG              PIC X(80)  OCCURS 12 TIMES CAT712  
                   INDEXED BY WS-ERROR-INDEX.                           CAT712  
           03  WS-ERR-LINE-LEN               PIC S9(09) COMP VALUE +80. CAT712  
      *                                                                 CAT712  
      /                                                                 CAT712  
           EXEC SQL                                                     CAT712  
              INCLUDE SQLCA                                             CAT712  
           END-EXEC.                                                    CAT712  
      /                                                                 CAT712  
LRM007     EXEC SQL                                                     CAT712  
LRM007        INCLUDE ACTIAST                                           CAT712  
LRM007     END-EXEC.                                                    CAT712  
      /                                                                 CAT712  
           EXEC SQL                                                     CAT712  
              INCLUDE VTRNFR                                            CAT712  
           END-EXEC.                                                    CAT712  
      /                                                                 CAT712  
           EXEC SQL                                                     CAT712  
              INCLUDE VASSET                                            CAT712  
           END-EXEC.                                                    CAT712  
      /                                                                 CAT712  
           EXEC SQL                                                     CAT712  
               INCLUDE VMF                                              CAT712  
           END-EXEC.                                                    CAT712  
      /                                                                 CAT712  
           EXEC SQL                                                     CAT712  
               INCLUDE VOPTN                                            CAT712  
           END-EXEC.                                                    CAT712  
                                                                        CAT712  
      /                                                                 CAT712  
           EXEC SQL                                                     CAT712  
              INCLUDE VTRNHSTY                                          CAT712  
           END-EXEC.                                                    CAT712  
      /                                                                 CAT712  
           EXEC SQL                                                     CAT712  
              INCLUDE VASTHSTY                                          CAT712  
           END-EXEC.                                                    CAT712  
      /                                                                 CAT712  
           EXEC SQL                                                     CAT712  
               INCLUDE VMFHSTY                                          CAT712  
           END-EXEC.                                                    CAT712  
      /                                                                 CAT712  
           EXEC SQL                                                     CAT712  
               INCLUDE VOPTHSTY                                         CAT712  
           END-EXEC.                                                    CAT712  
      /                                                                 CAT712  
           COPY BHINFO.                                                 CAT712  
      /                                                                 CAT712  
           COPY BHACAT.                                                 CAT712  
      /                                                                 CAT712  
           COPY RECDATZC.                                               CAT712  
      /                                                                 CAT712  
           COPY LKDTSRCH.                                               CAT712  
      /                                                                 CAT712  
           COPY BPDATESC.                                               CAT712  
      /                                                                 CAT712  
       LINKAGE SECTION.                                                 CAT712  
           SKIP1                                                        CAT712  
       01  PARM-AREA.                                                   CAT712  
           05  PARM-LENGTH            PIC S9(4)    COMP.                CAT712  
           05  PARM-STREAM-ID         PIC X(01).                        CAT712  
                                                                        CAT712  
      ***************************************************************** CAT712  
       PROCEDURE DIVISION  USING PARM-AREA.                             CAT712  
      ***************************************************************** CAT712  
           DISPLAY 'CAT712 - MOVE SETTLED AND REJECTED TIF AND ASSETS'  CAT712  
                           ' TO HISTORY'.                               CAT712  
           DISPLAY ' '.                                                 CAT712  
           COPY  MSGCOBO.                                               CAT712  
                                                                        CAT712  
           IF PARM-LENGTH GREATER ZEROS                                 CAT712  
              MOVE PARM-STREAM-ID TO WS-STREAM-ID                       CAT712  
           END-IF.                                                      CAT712  
           PERFORM GET-TODAYS-DATE.                                     CAT712  
ET0001     PERFORM LOAD-B1-RTN.                                         CAT712  
ET0001**   PERFORM GET-TIF THRU GET-TIF-EXIT.                           CAT712  
ET0001     PERFORM GET-TIF THRU GET-TIF-EXIT                            CAT712  
ET0001         VARYING B1-SUB FROM 1 BY 1 UNTIL B1-SUB > TBL-CNT.       CAT712  
ET0001                                                                  CAT712  
DJ0002     DISPLAY  WS-VTRNFR-DLTE-TOTAL    ' VTRNFR   DELETED '.       CAT712  
DJ0002     DISPLAY  WS-VTRNHSTY-ISRT-TOTAL  ' VTRNHSTY ADDED '.         CAT712  
DJ0002     DISPLAY  WS-VASTHSTY-ISRT-TOTAL  ' VASTHSTY ADDED '.         CAT712  
DJ0002     DISPLAY  WS-VOPTHSTY-ISRT-TOTAL  ' VOPTHSTY ADDED '.         CAT712  
DJ0002     DISPLAY  WS-VMFHSTY-ISRT-TOTAL   ' VMFHSTY  ADDED '.         CAT712  
LRM007     DISPLAY  WS-ACTIAST-DLTE-COUNT   ' ACTIAST  DELETED'.        CAT712  
LRM011     DISPLAY  WS-COMMIT-CNT           ' COMMITS'.                 CAT712  
           GOBACK.                                                      CAT712  
                                                                        CAT712  
       GET-TODAYS-DATE.                                                 CAT712  
CSG001* MOVE SPACES TO BPDATES-CALENDAR-TYPE TO ALLOW BPDATES TO USE            
CSG001* THE DEFAULT CALENDAR.                                                   
CSG001*    MOVE 'US'               TO  BPDATES-CALENDAR-TYPE.           CAT712  
CSG001     MOVE '  '               TO  BPDATES-CALENDAR-TYPE.           CAT712  
016570     CALL LNKDATZ   USING LINK-DATES-AREA                         CAT712  
                            BPDATES-CALENDAR-TYPE.                      CAT712  
LRM********IF WS-STREAM-ID = 'Q'                                        CAT712  
LRM********   MOVE LD-PRIOR-PROC-DATE TO WS-DATE-MMDDYY                 CAT712  
LRM********                              WS-NEXT-MMDDYY                 CAT712  
LRM********ELSE                                                         CAT712  
              MOVE LD-PROC-DATE       TO WS-DATE-MMDDYY                 CAT712  
                                         WS-NEXT-MMDDYY                 CAT712  
LRM********END-IF.                                                      CAT712  
016590     PERFORM CONVERT-TO-CCYYMMDD.                                 CAT712  
016600*    MOVE WS-DATE-CCYYMMDD    TO WS-TODAY-CCYYMMDD.               CAT712  
      *====> FORMAT WS-PROC-DAY (CCYY-MM-DD)                            CAT712  
           MOVE WS-DATE-CCYYMMDD-CC TO WS-PROC-CC.                      CAT712  
           MOVE WS-DATE-CCYYMMDD-YY TO WS-PROC-YY.                      CAT712  
           MOVE WS-DATE-CCYYMMDD-MM TO WS-PROC-MM.                      CAT712  
           MOVE WS-DATE-CCYYMMDD-DD TO WS-PROC-DD.                      CAT712  
           MOVE '-'                 TO FILLER-1,  FILLER-2.             CAT712  
                                                                        CAT712  
           SET BPD-DISPLACEMENT-DATE-INFO TO TRUE.                      CAT712  
           MOVE WS-DATE-CCYYMMDD TO BPDATES-BASE-DATE.                  CAT712  
           SET BPD-DISP-MINUS TO TRUE.                                  CAT712  
           SET BPD-DISP-CALENDAR TO TRUE.                               CAT712  
           MOVE 120 TO BPDATES-DTSEARCH-DISP.                           CAT712  
           CALL BPDATES USING BPDATES-PARAMETERS.                       CAT712  
           IF NOT BPD-VALID-RETURN                                      CAT712  
              DISPLAY 'BPD BASE DATE   = ' BPDATES-BASE-DATE            CAT712  
              DISPLAY 'BPD RETURN CODE = ' BPDATES-RETURN-CODE          CAT712  
              DISPLAY 'BPD ERROR  CODE = ' BPDATES-ERROR-CODE           CAT712  
              DISPLAY 'BPD ERROR  MSG  = ' BPDATES-ERROR-MSG            CAT712  
              MOVE +1000 TO ABEND-CODE                                  CAT712  
              GO TO CALL-ABEND                                          CAT712  
           ELSE                                                         CAT712  
              MOVE BPD-DT-CALDATE TO WS-AGED-PROC-CCYYMMDD              CAT712  
              MOVE CORR WS-AGED-PROC-CCYYMMDD                           CAT712  
                     TO WS-AGED-PROC-DAY-GROUP                          CAT712  
              MOVE '-'                 TO AGED-FILLER-1, AGED-FILLER-2  CAT712  
           END-IF.                                                      CAT712  
           DISPLAY 'PARM STREAM         ' WS-STREAM-ID                  CAT712  
                  ' PROCESSING FOR DATE ' WS-DATE-CCYYMMDD              CAT712  
                  ' AGED PROCESS DATE   ' WS-AGED-PROC-CCYYMMDD.        CAT712  
ET0001*                                                                 CAT712  
ET0001 LOAD-B1-RTN.                                                     CAT712  
           MOVE SPACE   TO B1-TABLE-AREA.                               CAT712  
           MOVE ZERO    TO TBL-CNT.                                     CAT712  
                                                                        CAT712  
           PERFORM VARYING B1-SUB FROM 1 BY 1 UNTIL B1-SUB > 500        CAT712  
                                                                        CAT712  
              MOVE  ' '                   TO  BH-BROKER-HEADER-INFO     CAT712  
                                              BH-ACAT-INFO              CAT712  
              MOVE  B1-SUB                TO  BH-BROKER-NUMBER-N        CAT712  
              MOVE  '015'                 TO  BH-LOGICAL-RECORD-CODE    CAT712  
              MOVE  '434500'              TO  BH-B2-INFO-ID             CAT712  
              CALL  GETB1V-PROG         USING BH-BROKER-HEADER-INFO     CAT712  
                                              BH-ACAT-INFO              CAT712  
              IF  BH-BROKER-ACTIVE                                      CAT712  
              AND BH-ACAT-ACTIVE                                        CAT712  
                 IF (BH-BROKER-MINI-MAXI-INDICATOR = PARM-STREAM-ID     CAT712  
                 OR  PARM-STREAM-ID = 'Q')                              CAT712  
                    ADD 1 TO TBL-CNT                                    CAT712  
                    MOVE  BH-BROKER-NUMBER-N                            CAT712  
                                          TO B1-CLT-NO     (TBL-CNT)    CAT712  
                    MOVE  BH-BROKER-NAME                                CAT712  
                                          TO B1-CLT-NAME   (TBL-CNT)    CAT712  
                    MOVE  BH-BROKER-OLD-CLEARING-HOUSE (2:4)            CAT712  
                                          TO B1-BKR-CLR-NO (TBL-CNT)    CAT712  
                    MOVE  BH-BROKER-MINI-MAXI-INDICATOR                 CAT712  
                                          TO B1-STREAM     (TBL-CNT)    CAT712  
                    MOVE  BH-BROKER-STATUS                              CAT712  
                                          TO B1-STATUS     (TBL-CNT)    CAT712  
                    MOVE  BH-ACAT-STATUS                                CAT712  
                                          TO B1-ACAT-STATUS(TBL-CNT)    CAT712  
                    DISPLAY  'CNT='   TBL-CNT                           CAT712  
                             ' CLT '  B1-CLT-NO      (TBL-CNT)          CAT712  
                             ' '      B1-CLT-NAME    (TBL-CNT)          CAT712  
                             ' BKR '  B1-BKR-CLR-NO  (TBL-CNT)          CAT712  
                             ' STR '  B1-STREAM      (TBL-CNT)          CAT712  
                             ' STA '  B1-STATUS      (TBL-CNT)          CAT712  
                             ' ACAT ' B1-ACAT-STATUS (TBL-CNT)          CAT712  
                             ' PEND ' BH-ACAT-RESID-CRD-DISPL-ONLINE    CAT712  
                 END-IF                                                 CAT712  
              END-IF                                                    CAT712  
           END-PERFORM.                                                 CAT712  
******/                                                                 CAT712  
       GET-TIF.                                                         CAT712  
ET0001     MOVE B1-CLT-NO (B1-SUB)    TO WS-CLIENT-NBR.                 CAT712  
ET0001                                                                  CAT712  
      *** SELECT ACTIVE TIF WHICH IS REJECTED OR STTLM-DATE IS PASSED **CAT712  
      ***                                                               CAT712  
      *--- DECLARE                                                      CAT712  
           EXEC SQL                                                     CAT712  
                DECLARE TIF_CSR CURSOR WITH HOLD FOR                    CAT712  
                SELECT                                                  CAT712  
                    CLIENT_NBR                                          CAT712  
                   ,ACAT_CONTROL_NBR                                    CAT712  
                   ,SBMTG_PRTCP_NBR                                     CAT712  
                   ,SBMT_PRT_NR_STS_CD                                  CAT712  
                   ,CONTROL_NBR_STS_CD                                  CAT712  
                   ,DLVR_NBR                                            CAT712  
                   ,DLVR_NBR_STTS_CD                                    CAT712  
                   ,ACCT_DLVR_NBR                                       CAT712  
                   ,ACCT_DLVR_STTS_CD                                   CAT712  
                   ,RCV_NBR                                             CAT712  
                   ,RCV_NBR_STTS_CD                                     CAT712  
                   ,ACCT_RCV_NBR                                        CAT712  
                   ,ACCT_RCV_STTS_CD                                    CAT712  
                   ,TRNFR_TYPE_CD                                       CAT712  
                   ,TRNFR_TYPE_STTS_CD                                  CAT712  
                   ,TRANS_TYPE_CD                                       CAT712  
                   ,TRANS_TYPE_STTS_CD                                  CAT712  
                   ,RCV_CUST_NM                                         CAT712  
                   ,RCV_CUST_NM_STS_CD                                  CAT712  
                   ,RCV_SS_PRIM_NBR                                     CAT712  
                   ,RCV_SS_PRIM_STS_CD                                  CAT712  
                   ,RCV_SS_SCNDY_NBR                                    CAT712  
                   ,RCV_SS_SCDY_STS_CD                                  CAT712  
                   ,RCV_ACCT_TYPE_CD                                    CAT712  
                   ,RCV_ACT_TYP_STS_CD                                  CAT712  
                   ,RCV_OCC_BRKR_NBR                                    CAT712  
                   ,RCV_OCC_STTS_CD                                     CAT712  
                   ,RCV_CRSPN_NBR                                       CAT712  
                   ,RCV_CRSPN_STTS_CD                                   CAT712  
                   ,ACAT_CNTL_ASTD_NBR                                  CAT712  
                   ,CNTL_ASTD_STTS_CD                                   CAT712  
                   ,CMNT_TXT                                            CAT712  
                   ,CMNT_STTS_CD                                        CAT712  
                   ,PRCS_DT                                             CAT712  
                   ,STTS_CD                                             CAT712  
                   ,STTLM_TM_CD                                         CAT712  
                   ,VAL_FREE_CD                                         CAT712  
                   ,TRANS_RFRN_ID_CD                                    CAT712  
                   ,TRANS_RFRN_STTS_CD                                  CAT712  
                   ,DB_CR_CD                                            CAT712  
                   ,DSTBN_SIDE_CD                                       CAT712  
                   ,SYS_ACT_CD                                          CAT712  
                   ,SYS_RJCT_RSN_CD                                     CAT712  
                   ,TRNFR_TYPE_RJC1_CD                                  CAT712  
                   ,TRNFR_TYPE_RJC2_CD                                  CAT712  
                   ,TRNFR_TYPE_RJCT_CD                                  CAT712  
                   ,TRN_TYP_RJC_STS_CD                                  CAT712  
                   ,PHSCL_SEQ_NBR                                       CAT712  
                   ,PHSCL_SEQ_STTS_CD                                   CAT712  
                   ,LGCL_SEQ_NBR                                        CAT712  
                   ,LGCL_SEQ_NR_STS_CD                                  CAT712  
                   ,RR_CD                                               CAT712  
                   ,BRANCH_CD                                           CAT712  
                   ,DVDND_NAA_CD                                        CAT712  
                   ,SELL_INSTN_NAA_CD                                   CAT712  
                   ,CASH_SWEEP_NAA_CD                                   CAT712  
                   ,PRTCP_CONTRA_CD                                     CAT712  
                   ,ACM_HOLDER_NAA_CD                                   CAT712  
                   ,ACCT_ACTIVITY_IND                                   CAT712  
                   ,ACCT_ORDERS_IND                                     CAT712  
                   ,ACCT_RJCT_RSBM_IND                                  CAT712  
                   ,ACCT_DB_BAL_T1_IND                                  CAT712  
                   ,ACCT_MRGN_DB_IND                                    CAT712  
                   ,ACCT_SHRT_PSTN_IND                                  CAT712  
                   ,ACCT_SEC_RSTRD_IND                                  CAT712  
                   ,ACCT_AST_EXCS_IND                                   CAT712  
                   ,ACCT_OPTN_PSTN_IND                                  CAT712  
                   ,ACCT_LTD_PRTNR_IND                                  CAT712  
                   ,ACCT_TIN_MSMTH_IND                                  CAT712  
                   ,ACCT_DPLCT_TRN_IND                                  CAT712  
                   ,ACCT_CUST_70_IND                                    CAT712  
                   ,ACCT_QULFD_PLN_IND                                  CAT712  
                   ,ACCT_MNGD_IND                                       CAT712  
                   ,ACCT_PRVT_RNG_IND                                   CAT712  
                   ,ACCT_BRKR_TIF_IND                                   CAT712  
                   ,NSCC_NON_ADP_IND                                    CAT712  
                   ,CYCLE_CD                                            CAT712  
                   ,DAYS_STTS_QTY                                       CAT712  
                   ,STTLM_DT                                            CAT712  
                   ,ACCT_NA_UPDT_IND                                    CAT712  
                   ,ACCT_TRNFR_FEE_AMT                                  CAT712  
                   ,ACCT_IRA_TRMNT_AMT                                  CAT712  
                   ,ACCT_IRA_MAINT_AMT                                  CAT712  
                   ,ACCT_DLRV_PRGR_IND                                  CAT712  
                   ,ACCT_CD                                             CAT712  
                   ,STTLM_ASCTD_DT                                      CAT712  
                   ,STTLM_ASCTD_STS_CD                                  CAT712  
                   ,RCRD_LNGTH_STTS_CD                                  CAT712  
                   ,RCRD_STTS_CD                                        CAT712  
                   ,NSCC_PEND_CD                                        CAT712  
                   ,NSCC_ACK_IND                                        CAT712  
                   ,CICS_TERM_ID_CD                                     CAT712  
                   ,PRGM_NM                                             CAT712  
                   ,CRT_TMSTP                                           CAT712  
                   ,UPDT_TMSTP                                          CAT712  
                   ,ACCT_EQUITY_AMT                                     CAT712  
LRM004             ,FRV_MFC_CMPLT_IND                                           
LRM004             ,ACCT_FRZN_IND                                               
LRM004             ,BRANCH_ALTNT_CD                                             
LRM005             ,GIFT_IND                                                    
LRM005             ,RSTR_TRD_90_DY_IND                                          
LRM005             ,REG_T_IND                                                   
LRM005             ,ADOPT_AGRMT_IND                                             
LRM005             ,RR_ORGNL_CD                                                 
LRM006             ,CVRSN_ACCT_NBR                                              
DJ0003             ,AUCTION_RT_IND                                              
LRM010             ,PENNY_STK_IND                                               
LRM010             ,GEO_CD                                                      
LRM010             ,FOREIGN_FEE_IND                                             
LRM010             ,FOREIGN_FEE_AMT                                             
LRM011             ,PEND_DVDND_DB_AMT                                           
LRM011             ,NTWRK_LVL4_FND_IND                                          
LRM013             ,PAPER_FEE_AMT                                               
                FROM VTRNFR                                             CAT712  
                WHERE                                                   CAT712  
ET0001            (CLIENT_NBR = :WS-CLIENT-NBR)                         CAT712  
ET0001                    AND                                           CAT712  
                  (  (STTS_CD  = '140'                                  CAT712  
                          AND DAYS_STTS_QTY > 1)                        CAT712  
                  OR (STTS_CD  > '399')                                 CAT712  
                  OR ( STTLM_DT <= :WS-PROC-DAY                         CAT712  
                      AND STTS_CD > '300'      )                        CAT712  
                  OR ( PRCS_DT > '0001-01-01'                           CAT712  
                   AND PRCS_DT < :WS-AGED-PROC-DAY ) )                  CAT712  
                ORDER BY CLIENT_NBR, ACAT_CONTROL_NBR                   CAT712  
           END-EXEC.                                                    CAT712  
      *                                                                 CAT712  
           EXEC SQL                                                     CAT712  
                DECLARE AST_CSR CURSOR WITH HOLD FOR                    CAT712  
                SELECT                                                  CAT712  
                     CLIENT_NBR                                         CAT712  
                    ,ACAT_CONTROL_NBR                                   CAT712  
                    ,ASSET_SEQ_NBR                                      CAT712  
                    ,CONTROL_NBR_STS_CD                                 CAT712  
                    ,DLVR_NBR_STTS_CD                                   CAT712  
                    ,RCV_NBR_STTS_CD                                    CAT712  
                    ,SBMTG_PRTCP_NBR                                    CAT712  
                    ,SBMT_PRT_NR_STS_CD                                 CAT712  
                    ,AST_SEQ_NBR_STS_CD                                 CAT712  
                    ,SYS_ACT_CD                                         CAT712  
                    ,SYS_RJCT_RSN_CD                                    CAT712  
                    ,TRANS_TYPE_CD                                      CAT712  
                    ,TRANS_TYPE_STTS_CD                                 CAT712  
                    ,PHSCL_SEQ_NBR                                      CAT712  
                    ,PHSCL_SEQ_STTS_CD                                  CAT712  
                    ,LGCL_SEQ_NBR                                       CAT712  
                    ,LGCL_SEQ_NR_STS_CD                                 CAT712  
                    ,ASSET_PRC_CTGY_CD                                  CAT712  
                    ,AST_PRC_CTG_STS_CD                                 CAT712  
                    ,STTLM_LCTN_CD                                      CAT712  
                    ,STTLM_LCTN_STTS_CD                                 CAT712  
                    ,STTLM_RSN_CD                                       CAT712  
                    ,STTLM_RSN_STTS_CD                                  CAT712  
                    ,ISIN_CNTRY_CD                                      CAT712  
                    ,ISIN_CNTRY_STTS_CD                                 CAT712  
                    ,ISIN_SEC_ISSUE_CD                                  CAT712  
                    ,ISIN_SEC_IS_STS_CD                                 CAT712  
                    ,ISIN_SEC_CDG_CD                                    CAT712  
                    ,ISIN_SEC_CD_STS_CD                                 CAT712  
                    ,ASSET_DESC_TXT                                     CAT712  
                    ,ASSET_DESC_STTS_CD                                 CAT712  
                    ,ASSET_RQST_QTY_CD                                  CAT712  
                    ,ASSET_RQST_STS_CD                                  CAT712  
                    ,AST_RQST_TRANS_CD                                  CAT712  
                    ,AST_RQ_TRAN_STS_CD                                 CAT712  
                    ,ASSET_QTY                                          CAT712  
                    ,ASSET_QTY_STTS_CD                                  CAT712  
                    ,ASSET_PCT                                          CAT712  
                    ,ASSET_PCT_STTS_CD                                  CAT712  
                    ,PSTN_CD                                            CAT712  
                    ,PSTN_CD_STTS_CD                                    CAT712  
                    ,ISO_CRNCY_CD                                       CAT712  
                    ,ISO_CRNCY_STTS_CD                                  CAT712  
                    ,ASSET_AMT                                          CAT712  
                    ,ASSET_AMT_STTS_CD                                  CAT712  
                    ,BEARER_BOND_CD                                     CAT712  
                    ,BEARER_BND_STTS_CD                                 CAT712  
                    ,CSH_MGN_SHRT_CD                                    CAT712  
                    ,CSH_MRG_SHT_STS_CD                                 CAT712  
                    ,WHI_CD                                             CAT712  
                    ,WHI_STTS_CD                                        CAT712  
                    ,TRNFR_TYPE_RSN_CD                                  CAT712  
                    ,TRN_TYP_RSN_STS_CD                                 CAT712  
                    ,MBS_SERIAL_NBR                                     CAT712  
                    ,MBS_SERIAL_STTS_CD                                 CAT712  
                    ,ASSET_CMNT_TXT                                     CAT712  
                    ,ASSET_CMNT_STTS_CD                                 CAT712  
                    ,NSCC_ACK_IND                                       CAT712  
                    ,NSCC_PEND_CD                                       CAT712  
                    ,FAIL_SENT_CAGE_IND                                 CAT712  
                    ,FAIL_OPEN_CAGE_IND                                 CAT712  
                    ,NSCC_NON_ADP_IND                                   CAT712  
                    ,TRANS_RFRN_ID_CD                                   CAT712  
                    ,TRANS_RFRN_STTS_CD                                 CAT712  
                    ,OPTN_CTGY_CD                                       CAT712  
                    ,OPTN_CTGY_STTS_CD                                  CAT712  
                    ,RCRD_LNGTH_STTS_CD                                 CAT712  
                    ,RCRD_STTS_CD                                       CAT712  
                    ,ISIN_SEC_EXCPT_IND                                 CAT712  
                    ,CRT_TMSTP                                          CAT712  
                    ,UPDT_TMSTP                                         CAT712  
                    ,CICS_TERM_ID_CD                                    CAT712  
                    ,PRGM_NM                                            CAT712  
                    ,SECURITY_ADP_NBR                                   CAT712  
                    ,RCL_SENT_NSCC_IND                                  CAT712  
                    ,FRV_SENT_NSCC_IND                                  CAT712  
                    ,TRNFR_TYPE_CD                                      CAT712  
                    ,TRNFR_TYPE_STTS_CD                                 CAT712  
                    ,RESTRICTED_IND                                     CAT712  
                    ,CAGE_TAG_NBR                                       CAT712  
                    ,SCRTY_866_NBR                                              
                    ,ASSET_866_QTY                                              
DJ0003              ,AUCTION_RT_IND                                             
LRM010              ,FOREIGN_FEE_IND                                            
LRM012              ,CRNCY_CD                                                   
                FROM VASSET                                             CAT712  
                WHERE                                                   CAT712  
                     CLIENT_NBR = :WS-CLIENT-NBR                        CAT712  
                 AND ACAT_CONTROL_NBR = :WS-ACAT-CNTL-NBR               CAT712  
                ORDER BY ASSET_SEQ_NBR                                  CAT712  
           END-EXEC.                                                    CAT712  
      *                                                                 CAT712  
           EXEC SQL                                                     CAT712  
                DECLARE OPTION_CSR CURSOR WITH HOLD FOR                 CAT712  
                SELECT                                                  CAT712  
                     CLIENT_NBR                                         CAT712  
                    ,ACAT_CONTROL_NBR                                   CAT712  
                    ,ASSET_SEQ_NBR                                      CAT712  
                    ,BS_CD                                              CAT712  
                    ,BS_STTS_CD                                         CAT712  
                    ,PTCL_CD                                            CAT712  
                    ,PTCL_STTS_CD                                       CAT712  
                    ,OPTN_OPN_CLSD_CD                                   CAT712  
                    ,OPT_OPN_CLS_STS_CD                                 CAT712  
                    ,SYM_CD                                             CAT712  
                    ,SYM_STTS_CD                                        CAT712  
                    ,EXPTN_DT                                           CAT712  
                    ,STPRC_INTEGER_AMT                                  CAT712  
LRM008              ,STPRC_INTEGER2_AMT                                 CAT712  
                    ,STPRC_INTR_STTS_CD                                 CAT712  
                    ,STPRC_FRCTN_AMT                                    CAT712  
                    ,STPRC_FRCT_STTS_CD                                 CAT712  
                    ,DLVR_OCC_NBR                                       CAT712  
                    ,OPTN_ACCT_TYPE_CD                                  CAT712  
                    ,OPT_ACT_TYP_STS_CD                                 CAT712  
                    ,ACCT_SUB_CD                                        CAT712  
                    ,ACCT_SUB_STTS_CD                                   CAT712  
                    ,OPTN_CMNT_TXT                                      CAT712  
                    ,OPTN_CMNT_STTS_CD                                  CAT712  
                    ,OPTN_EXPTN_DT_CD                                   CAT712  
                    ,OPT_OCC_DLV_STS_CD                                 CAT712  
                    ,ACCT_TYPE_MSMT_IND                                 CAT712  
                    ,CRT_TMSTP                                          CAT712  
                    ,UPDT_TMSTP                                         CAT712  
                    ,PRGM_NM                                            CAT712  
                    ,CICS_TERM_ID_CD                                    CAT712  
                FROM VOPTN                                              CAT712  
                WHERE                                                   CAT712  
                     CLIENT_NBR = :WS-CLIENT-NBR                        CAT712  
                 AND ACAT_CONTROL_NBR = :WS-ACAT-CNTL-NBR               CAT712  
           END-EXEC.                                                    CAT712  
      *                                                                 CAT712  
           EXEC SQL                                                     CAT712  
                DECLARE MF_CSR CURSOR WITH HOLD FOR                     CAT712  
                SELECT                                                  CAT712  
                     CLIENT_NBR                                         CAT712  
                    ,ACAT_CONTROL_NBR                                   CAT712  
                    ,ASSET_SEQ_NBR                                      CAT712  
                    ,BK_PHSCL_SHR_CD                                    CAT712  
                    ,BK_PHSC_SHR_STS_CD                                 CAT712  
                    ,NTWRK_CNTL_CD                                      CAT712  
                    ,NTWRK_CNTL_STTS_CD                                 CAT712  
                    ,ACCT_TYPE_CD                                       CAT712  
                    ,ACCT_TYPE_STTS_CD                                  CAT712  
                    ,DVDND_CD                                           CAT712  
                    ,DVDND_STTS_CD                                      CAT712  
                    ,DVDND_PAYEE_CD                                     CAT712  
                    ,DVDND_PYE_STTS_CD                                  CAT712  
                    ,LTCG_CD                                            CAT712  
                    ,BRKR_EXCTG_NBR                                     CAT712  
                    ,BRKR_EXCTG_STTS_CD                                 CAT712  
                    ,STCG_CD                                            CAT712  
                    ,MF_FULL_PRTL_CD                                    CAT712  
                    ,MF_FUL_PRTL_STS_CD                                 CAT712  
                    ,RGSTN_CD                                           CAT712  
                    ,FNBR                                               CAT712  
                    ,FND_ACT_NBR_STS_CD                                 CAT712  
                    ,DSTBN_SIDE_CD                                      CAT712  
                    ,PRCS_DT                                            CAT712  
                    ,CRT_TMSTP                                          CAT712  
                    ,UPDT_TMSTP                                         CAT712  
                    ,CICS_TERM_ID_CD                                    CAT712  
                    ,PRGM_NM                                            CAT712  
                FROM VMF                                                CAT712  
                WHERE                                                   CAT712  
                     CLIENT_NBR = :WS-CLIENT-NBR                        CAT712  
                 AND ACAT_CONTROL_NBR = :WS-ACAT-CNTL-NBR               CAT712  
           END-EXEC.                                                    CAT712  
      *----------------------->                                         CAT712  
ET0001     MOVE SPACES TO WS-END-OF-TRANSFER-SW.                                
                                                                                
           EXEC SQL                                                     CAT712  
                OPEN TIF_CSR                                            CAT712  
           END-EXEC.                                                    CAT712  
      *                                                                 CAT712  
           PERFORM UNTIL END-OF-TRANSFER                                CAT712  
              EXEC SQL                                                  CAT712  
                   FETCH TIF_CSR                                        CAT712  
                   INTO                                                 CAT712  
                      :DCLVTRNFR.CLIENT-NBR                             CAT712  
                     ,:DCLVTRNFR.ACAT-CONTROL-NBR                       CAT712  
                     ,:DCLVTRNFR.SBMTG-PRTCP-NBR                        CAT712  
                     ,:DCLVTRNFR.SBMT-PRT-NR-STS-CD                     CAT712  
                     ,:DCLVTRNFR.CONTROL-NBR-STS-CD                     CAT712  
                     ,:DCLVTRNFR.DLVR-NBR                               CAT712  
                     ,:DCLVTRNFR.DLVR-NBR-STTS-CD                       CAT712  
                     ,:DCLVTRNFR.ACCT-DLVR-NBR                          CAT712  
                     ,:DCLVTRNFR.ACCT-DLVR-STTS-CD                      CAT712  
                     ,:DCLVTRNFR.RCV-NBR                                CAT712  
                     ,:DCLVTRNFR.RCV-NBR-STTS-CD                        CAT712  
                     ,:DCLVTRNFR.ACCT-RCV-NBR                           CAT712  
                     ,:DCLVTRNFR.ACCT-RCV-STTS-CD                       CAT712  
                     ,:DCLVTRNFR.TRNFR-TYPE-CD                          CAT712  
                     ,:DCLVTRNFR.TRNFR-TYPE-STTS-CD                     CAT712  
                     ,:DCLVTRNFR.TRANS-TYPE-CD                          CAT712  
                     ,:DCLVTRNFR.TRANS-TYPE-STTS-CD                     CAT712  
                     ,:DCLVTRNFR.RCV-CUST-NM                            CAT712  
                     ,:DCLVTRNFR.RCV-CUST-NM-STS-CD                     CAT712  
                     ,:DCLVTRNFR.RCV-SS-PRIM-NBR                        CAT712  
                     ,:DCLVTRNFR.RCV-SS-PRIM-STS-CD                     CAT712  
                     ,:DCLVTRNFR.RCV-SS-SCNDY-NBR                       CAT712  
                     ,:DCLVTRNFR.RCV-SS-SCDY-STS-CD                     CAT712  
                     ,:DCLVTRNFR.RCV-ACCT-TYPE-CD                       CAT712  
                     ,:DCLVTRNFR.RCV-ACT-TYP-STS-CD                     CAT712  
                     ,:DCLVTRNFR.RCV-OCC-BRKR-NBR                       CAT712  
                     ,:DCLVTRNFR.RCV-OCC-STTS-CD                        CAT712  
                     ,:DCLVTRNFR.RCV-CRSPN-NBR                          CAT712  
                     ,:DCLVTRNFR.RCV-CRSPN-STTS-CD                      CAT712  
                     ,:DCLVTRNFR.ACAT-CNTL-ASTD-NBR                     CAT712  
                     ,:DCLVTRNFR.CNTL-ASTD-STTS-CD                      CAT712  
                     ,:DCLVTRNFR.CMNT-TXT                               CAT712  
                     ,:DCLVTRNFR.CMNT-STTS-CD                           CAT712  
                     ,:DCLVTRNFR.PRCS-DT                                CAT712  
                     ,:DCLVTRNFR.STTS-CD                                CAT712  
                     ,:DCLVTRNFR.STTLM-TM-CD                            CAT712  
                     ,:DCLVTRNFR.VAL-FREE-CD                            CAT712  
                     ,:DCLVTRNFR.TRANS-RFRN-ID-CD                       CAT712  
                     ,:DCLVTRNFR.TRANS-RFRN-STTS-CD                     CAT712  
                     ,:DCLVTRNFR.DB-CR-CD                               CAT712  
                     ,:DCLVTRNFR.DSTBN-SIDE-CD                          CAT712  
                     ,:DCLVTRNFR.SYS-ACT-CD                             CAT712  
                     ,:DCLVTRNFR.SYS-RJCT-RSN-CD                        CAT712  
                     ,:DCLVTRNFR.TRNFR-TYPE-RJC1-CD                     CAT712  
                     ,:DCLVTRNFR.TRNFR-TYPE-RJC2-CD                     CAT712  
                     ,:DCLVTRNFR.TRNFR-TYPE-RJCT-CD                     CAT712  
                     ,:DCLVTRNFR.TRN-TYP-RJC-STS-CD                     CAT712  
                     ,:DCLVTRNFR.PHSCL-SEQ-NBR                          CAT712  
                     ,:DCLVTRNFR.PHSCL-SEQ-STTS-CD                      CAT712  
                     ,:DCLVTRNFR.LGCL-SEQ-NBR                           CAT712  
                     ,:DCLVTRNFR.LGCL-SEQ-NR-STS-CD                     CAT712  
                     ,:DCLVTRNFR.RR-CD                                  CAT712  
                     ,:DCLVTRNFR.BRANCH-CD                              CAT712  
                     ,:DCLVTRNFR.DVDND-NAA-CD                           CAT712  
                     ,:DCLVTRNFR.SELL-INSTN-NAA-CD                      CAT712  
                     ,:DCLVTRNFR.CASH-SWEEP-NAA-CD                      CAT712  
                     ,:DCLVTRNFR.PRTCP-CONTRA-CD                        CAT712  
                     ,:DCLVTRNFR.ACM-HOLDER-NAA-CD                      CAT712  
                     ,:DCLVTRNFR.ACCT-ACTIVITY-IND                      CAT712  
                     ,:DCLVTRNFR.ACCT-ORDERS-IND                        CAT712  
                     ,:DCLVTRNFR.ACCT-RJCT-RSBM-IND                     CAT712  
                     ,:DCLVTRNFR.ACCT-DB-BAL-T1-IND                     CAT712  
                     ,:DCLVTRNFR.ACCT-MRGN-DB-IND                       CAT712  
                     ,:DCLVTRNFR.ACCT-SHRT-PSTN-IND                     CAT712  
                     ,:DCLVTRNFR.ACCT-SEC-RSTRD-IND                     CAT712  
                     ,:DCLVTRNFR.ACCT-AST-EXCS-IND                      CAT712  
                     ,:DCLVTRNFR.ACCT-OPTN-PSTN-IND                     CAT712  
                     ,:DCLVTRNFR.ACCT-LTD-PRTNR-IND                     CAT712  
                     ,:DCLVTRNFR.ACCT-TIN-MSMTH-IND                     CAT712  
                     ,:DCLVTRNFR.ACCT-DPLCT-TRN-IND                     CAT712  
                     ,:DCLVTRNFR.ACCT-CUST-70-IND                       CAT712  
                     ,:DCLVTRNFR.ACCT-QULFD-PLN-IND                     CAT712  
                     ,:DCLVTRNFR.ACCT-MNGD-IND                          CAT712  
                     ,:DCLVTRNFR.ACCT-PRVT-RNG-IND                      CAT712  
                     ,:DCLVTRNFR.ACCT-BRKR-TIF-IND                      CAT712  
                     ,:DCLVTRNFR.NSCC-NON-ADP-IND                       CAT712  
                     ,:DCLVTRNFR.CYCLE-CD                               CAT712  
                     ,:DCLVTRNFR.DAYS-STTS-QTY                          CAT712  
                     ,:DCLVTRNFR.STTLM-DT                               CAT712  
                     ,:DCLVTRNFR.ACCT-NA-UPDT-IND                       CAT712  
                     ,:DCLVTRNFR.ACCT-TRNFR-FEE-AMT                     CAT712  
                     ,:DCLVTRNFR.ACCT-IRA-TRMNT-AMT                     CAT712  
                     ,:DCLVTRNFR.ACCT-IRA-MAINT-AMT                     CAT712  
                     ,:DCLVTRNFR.ACCT-DLRV-PRGR-IND                     CAT712  
                     ,:DCLVTRNFR.ACCT-CD                                CAT712  
                     ,:DCLVTRNFR.STTLM-ASCTD-DT                         CAT712  
                     ,:DCLVTRNFR.STTLM-ASCTD-STS-CD                     CAT712  
                     ,:DCLVTRNFR.RCRD-LNGTH-STTS-CD                     CAT712  
                     ,:DCLVTRNFR.RCRD-STTS-CD                           CAT712  
                     ,:DCLVTRNFR.NSCC-PEND-CD                           CAT712  
                     ,:DCLVTRNFR.NSCC-ACK-IND                           CAT712  
                     ,:DCLVTRNFR.CICS-TERM-ID-CD                        CAT712  
                     ,:DCLVTRNFR.PRGM-NM                                CAT712  
                     ,:DCLVTRNFR.CRT-TMSTP                              CAT712  
                     ,:DCLVTRNFR.UPDT-TMSTP                             CAT712  
                     ,:DCLVTRNFR.ACCT-EQUITY-AMT                        CAT712  
LRM004               ,:DCLVTRNFR.FRV-MFC-CMPLT-IND                              
LRM004               ,:DCLVTRNFR.ACCT-FRZN-IND                                  
LRM004               ,:DCLVTRNFR.BRANCH-ALTNT-CD                                
LRM005               ,:DCLVTRNFR.GIFT-IND                                       
LRM005               ,:DCLVTRNFR.RSTR-TRD-90-DY-IND                             
LRM005               ,:DCLVTRNFR.REG-T-IND                                      
LRM005               ,:DCLVTRNFR.ADOPT-AGRMT-IND                                
LRM005               ,:DCLVTRNFR.RR-ORGNL-CD                                    
LRM006               ,:DCLVTRNFR.CVRSN-ACCT-NBR                                 
DJ0003               ,:DCLVTRNFR.AUCTION-RT-IND                                 
LRM008               ,:DCLVTRNFR.PENNY-STK-IND                                  
LRM009               ,:DCLVTRNFR.GEO-CD                                         
LRM010               ,:DCLVTRNFR.FOREIGN-FEE-IND                                
LRM010               ,:DCLVTRNFR.FOREIGN-FEE-AMT                                
LRM011               ,:DCLVTRNFR.PEND-DVDND-DB-AMT                              
LRM011               ,:DCLVTRNFR.NTWRK-LVL4-FND-IND                             
LRM013               ,:DCLVTRNFR.PAPER-FEE-AMT                                  
              END-EXEC                                                  CAT712  
              EVALUATE SQLCODE                                          CAT712  
                  WHEN +0                                               CAT712  
                         MOVE CLIENT-NBR OF DCLVTRNFR TO WS-CLIENT-NBR  CAT712  
                         MOVE ACAT-CONTROL-NBR OF DCLVTRNFR TO          CAT712  
                              WS-ACAT-CNTL-NBR                          CAT712  
DJ0002                IF (TRNFR-TYPE-CD OF DCLVTRNFR = 'PTR' OR 'PTF')  CAT712  
LRM001                   IF (STTS-CD OF DCLVTRNFR = '310'               CAT712  
LRM003                                  OR '400' OR '510' OR '600')     CAT712  
                            PERFORM PROCESS-DB2-TABLES  THRU            CAT712  
                                      PROCESS-DB2-TABLES-EXIT           CAT712  
DJ0002                   END-IF                                         CAT712  
DJ0002                ELSE                                              CAT712  
                            PERFORM PROCESS-DB2-TABLES  THRU            CAT712  
                                      PROCESS-DB2-TABLES-EXIT           CAT712  
                      END-IF                                            CAT712  
                  WHEN  +100                                            CAT712  
                    SET END-OF-TRANSFER TO TRUE                         CAT712  
                  WHEN OTHER                                            CAT712  
                    DISPLAY 'TIF_CSR FETCH ERROR'                       CAT712  
                    PERFORM SQL-ERROR-ROUTINE                           CAT712  
              END-EVALUATE                                              CAT712  
           END-PERFORM.                                                 CAT712  
                                                                        CAT712  
           EXEC SQL                                                     CAT712  
                CLOSE TIF_CSR                                           CAT712  
           END-EXEC.                                                    CAT712  
                                                                        CAT712  
       GET-TIF-EXIT.                                                    CAT712  
           EXIT.                                                        CAT712  
      /                                                                 CAT712  
       PROCESS-DB2-TABLES.                                              CAT712  
           PERFORM INSERT-VTRNHSTY-ROW.                                 CAT712  
           IF VTRNHSTY-ROW-INSERTED                                     CAT712  
              PERFORM FETCH-ASSET  THRU FETCH-ASSET-EXIT                CAT712  
              PERFORM FETCH-OPTION THRU FETCH-OPTION-EXIT               CAT712  
              PERFORM FETCH-MF     THRU FETCH-MF-EXIT                   CAT712  
           END-IF.                                                      CAT712  
                                                                        CAT712  
           IF VTRNHSTY-ROW-INSERTED   OR                                CAT712  
              VASTHSTY-ROW-INSERTED                                     CAT712  
              PERFORM DELETE-VTRNFR                                     CAT712  
           END-IF.                                                      CAT712  
                                                                        CAT712  
           IF WS-VTRNFR-DLTE-COUNT = +5                                 CAT712  
              EXEC SQL COMMIT END-EXEC                                  CAT712  
              MOVE +0   TO  WS-VTRNFR-DLTE-COUNT                        CAT712  
LRM011        ADD 1 TO WS-COMMIT-CNT                                            
           END-IF.                                                      CAT712  
                                                                        CAT712  
DJ0002     IF (TRANS-TYPE-CD OF DCLVTRNFR = 'PTR' OR 'PTF')             CAT712  
LRM007     AND DSTBN-SIDE-CD OF DCLVTRNFR = 'D'                         CAT712  
LRM007     AND (STTS-CD OF DCLVTRNFR = '510' OR '600')                  CAT712  
LRM007        PERFORM DELETE-ACTIAST-RTN                                        
LRM007     END-IF.                                                              
                                                                                
       PROCESS-DB2-TABLES-EXIT.                                         CAT712  
           EXIT.                                                        CAT712  
      /                                                                 CAT712  
       FETCH-ASSET.                                                     CAT712  
           MOVE ' '     TO  END-OF-ASSET-SW.                            CAT712  
                                                                        CAT712  
           EXEC SQL                                                     CAT712  
                OPEN AST_CSR                                            CAT712  
           END-EXEC.                                                    CAT712  
      *                                                                 CAT712  
           IF SQLCODE NOT = +0                                          CAT712  
              DISPLAY 'ASSET OPEN ERROR ' SQLCODE                       CAT712  
                                                                        CAT712  
           ELSE                                                         CAT712  
            PERFORM UNTIL END-OF-ASSET                                  CAT712  
              EXEC SQL                                                  CAT712  
                   FETCH AST_CSR                                        CAT712  
                   INTO                                                 CAT712  
                   :DCLVASSET.CLIENT-NBR                                CAT712  
                  ,:DCLVASSET.ACAT-CONTROL-NBR                          CAT712  
                  ,:DCLVASSET.ASSET-SEQ-NBR                             CAT712  
                  ,:DCLVASSET.CONTROL-NBR-STS-CD                        CAT712  
                  ,:DCLVASSET.DLVR-NBR-STTS-CD                          CAT712  
                  ,:DCLVASSET.RCV-NBR-STTS-CD                           CAT712  
                  ,:DCLVASSET.SBMTG-PRTCP-NBR                           CAT712  
                  ,:DCLVASSET.SBMT-PRT-NR-STS-CD                        CAT712  
                  ,:DCLVASSET.AST-SEQ-NBR-STS-CD                        CAT712  
                  ,:DCLVASSET.SYS-ACT-CD                                CAT712  
                  ,:DCLVASSET.SYS-RJCT-RSN-CD                           CAT712  
                  ,:DCLVASSET.TRANS-TYPE-CD                             CAT712  
                  ,:DCLVASSET.TRANS-TYPE-STTS-CD                        CAT712  
                  ,:DCLVASSET.PHSCL-SEQ-NBR                             CAT712  
                  ,:DCLVASSET.PHSCL-SEQ-STTS-CD                         CAT712  
                  ,:DCLVASSET.LGCL-SEQ-NBR                              CAT712  
                  ,:DCLVASSET.LGCL-SEQ-NR-STS-CD                        CAT712  
                  ,:DCLVASSET.ASSET-PRC-CTGY-CD                         CAT712  
                  ,:DCLVASSET.AST-PRC-CTG-STS-CD                        CAT712  
                  ,:DCLVASSET.STTLM-LCTN-CD                             CAT712  
                  ,:DCLVASSET.STTLM-LCTN-STTS-CD                        CAT712  
                  ,:DCLVASSET.STTLM-RSN-CD                              CAT712  
                  ,:DCLVASSET.STTLM-RSN-STTS-CD                         CAT712  
                  ,:DCLVASSET.ISIN-CNTRY-CD                             CAT712  
                  ,:DCLVASSET.ISIN-CNTRY-STTS-CD                        CAT712  
                  ,:DCLVASSET.ISIN-SEC-ISSUE-CD                         CAT712  
                  ,:DCLVASSET.ISIN-SEC-IS-STS-CD                        CAT712  
                  ,:DCLVASSET.ISIN-SEC-CDG-CD                           CAT712  
                  ,:DCLVASSET.ISIN-SEC-CD-STS-CD                        CAT712  
                  ,:DCLVASSET.ASSET-DESC-TXT                            CAT712  
                  ,:DCLVASSET.ASSET-DESC-STTS-CD                        CAT712  
                  ,:DCLVASSET.ASSET-RQST-QTY-CD                         CAT712  
                  ,:DCLVASSET.ASSET-RQST-STS-CD                         CAT712  
                  ,:DCLVASSET.AST-RQST-TRANS-CD                         CAT712  
                  ,:DCLVASSET.AST-RQ-TRAN-STS-CD                        CAT712  
                  ,:DCLVASSET.ASSET-QTY                                 CAT712  
                  ,:DCLVASSET.ASSET-QTY-STTS-CD                         CAT712  
                  ,:DCLVASSET.ASSET-PCT                                 CAT712  
                  ,:DCLVASSET.ASSET-PCT-STTS-CD                         CAT712  
                  ,:DCLVASSET.PSTN-CD                                   CAT712  
                  ,:DCLVASSET.PSTN-CD-STTS-CD                           CAT712  
                  ,:DCLVASSET.ISO-CRNCY-CD                              CAT712  
                  ,:DCLVASSET.ISO-CRNCY-STTS-CD                         CAT712  
                  ,:DCLVASSET.ASSET-AMT                                 CAT712  
                  ,:DCLVASSET.ASSET-AMT-STTS-CD                         CAT712  
                  ,:DCLVASSET.BEARER-BOND-CD                            CAT712  
                  ,:DCLVASSET.BEARER-BND-STTS-CD                        CAT712  
                  ,:DCLVASSET.CSH-MGN-SHRT-CD                           CAT712  
                  ,:DCLVASSET.CSH-MRG-SHT-STS-CD                        CAT712  
                  ,:DCLVASSET.WHI-CD                                    CAT712  
                  ,:DCLVASSET.WHI-STTS-CD                               CAT712  
                  ,:DCLVASSET.TRNFR-TYPE-RSN-CD                         CAT712  
                  ,:DCLVASSET.TRN-TYP-RSN-STS-CD                        CAT712  
                  ,:DCLVASSET.MBS-SERIAL-NBR                            CAT712  
                  ,:DCLVASSET.MBS-SERIAL-STTS-CD                        CAT712  
                  ,:DCLVASSET.ASSET-CMNT-TXT                            CAT712  
                  ,:DCLVASSET.ASSET-CMNT-STTS-CD                        CAT712  
                  ,:DCLVASSET.NSCC-ACK-IND                              CAT712  
                  ,:DCLVASSET.NSCC-PEND-CD                              CAT712  
                  ,:DCLVASSET.FAIL-SENT-CAGE-IND                        CAT712  
                  ,:DCLVASSET.FAIL-OPEN-CAGE-IND                        CAT712  
                  ,:DCLVASSET.NSCC-NON-ADP-IND                          CAT712  
                  ,:DCLVASSET.TRANS-RFRN-ID-CD                          CAT712  
                  ,:DCLVASSET.TRANS-RFRN-STTS-CD                        CAT712  
                  ,:DCLVASSET.OPTN-CTGY-CD                              CAT712  
                  ,:DCLVASSET.OPTN-CTGY-STTS-CD                         CAT712  
                  ,:DCLVASSET.RCRD-LNGTH-STTS-CD                        CAT712  
                  ,:DCLVASSET.RCRD-STTS-CD                              CAT712  
                  ,:DCLVASSET.ISIN-SEC-EXCPT-IND                        CAT712  
                  ,:DCLVASSET.CRT-TMSTP                                 CAT712  
                  ,:DCLVASSET.UPDT-TMSTP                                CAT712  
                  ,:DCLVASSET.CICS-TERM-ID-CD                           CAT712  
                  ,:DCLVASSET.PRGM-NM                                   CAT712  
                  ,:DCLVASSET.SECURITY-ADP-NBR                          CAT712  
                  ,:DCLVASSET.RCL-SENT-NSCC-IND                         CAT712  
                  ,:DCLVASSET.FRV-SENT-NSCC-IND                         CAT712  
                  ,:DCLVASSET.TRNFR-TYPE-CD                             CAT712  
                  ,:DCLVASSET.TRNFR-TYPE-STTS-CD                        CAT712  
                  ,:DCLVASSET.RESTRICTED-IND                            CAT712  
                  ,:DCLVASSET.CAGE-TAG-NBR                              CAT712  
                  ,:DCLVASSET.SCRTY-866-NBR                             CAT712  
                  ,:DCLVASSET.ASSET-866-QTY                             CAT712  
DJ0003            ,:DCLVASSET.AUCTION-RT-IND                            CAT712  
LRM010            ,:DCLVASSET.FOREIGN-FEE-IND                           CAT712  
LRM012            ,:DCLVASSET.CRNCY-CD                                  CAT712  
              END-EXEC                                                  CAT712  
              EVALUATE SQLCODE                                          CAT712  
                  WHEN +0                                               CAT712  
                         SET VASSET-FETCHED TO TRUE                     CAT712  
                         PERFORM INSERT-VASTHSTY-ROW THRU               CAT712  
                                 INSERT-VASTHSTY-ROW-EXIT               CAT712  
                  WHEN  +100                                            CAT712  
                    SET END-OF-ASSET TO TRUE                            CAT712  
                  WHEN OTHER                                            CAT712  
                    DISPLAY 'AST_CSR FETCH ERROR'                       CAT712  
                    PERFORM SQL-ERROR-ROUTINE                           CAT712  
              END-EVALUATE                                              CAT712  
            END-PERFORM.                                                CAT712  
           EXEC SQL                                                     CAT712  
                 CLOSE AST_CSR                                          CAT712  
           END-EXEC.                                                    CAT712  
                                                                        CAT712  
       FETCH-ASSET-EXIT.                                                CAT712  
           EXIT.                                                        CAT712  
      /                                                                 CAT712  
       INSERT-VASTHSTY-ROW.                                             CAT712  
           EXEC SQL                                                     CAT712  
                INSERT INTO VASTHSTY                                    CAT712  
                   ( CLIENT_NBR                                         CAT712  
                   , ACAT_CONTROL_NBR                                   CAT712  
                   , ASSET_SEQ_NBR                                      CAT712  
                   , CONTROL_NBR_STS_CD                                 CAT712  
                   , DLVR_NBR_STTS_CD                                   CAT712  
                   , RCV_NBR_STTS_CD                                    CAT712  
                   , SBMTG_PRTCP_NBR                                    CAT712  
                   , SBMT_PRT_NR_STS_CD                                 CAT712  
                   , AST_SEQ_NBR_STS_CD                                 CAT712  
                   , SYS_ACT_CD                                         CAT712  
                   , SYS_RJCT_RSN_CD                                    CAT712  
                   , TRANS_TYPE_CD                                      CAT712  
                   , TRANS_TYPE_STTS_CD                                 CAT712  
                   , PHSCL_SEQ_NBR                                      CAT712  
                   , PHSCL_SEQ_STTS_CD                                  CAT712  
                   , LGCL_SEQ_NBR                                       CAT712  
                   , LGCL_SEQ_NR_STS_CD                                 CAT712  
                   , ASSET_PRC_CTGY_CD                                  CAT712  
                   , AST_PRC_CTG_STS_CD                                 CAT712  
                   , STTLM_LCTN_CD                                      CAT712  
                   , STTLM_LCTN_STTS_CD                                 CAT712  
                   , STTLM_RSN_CD                                       CAT712  
                   , STTLM_RSN_STTS_CD                                  CAT712  
                   , ISIN_CNTRY_CD                                      CAT712  
                   , ISIN_CNTRY_STTS_CD                                 CAT712  
                   , ISIN_SEC_ISSUE_CD                                  CAT712  
                   , ISIN_SEC_IS_STS_CD                                 CAT712  
                   , ISIN_SEC_CDG_CD                                    CAT712  
                   , ISIN_SEC_CD_STS_CD                                 CAT712  
                   , ASSET_DESC_TXT                                     CAT712  
                   , ASSET_DESC_STTS_CD                                 CAT712  
                   , ASSET_RQST_QTY_CD                                  CAT712  
                   , ASSET_RQST_STS_CD                                  CAT712  
                   , AST_RQST_TRANS_CD                                  CAT712  
                   , AST_RQ_TRAN_STS_CD                                 CAT712  
                   , ASSET_QTY                                          CAT712  
                   , ASSET_QTY_STTS_CD                                  CAT712  
                   , ASSET_PCT                                          CAT712  
                   , ASSET_PCT_STTS_CD                                  CAT712  
                   , PSTN_CD                                            CAT712  
                   , PSTN_CD_STTS_CD                                    CAT712  
                   , ISO_CRNCY_CD                                       CAT712  
                   , ISO_CRNCY_STTS_CD                                  CAT712  
                   , ASSET_AMT                                          CAT712  
                   , ASSET_AMT_STTS_CD                                  CAT712  
                   , BEARER_BOND_CD                                     CAT712  
                   , BEARER_BND_STTS_CD                                 CAT712  
                   , CSH_MGN_SHRT_CD                                    CAT712  
                   , CSH_MRG_SHT_STS_CD                                 CAT712  
                   , WHI_CD                                             CAT712  
                   , WHI_STTS_CD                                        CAT712  
                   , TRNFR_TYPE_RSN_CD                                  CAT712  
                   , TRN_TYP_RSN_STS_CD                                 CAT712  
                   , MBS_SERIAL_NBR                                     CAT712  
                   , MBS_SERIAL_STTS_CD                                 CAT712  
                   , ASSET_CMNT_TXT                                     CAT712  
                   , ASSET_CMNT_STTS_CD                                 CAT712  
                   , NSCC_ACK_IND                                       CAT712  
                   , NSCC_PEND_CD                                       CAT712  
                   , FAIL_SENT_CAGE_IND                                 CAT712  
                   , FAIL_OPEN_CAGE_IND                                 CAT712  
                   , NSCC_NON_ADP_IND                                   CAT712  
                   , TRANS_RFRN_ID_CD                                   CAT712  
                   , TRANS_RFRN_STTS_CD                                 CAT712  
                   , OPTN_CTGY_CD                                       CAT712  
                   , OPTN_CTGY_STTS_CD                                  CAT712  
                   , RCRD_LNGTH_STTS_CD                                 CAT712  
                   , RCRD_STTS_CD                                       CAT712  
                   , ISIN_SEC_EXCPT_IND                                 CAT712  
                   , CRT_TMSTP                                          CAT712  
                   , UPDT_TMSTP                                         CAT712  
                   , CICS_TERM_ID_CD                                    CAT712  
                   , PRGM_NM                                            CAT712  
                   , SECURITY_ADP_NBR                                   CAT712  
                   , RCL_SENT_NSCC_IND                                  CAT712  
                   , FRV_SENT_NSCC_IND                                  CAT712  
                   , TRNFR_TYPE_CD                                      CAT712  
                   , CAGE_TAG_NBR                                       CAT712  
                   , SCRTY_866_NBR                                              
                   , ASSET_866_QTY                                              
DJ0003             , AUCTION_RT_IND                                     CAT712  
LRM010             , FOREIGN_FEE_IND                                            
LRM012             , CRNCY_CD)                                          CAT712  
                VALUES                                                  CAT712  
                   (:DCLVASSET.CLIENT-NBR                               CAT712  
                   ,:DCLVASSET.ACAT-CONTROL-NBR                         CAT712  
                   ,:DCLVASSET.ASSET-SEQ-NBR                            CAT712  
                   ,:DCLVASSET.CONTROL-NBR-STS-CD                       CAT712  
                   ,:DCLVASSET.DLVR-NBR-STTS-CD                         CAT712  
                   ,:DCLVASSET.RCV-NBR-STTS-CD                          CAT712  
                   ,:DCLVASSET.SBMTG-PRTCP-NBR                          CAT712  
                   ,:DCLVASSET.SBMT-PRT-NR-STS-CD                       CAT712  
                   ,:DCLVASSET.AST-SEQ-NBR-STS-CD                       CAT712  
                   ,:DCLVASSET.SYS-ACT-CD                               CAT712  
                   ,:DCLVASSET.SYS-RJCT-RSN-CD                          CAT712  
                   ,:DCLVASSET.TRANS-TYPE-CD                            CAT712  
                   ,:DCLVASSET.TRANS-TYPE-STTS-CD                       CAT712  
                   ,:DCLVASSET.PHSCL-SEQ-NBR                            CAT712  
                   ,:DCLVASSET.PHSCL-SEQ-STTS-CD                        CAT712  
                   ,:DCLVASSET.LGCL-SEQ-NBR                             CAT712  
                   ,:DCLVASSET.LGCL-SEQ-NR-STS-CD                       CAT712  
                   ,:DCLVASSET.ASSET-PRC-CTGY-CD                        CAT712  
                   ,:DCLVASSET.AST-PRC-CTG-STS-CD                       CAT712  
                   ,:DCLVASSET.STTLM-LCTN-CD                            CAT712  
                   ,:DCLVASSET.STTLM-LCTN-STTS-CD                       CAT712  
                   ,:DCLVASSET.STTLM-RSN-CD                             CAT712  
                   ,:DCLVASSET.STTLM-RSN-STTS-CD                        CAT712  
                   ,:DCLVASSET.ISIN-CNTRY-CD                            CAT712  
                   ,:DCLVASSET.ISIN-CNTRY-STTS-CD                       CAT712  
                   ,:DCLVASSET.ISIN-SEC-ISSUE-CD                        CAT712  
                   ,:DCLVASSET.ISIN-SEC-IS-STS-CD                       CAT712  
                   ,:DCLVASSET.ISIN-SEC-CDG-CD                          CAT712  
                   ,:DCLVASSET.ISIN-SEC-CD-STS-CD                       CAT712  
                   ,:DCLVASSET.ASSET-DESC-TXT                           CAT712  
                   ,:DCLVASSET.ASSET-DESC-STTS-CD                       CAT712  
                   ,:DCLVASSET.ASSET-RQST-QTY-CD                        CAT712  
                   ,:DCLVASSET.ASSET-RQST-STS-CD                        CAT712  
                   ,:DCLVASSET.AST-RQST-TRANS-CD                        CAT712  
                   ,:DCLVASSET.AST-RQ-TRAN-STS-CD                       CAT712  
                   ,:DCLVASSET.ASSET-QTY                                CAT712  
                   ,:DCLVASSET.ASSET-QTY-STTS-CD                        CAT712  
                   ,:DCLVASSET.ASSET-PCT                                CAT712  
                   ,:DCLVASSET.ASSET-PCT-STTS-CD                        CAT712  
                   ,:DCLVASSET.PSTN-CD                                  CAT712  
                   ,:DCLVASSET.PSTN-CD-STTS-CD                          CAT712  
                   ,:DCLVASSET.ISO-CRNCY-CD                             CAT712  
                   ,:DCLVASSET.ISO-CRNCY-STTS-CD                        CAT712  
                   ,:DCLVASSET.ASSET-AMT                                CAT712  
                   ,:DCLVASSET.ASSET-AMT-STTS-CD                        CAT712  
                   ,:DCLVASSET.BEARER-BOND-CD                           CAT712  
                   ,:DCLVASSET.BEARER-BND-STTS-CD                       CAT712  
                   ,:DCLVASSET.CSH-MGN-SHRT-CD                          CAT712  
                   ,:DCLVASSET.CSH-MRG-SHT-STS-CD                       CAT712  
                   ,:DCLVASSET.WHI-CD                                   CAT712  
                   ,:DCLVASSET.WHI-STTS-CD                              CAT712  
                   ,:DCLVASSET.TRNFR-TYPE-RSN-CD                        CAT712  
                   ,:DCLVASSET.TRN-TYP-RSN-STS-CD                       CAT712  
                   ,:DCLVASSET.MBS-SERIAL-NBR                           CAT712  
                   ,:DCLVASSET.MBS-SERIAL-STTS-CD                       CAT712  
                   ,:DCLVASSET.ASSET-CMNT-TXT                           CAT712  
                   ,:DCLVASSET.ASSET-CMNT-STTS-CD                       CAT712  
                   ,:DCLVASSET.NSCC-ACK-IND                             CAT712  
                   ,:DCLVASSET.NSCC-PEND-CD                             CAT712  
                   ,:DCLVASSET.FAIL-SENT-CAGE-IND                       CAT712  
                   ,:DCLVASSET.FAIL-OPEN-CAGE-IND                       CAT712  
                   ,:DCLVASSET.NSCC-NON-ADP-IND                         CAT712  
                   ,:DCLVASSET.TRANS-RFRN-ID-CD                         CAT712  
                   ,:DCLVASSET.TRANS-RFRN-STTS-CD                       CAT712  
                   ,:DCLVASSET.OPTN-CTGY-CD                             CAT712  
                   ,:DCLVASSET.OPTN-CTGY-STTS-CD                        CAT712  
                   ,:DCLVASSET.RCRD-LNGTH-STTS-CD                       CAT712  
                   ,:DCLVASSET.RCRD-STTS-CD                             CAT712  
                   ,:DCLVASSET.ISIN-SEC-EXCPT-IND                       CAT712  
                   ,:DCLVASSET.CRT-TMSTP                                CAT712  
                   ,:DCLVASSET.UPDT-TMSTP                               CAT712  
                   ,:DCLVASSET.CICS-TERM-ID-CD                          CAT712  
                   ,'CAT712'                                            CAT712  
                   ,:DCLVASSET.SECURITY-ADP-NBR                         CAT712  
                   ,:DCLVASSET.RCL-SENT-NSCC-IND                        CAT712  
                   ,:DCLVASSET.FRV-SENT-NSCC-IND                        CAT712  
                   ,:DCLVASSET.TRNFR-TYPE-CD                            CAT712  
                   ,:DCLVASSET.CAGE-TAG-NBR                             CAT712  
                   ,:DCLVASSET.SCRTY-866-NBR                            CAT712  
                   ,:DCLVASSET.ASSET-866-QTY                            CAT712  
DJ0003             ,:DCLVASSET.AUCTION-RT-IND                           CAT712  
LRM010             ,:DCLVASSET.FOREIGN-FEE-IND                          CAT712  
LRM012             ,:DCLVASSET.CRNCY-CD)                                CAT712  
           END-EXEC.                                                    CAT712  
                                                                        CAT712  
           EVALUATE SQLCODE                                             CAT712  
                WHEN +0                                                 CAT712  
                     ADD +1   TO  WS-VASTHSTY-ISRT-TOTAL                CAT712  
                     SET VASTHSTY-ROW-INSERTED TO TRUE                  CAT712  
                WHEN -803                                               CAT712  
                    DISPLAY ' DUPLICATE ROWS IN VASTHSTY'               CAT712  
                            ' CLIENT_NBR = ' WS-CLIENT-NBR,             CAT712  
                            ' ACAT_CONTROL_NBR = ' WS-ACAT-CNTL-NBR     CAT712  
                            ' ASSET_SEQ_NBR = ' ASSET-SEQ-NBR OF        CAT712  
                                                DCLVASSET               CAT712  
                    SET VASTHSTY-ROW-INSERTED TO TRUE                   CAT712  
                    MOVE +0     TO SQLCODE                              CAT712  
                WHEN OTHER                                              CAT712  
                    DISPLAY ' VASTHSTY INSERT ERROR'                    CAT712  
                    PERFORM SQL-ERROR-ROUTINE                           CAT712  
           END-EVALUATE.                                                CAT712  
                                                                        CAT712  
       INSERT-VASTHSTY-ROW-EXIT.                                        CAT712  
           EXIT.                                                        CAT712  
      /                                                                 CAT712  
       FETCH-OPTION.                                                    CAT712  
           MOVE ' '     TO  END-OF-OPTION-SW.                           CAT712  
                                                                        CAT712  
           EXEC SQL                                                     CAT712  
                OPEN OPTION_CSR                                         CAT712  
           END-EXEC.                                                    CAT712  
      *                                                                 CAT712  
           IF SQLCODE NOT = +0                                          CAT712  
              DISPLAY 'OPTION OPEN ERROR ' SQLCODE                      CAT712  
                                                                        CAT712  
           ELSE                                                         CAT712  
            PERFORM UNTIL END-OF-OPTION                                 CAT712  
              EXEC SQL                                                  CAT712  
                   FETCH OPTION_CSR                                     CAT712  
                   INTO                                                 CAT712  
                   :DCLVOPTN.CLIENT-NBR                                 CAT712  
                  ,:DCLVOPTN.ACAT-CONTROL-NBR                           CAT712  
                  ,:DCLVOPTN.ASSET-SEQ-NBR                              CAT712  
                  ,:DCLVOPTN.BS-CD                                      CAT712  
                  ,:DCLVOPTN.BS-STTS-CD                                 CAT712  
                  ,:DCLVOPTN.PTCL-CD                                    CAT712  
                  ,:DCLVOPTN.PTCL-STTS-CD                               CAT712  
                  ,:DCLVOPTN.OPTN-OPN-CLSD-CD                           CAT712  
                  ,:DCLVOPTN.OPT-OPN-CLS-STS-CD                         CAT712  
                  ,:DCLVOPTN.SYM-CD                                     CAT712  
                  ,:DCLVOPTN.SYM-STTS-CD                                CAT712  
                  ,:DCLVOPTN.EXPTN-DT                                   CAT712  
                  ,:DCLVOPTN.STPRC-INTEGER-AMT                          CAT712  
LRM008            ,:DCLVOPTN.STPRC-INTEGER2-AMT                         CAT712  
                  ,:DCLVOPTN.STPRC-INTR-STTS-CD                         CAT712  
                  ,:DCLVOPTN.STPRC-FRCTN-AMT                            CAT712  
                  ,:DCLVOPTN.STPRC-FRCT-STTS-CD                         CAT712  
                  ,:DCLVOPTN.DLVR-OCC-NBR                               CAT712  
                  ,:DCLVOPTN.OPTN-ACCT-TYPE-CD                          CAT712  
                  ,:DCLVOPTN.OPT-ACT-TYP-STS-CD                         CAT712  
                  ,:DCLVOPTN.ACCT-SUB-CD                                CAT712  
                  ,:DCLVOPTN.ACCT-SUB-STTS-CD                           CAT712  
                  ,:DCLVOPTN.OPTN-CMNT-TXT                              CAT712  
                  ,:DCLVOPTN.OPTN-CMNT-STTS-CD                          CAT712  
                  ,:DCLVOPTN.OPTN-EXPTN-DT-CD                           CAT712  
                  ,:DCLVOPTN.OPT-OCC-DLV-STS-CD                         CAT712  
                  ,:DCLVOPTN.ACCT-TYPE-MSMT-IND                         CAT712  
                  ,:DCLVOPTN.CRT-TMSTP                                  CAT712  
                  ,:DCLVOPTN.UPDT-TMSTP                                 CAT712  
                  ,:DCLVOPTN.PRGM-NM                                    CAT712  
                  ,:DCLVOPTN.CICS-TERM-ID-CD                            CAT712  
              END-EXEC                                                  CAT712  
              EVALUATE SQLCODE                                          CAT712  
                  WHEN +0                                               CAT712  
                         SET VOPTION-FETCHED TO TRUE                    CAT712  
                         PERFORM INSERT-VOPTHSTY-ROW THRU               CAT712  
                                 INSERT-VOPTHSTY-ROW-EXIT               CAT712  
                  WHEN  +100                                            CAT712  
                    SET END-OF-OPTION TO TRUE                           CAT712  
                  WHEN OTHER                                            CAT712  
                    DISPLAY 'OPTION_CSR FETCH ERROR'                    CAT712  
                    PERFORM SQL-ERROR-ROUTINE                           CAT712  
              END-EVALUATE                                              CAT712  
            END-PERFORM.                                                CAT712  
           EXEC SQL                                                     CAT712  
                 CLOSE OPTION_CSR                                       CAT712  
           END-EXEC.                                                    CAT712  
                                                                        CAT712  
       FETCH-OPTION-EXIT.                                               CAT712  
           EXIT.                                                        CAT712  
      /                                                                 CAT712  
       INSERT-VOPTHSTY-ROW.                                             CAT712  
           EXEC SQL                                                     CAT712  
                INSERT INTO VOPTHSTY                                    CAT712  
                   ( CLIENT_NBR                                         CAT712  
                    ,ACAT_CONTROL_NBR                                   CAT712  
                    ,ASSET_SEQ_NBR                                      CAT712  
                    ,BS_CD                                              CAT712  
                    ,BS_STTS_CD                                         CAT712  
                    ,PTCL_CD                                            CAT712  
                    ,PTCL_STTS_CD                                       CAT712  
                    ,OPTN_OPN_CLSD_CD                                   CAT712  
                    ,OPT_OPN_CLS_STS_CD                                 CAT712  
                    ,SYM_CD                                             CAT712  
                    ,SYM_STTS_CD                                        CAT712  
                    ,EXPTN_DT                                           CAT712  
                    ,STPRC_INTEGER_AMT                                  CAT712  
LRM008              ,STPRC_INTEGER2_AMT                                 CAT712  
                    ,STPRC_INTR_STTS_CD                                 CAT712  
                    ,STPRC_FRCTN_AMT                                    CAT712  
                    ,STPRC_FRCT_STTS_CD                                 CAT712  
                    ,DLVR_OCC_NBR                                       CAT712  
                    ,OPTN_ACCT_TYPE_CD                                  CAT712  
                    ,OPT_ACT_TYP_STS_CD                                 CAT712  
                    ,ACCT_SUB_CD                                        CAT712  
                    ,ACCT_SUB_STTS_CD                                   CAT712  
                    ,OPTN_CMNT_TXT                                      CAT712  
                    ,OPTN_CMNT_STTS_CD                                  CAT712  
                    ,OPTN_EXPTN_DT_CD                                   CAT712  
                    ,OPT_OCC_DLV_STS_CD                                 CAT712  
                    ,ACCT_TYPE_MSMT_IND                                 CAT712  
                    ,CRT_TMSTP                                          CAT712  
                    ,UPDT_TMSTP                                         CAT712  
                    ,PRGM_NM                                            CAT712  
                    ,CICS_TERM_ID_CD )                                  CAT712  
                VALUES                                                  CAT712  
                  (:DCLVOPTN.CLIENT-NBR                                 CAT712  
                  ,:DCLVOPTN.ACAT-CONTROL-NBR                           CAT712  
                  ,:DCLVOPTN.ASSET-SEQ-NBR                              CAT712  
                  ,:DCLVOPTN.BS-CD                                      CAT712  
                  ,:DCLVOPTN.BS-STTS-CD                                 CAT712  
                  ,:DCLVOPTN.PTCL-CD                                    CAT712  
                  ,:DCLVOPTN.PTCL-STTS-CD                               CAT712  
                  ,:DCLVOPTN.OPTN-OPN-CLSD-CD                           CAT712  
                  ,:DCLVOPTN.OPT-OPN-CLS-STS-CD                         CAT712  
                  ,:DCLVOPTN.SYM-CD                                     CAT712  
                  ,:DCLVOPTN.SYM-STTS-CD                                CAT712  
                  ,:DCLVOPTN.EXPTN-DT                                   CAT712  
                  ,:DCLVOPTN.STPRC-INTEGER-AMT                          CAT712  
LRM008            ,:DCLVOPTN.STPRC-INTEGER2-AMT                         CAT712  
                  ,:DCLVOPTN.STPRC-INTR-STTS-CD                         CAT712  
                  ,:DCLVOPTN.STPRC-FRCTN-AMT                            CAT712  
                  ,:DCLVOPTN.STPRC-FRCT-STTS-CD                         CAT712  
                  ,:DCLVOPTN.DLVR-OCC-NBR                               CAT712  
                  ,:DCLVOPTN.OPTN-ACCT-TYPE-CD                          CAT712  
                  ,:DCLVOPTN.OPT-ACT-TYP-STS-CD                         CAT712  
                  ,:DCLVOPTN.ACCT-SUB-CD                                CAT712  
                  ,:DCLVOPTN.ACCT-SUB-STTS-CD                           CAT712  
                  ,:DCLVOPTN.OPTN-CMNT-TXT                              CAT712  
                  ,:DCLVOPTN.OPTN-CMNT-STTS-CD                          CAT712  
                  ,:DCLVOPTN.OPTN-EXPTN-DT-CD                           CAT712  
                  ,:DCLVOPTN.OPT-OCC-DLV-STS-CD                         CAT712  
                  ,:DCLVOPTN.ACCT-TYPE-MSMT-IND                         CAT712  
                  ,:DCLVOPTN.CRT-TMSTP                                  CAT712  
                  ,:DCLVOPTN.UPDT-TMSTP                                 CAT712  
                  ,:DCLVOPTN.PRGM-NM                                    CAT712  
                  ,:DCLVOPTN.CICS-TERM-ID-CD)                           CAT712  
           END-EXEC.                                                    CAT712  
                                                                        CAT712  
           EVALUATE SQLCODE                                             CAT712  
                WHEN +0                                                 CAT712  
                     ADD +1   TO  WS-VOPTHSTY-ISRT-TOTAL                CAT712  
                     SET VOPTHSTY-ROW-INSERTED TO TRUE                  CAT712  
                WHEN -803                                               CAT712  
                    DISPLAY ' DUPLICATE ROWS IN VOPTHSTY'               CAT712  
                            ' CLIENT_NBR = ' WS-CLIENT-NBR,             CAT712  
                            ' ACAT_CONTROL_NBR = ' WS-ACAT-CNTL-NBR     CAT712  
                            ' ASSET_SEQ_NBR = ' ASSET-SEQ-NBR OF        CAT712  
                                                DCLVOPTN                CAT712  
                    SET VOPTHSTY-ROW-INSERTED TO TRUE                   CAT712  
                    MOVE +0     TO SQLCODE                              CAT712  
                WHEN OTHER                                              CAT712  
                    DISPLAY ' VOPTHSTY INSERT ERROR'                    CAT712  
                    PERFORM SQL-ERROR-ROUTINE                           CAT712  
           END-EVALUATE.                                                CAT712  
                                                                        CAT712  
       INSERT-VOPTHSTY-ROW-EXIT.                                        CAT712  
           EXIT.                                                        CAT712  
      /                                                                 CAT712  
       FETCH-MF.                                                        CAT712  
           MOVE ' '     TO  END-OF-MF-SW.                               CAT712  
                                                                        CAT712  
           EXEC SQL                                                     CAT712  
                OPEN MF_CSR                                             CAT712  
           END-EXEC.                                                    CAT712  
      *                                                                 CAT712  
           IF SQLCODE NOT = +0                                          CAT712  
              DISPLAY 'MF OPEN ERROR ' SQLCODE                          CAT712  
                                                                        CAT712  
           ELSE                                                         CAT712  
            PERFORM UNTIL END-OF-MF                                     CAT712  
              EXEC SQL                                                  CAT712  
                   FETCH MF_CSR                                         CAT712  
                   INTO                                                 CAT712  
                   :DCLVMF.CLIENT-NBR                                   CAT712  
                  ,:DCLVMF.ACAT-CONTROL-NBR                             CAT712  
                  ,:DCLVMF.ASSET-SEQ-NBR                                CAT712  
                  ,:DCLVMF.BK-PHSCL-SHR-CD                              CAT712  
                  ,:DCLVMF.BK-PHSC-SHR-STS-CD                           CAT712  
                  ,:DCLVMF.NTWRK-CNTL-CD                                CAT712  
                  ,:DCLVMF.NTWRK-CNTL-STTS-CD                           CAT712  
                  ,:DCLVMF.ACCT-TYPE-CD                                 CAT712  
                  ,:DCLVMF.ACCT-TYPE-STTS-CD                            CAT712  
                  ,:DCLVMF.DVDND-CD                                     CAT712  
                  ,:DCLVMF.DVDND-STTS-CD                                CAT712  
                  ,:DCLVMF.DVDND-PAYEE-CD                               CAT712  
                  ,:DCLVMF.DVDND-PYE-STTS-CD                            CAT712  
                  ,:DCLVMF.LTCG-CD                                      CAT712  
                  ,:DCLVMF.BRKR-EXCTG-NBR                               CAT712  
                  ,:DCLVMF.BRKR-EXCTG-STTS-CD                           CAT712  
                  ,:DCLVMF.STCG-CD                                      CAT712  
                  ,:DCLVMF.MF-FULL-PRTL-CD                              CAT712  
                  ,:DCLVMF.MF-FUL-PRTL-STS-CD                           CAT712  
                  ,:DCLVMF.RGSTN-CD                                     CAT712  
                  ,:DCLVMF.FNBR                                         CAT712  
                  ,:DCLVMF.FND-ACT-NBR-STS-CD                           CAT712  
                  ,:DCLVMF.DSTBN-SIDE-CD                                CAT712  
                  ,:DCLVMF.PRCS-DT                                      CAT712  
                  ,:DCLVMF.CRT-TMSTP                                    CAT712  
                  ,:DCLVMF.UPDT-TMSTP                                   CAT712  
                  ,:DCLVMF.CICS-TERM-ID-CD                              CAT712  
                  ,:DCLVMF.PRGM-NM                                      CAT712  
              END-EXEC                                                  CAT712  
              EVALUATE SQLCODE                                          CAT712  
                  WHEN +0                                               CAT712  
                         SET VMF-FETCHED TO TRUE                        CAT712  
                         PERFORM INSERT-VMFHSTY-ROW THRU                CAT712  
                                 INSERT-VMFHSTY-ROW-EXIT                CAT712  
                  WHEN  +100                                            CAT712  
                    SET END-OF-MF TO TRUE                               CAT712  
                  WHEN OTHER                                            CAT712  
                    DISPLAY 'MF_CSR FETCH ERROR'                        CAT712  
                    PERFORM SQL-ERROR-ROUTINE                           CAT712  
              END-EVALUATE                                              CAT712  
            END-PERFORM.                                                CAT712  
           EXEC SQL                                                     CAT712  
                 CLOSE MF_CSR                                           CAT712  
           END-EXEC.                                                    CAT712  
                                                                        CAT712  
       FETCH-MF-EXIT.                                                   CAT712  
           EXIT.                                                        CAT712  
      /                                                                 CAT712  
       INSERT-VMFHSTY-ROW.                                              CAT712  
           EXEC SQL                                                     CAT712  
                INSERT INTO VMFHSTY                                     CAT712  
                 ( CLIENT_NBR                                           CAT712  
                  ,ACAT_CONTROL_NBR                                     CAT712  
                  ,ASSET_SEQ_NBR                                        CAT712  
                  ,BK_PHSCL_SHR_CD                                      CAT712  
                  ,BK_PHSC_SHR_STS_CD                                   CAT712  
                  ,NTWRK_CNTL_CD                                        CAT712  
                  ,NTWRK_CNTL_STTS_CD                                   CAT712  
                  ,ACCT_TYPE_CD                                         CAT712  
                  ,ACCT_TYPE_STTS_CD                                    CAT712  
                  ,DVDND_CD                                             CAT712  
                  ,DVDND_STTS_CD                                        CAT712  
                  ,DVDND_PAYEE_CD                                       CAT712  
                  ,DVDND_PYE_STTS_CD                                    CAT712  
                  ,LTCG_CD                                              CAT712  
                  ,BRKR_EXCTG_NBR                                       CAT712  
                  ,BRKR_EXCTG_STTS_CD                                   CAT712  
                  ,STCG_CD                                              CAT712  
                  ,MF_FULL_PRTL_CD                                      CAT712  
                  ,MF_FUL_PRTL_STS_CD                                   CAT712  
                  ,RGSTN_CD                                             CAT712  
                  ,FNBR                                                 CAT712  
                  ,FND_ACT_NBR_STS_CD                                   CAT712  
                  ,DSTBN_SIDE_CD                                        CAT712  
                  ,PRCS_DT                                              CAT712  
                  ,CRT_TMSTP                                            CAT712  
                  ,UPDT_TMSTP                                           CAT712  
                  ,CICS_TERM_ID_CD                                      CAT712  
                  ,PRGM_NM )                                            CAT712  
                VALUES                                                  CAT712  
                  (:DCLVMF.CLIENT-NBR                                   CAT712  
                  ,:DCLVMF.ACAT-CONTROL-NBR                             CAT712  
                  ,:DCLVMF.ASSET-SEQ-NBR                                CAT712  
                  ,:DCLVMF.BK-PHSCL-SHR-CD                              CAT712  
                  ,:DCLVMF.BK-PHSC-SHR-STS-CD                           CAT712  
                  ,:DCLVMF.NTWRK-CNTL-CD                                CAT712  
                  ,:DCLVMF.NTWRK-CNTL-STTS-CD                           CAT712  
                  ,:DCLVMF.ACCT-TYPE-CD                                 CAT712  
                  ,:DCLVMF.ACCT-TYPE-STTS-CD                            CAT712  
                  ,:DCLVMF.DVDND-CD                                     CAT712  
                  ,:DCLVMF.DVDND-STTS-CD                                CAT712  
                  ,:DCLVMF.DVDND-PAYEE-CD                               CAT712  
                  ,:DCLVMF.DVDND-PYE-STTS-CD                            CAT712  
                  ,:DCLVMF.LTCG-CD                                      CAT712  
                  ,:DCLVMF.BRKR-EXCTG-NBR                               CAT712  
                  ,:DCLVMF.BRKR-EXCTG-STTS-CD                           CAT712  
                  ,:DCLVMF.STCG-CD                                      CAT712  
                  ,:DCLVMF.MF-FULL-PRTL-CD                              CAT712  
                  ,:DCLVMF.MF-FUL-PRTL-STS-CD                           CAT712  
                  ,:DCLVMF.RGSTN-CD                                     CAT712  
                  ,:DCLVMF.FNBR                                         CAT712  
                  ,:DCLVMF.FND-ACT-NBR-STS-CD                           CAT712  
                  ,:DCLVMF.DSTBN-SIDE-CD                                CAT712  
                  ,:DCLVMF.PRCS-DT                                      CAT712  
                  ,:DCLVMF.CRT-TMSTP                                    CAT712  
                  ,:DCLVMF.UPDT-TMSTP                                   CAT712  
                  ,:DCLVMF.CICS-TERM-ID-CD                              CAT712  
                  ,:DCLVMF.PRGM-NM )                                    CAT712  
           END-EXEC.                                                    CAT712  
                                                                        CAT712  
           EVALUATE SQLCODE                                             CAT712  
                WHEN +0                                                 CAT712  
                     ADD +1   TO  WS-VMFHSTY-ISRT-TOTAL                 CAT712  
                     SET VMFHSTY-ROW-INSERTED TO TRUE                   CAT712  
                WHEN -803                                               CAT712  
                    DISPLAY ' DUPLICATE ROWS IN VMFHSTY'                CAT712  
                            ' CLIENT_NBR = ' WS-CLIENT-NBR,             CAT712  
                            ' ACAT_CONTROL_NBR = ' WS-ACAT-CNTL-NBR     CAT712  
                            ' ASSET_SEQ_NBR = ' ASSET-SEQ-NBR OF        CAT712  
                                                DCLVMF                  CAT712  
                    SET VMFHSTY-ROW-INSERTED TO TRUE                    CAT712  
                    MOVE +0     TO SQLCODE                              CAT712  
                WHEN OTHER                                              CAT712  
                    DISPLAY ' VMFHSTY INSERT ERROR '                    CAT712  
                    PERFORM SQL-ERROR-ROUTINE                           CAT712  
           END-EVALUATE.                                                CAT712  
                                                                        CAT712  
       INSERT-VMFHSTY-ROW-EXIT.                                         CAT712  
           EXIT.                                                        CAT712  
      /                                                                 CAT712  
       INSERT-VTRNHSTY-ROW.                                             CAT712  
           INITIALIZE DCLVTRNHSTY.                                      CAT712  
      *    MOVE DCLVTRNFR TO DCLVTRNHSTY.                               CAT712  
           EXEC SQL                                                     CAT712  
                INSERT INTO VTRNHSTY                                    CAT712  
                   ( CLIENT_NBR                                         CAT712  
                   , ACAT_CONTROL_NBR                                   CAT712  
                   , SBMTG_PRTCP_NBR                                    CAT712  
                   , SBMT_PRT_NR_STS_CD                                 CAT712  
                   , CONTROL_NBR_STS_CD                                 CAT712  
                   , DLVR_NBR                                           CAT712  
                   , DLVR_NBR_STTS_CD                                   CAT712  
                   , ACCT_DLVR_NBR                                      CAT712  
                   , ACCT_DLVR_STTS_CD                                  CAT712  
                   , RCV_NBR                                            CAT712  
                   , RCV_NBR_STTS_CD                                    CAT712  
                   , ACCT_RCV_NBR                                       CAT712  
                   , ACCT_RCV_STTS_CD                                   CAT712  
                   , TRNFR_TYPE_CD                                      CAT712  
                   , TRNFR_TYPE_STTS_CD                                 CAT712  
                   , TRANS_TYPE_CD                                      CAT712  
                   , TRANS_TYPE_STTS_CD                                 CAT712  
                   , RCV_CUST_NM                                        CAT712  
                   , RCV_CUST_NM_STS_CD                                 CAT712  
                   , RCV_SS_PRIM_NBR                                    CAT712  
                   , RCV_SS_PRIM_STS_CD                                 CAT712  
                   , RCV_SS_SCNDY_NBR                                   CAT712  
                   , RCV_SS_SCDY_STS_CD                                 CAT712  
                   , RCV_ACCT_TYPE_CD                                   CAT712  
                   , RCV_ACT_TYP_STS_CD                                 CAT712  
                   , RCV_OCC_BRKR_NBR                                   CAT712  
                   , RCV_OCC_STTS_CD                                    CAT712  
                   , RCV_CRSPN_NBR                                      CAT712  
                   , RCV_CRSPN_STTS_CD                                  CAT712  
                   , ACAT_CNTL_ASTD_NBR                                 CAT712  
                   , CNTL_ASTD_STTS_CD                                  CAT712  
                   , CMNT_TXT                                           CAT712  
                   , CMNT_STTS_CD                                       CAT712  
                   , PRCS_DT                                            CAT712  
                   , STTS_CD                                            CAT712  
                   , STTLM_TM_CD                                        CAT712  
                   , VAL_FREE_CD                                        CAT712  
                   , TRANS_RFRN_ID_CD                                   CAT712  
                   , TRANS_RFRN_STTS_CD                                 CAT712  
                   , DB_CR_CD                                           CAT712  
                   , DSTBN_SIDE_CD                                      CAT712  
                   , SYS_ACT_CD                                         CAT712  
                   , SYS_RJCT_RSN_CD                                    CAT712  
                   , TRNFR_TYPE_RJC1_CD                                 CAT712  
                   , TRNFR_TYPE_RJC2_CD                                 CAT712  
                   , TRNFR_TYPE_RJCT_CD                                 CAT712  
                   , TRN_TYP_RJC_STS_CD                                 CAT712  
                   , PHSCL_SEQ_NBR                                      CAT712  
                   , PHSCL_SEQ_STTS_CD                                  CAT712  
                   , LGCL_SEQ_NBR                                       CAT712  
                   , LGCL_SEQ_NR_STS_CD                                 CAT712  
                   , RR_CD                                              CAT712  
                   , BRANCH_CD                                          CAT712  
                   , DVDND_NAA_CD                                       CAT712  
                   , SELL_INSTN_NAA_CD                                  CAT712  
                   , CASH_SWEEP_NAA_CD                                  CAT712  
                   , PRTCP_CONTRA_CD                                    CAT712  
                   , ACM_HOLDER_NAA_CD                                  CAT712  
                   , ACCT_ACTIVITY_IND                                  CAT712  
                   , ACCT_ORDERS_IND                                    CAT712  
                   , ACCT_RJCT_RSBM_IND                                 CAT712  
                   , ACCT_DB_BAL_T1_IND                                 CAT712  
                   , ACCT_MRGN_DB_IND                                   CAT712  
                   , ACCT_SHRT_PSTN_IND                                 CAT712  
                   , ACCT_SEC_RSTRD_IND                                 CAT712  
                   , ACCT_AST_EXCS_IND                                  CAT712  
                   , ACCT_OPTN_PSTN_IND                                 CAT712  
                   , ACCT_LTD_PRTNR_IND                                 CAT712  
                   , ACCT_TIN_MSMTH_IND                                 CAT712  
                   , ACCT_DPLCT_TRN_IND                                 CAT712  
                   , ACCT_CUST_70_IND                                   CAT712  
                   , ACCT_QULFD_PLN_IND                                 CAT712  
                   , ACCT_MNGD_IND                                      CAT712  
                   , ACCT_PRVT_RNG_IND                                  CAT712  
                   , ACCT_BRKR_TIF_IND                                  CAT712  
                   , NSCC_NON_ADP_IND                                   CAT712  
                   , CYCLE_CD                                           CAT712  
                   , DAYS_STTS_QTY                                      CAT712  
                   , STTLM_DT                                           CAT712  
                   , ACCT_NA_UPDT_IND                                   CAT712  
                   , ACCT_TRNFR_FEE_AMT                                 CAT712  
                   , ACCT_IRA_TRMNT_AMT                                 CAT712  
                   , ACCT_IRA_MAINT_AMT                                 CAT712  
                   , ACCT_DLRV_PRGR_IND                                 CAT712  
                   , ACCT_CD                                            CAT712  
                   , STTLM_ASCTD_DT                                     CAT712  
                   , STTLM_ASCTD_STS_CD                                 CAT712  
                   , RCRD_LNGTH_STTS_CD                                 CAT712  
                   , RCRD_STTS_CD                                       CAT712  
                   , NSCC_PEND_CD                                       CAT712  
                   , NSCC_ACK_IND                                       CAT712  
                   , CICS_TERM_ID_CD                                    CAT712  
                   , PRGM_NM                                            CAT712  
                   , CRT_TMSTP                                          CAT712  
                   , UPDT_TMSTP                                         CAT712  
                   , ACCT_EQUITY_AMT                                    CAT712  
LRM004             , FRV_MFC_CMPLT_IND                                          
LRM004             , ACCT_FRZN_IND                                              
LRM004             , BRANCH_ALTNT_CD                                            
LRM005             , GIFT_IND                                                   
LRM005             , RSTR_TRD_90_DY_IND                                         
LRM005             , REG_T_IND                                                  
LRM005             , ADOPT_AGRMT_IND                                            
LRM005             , RR_ORGNL_CD                                                
LRM006             , CVRSN_ACCT_NBR                                             
DJ0003             , AUCTION_RT_IND                                             
LRM008             , PENNY_STK_IND                                              
LRM009             , GEO_CD                                                     
LRM010             , FOREIGN_FEE_IND                                            
LRM010             , FOREIGN_FEE_AMT                                            
LRM011             , PEND_DVDND_DB_AMT                                          
LRM011             , NTWRK_LVL4_FND_IND                                         
LRM013             , PAPER_FEE_AMT)                                             
                VALUES                                                  CAT712  
                   (:DCLVTRNFR.CLIENT-NBR                               CAT712  
                   ,:DCLVTRNFR.ACAT-CONTROL-NBR                         CAT712  
                   ,:DCLVTRNFR.SBMTG-PRTCP-NBR                          CAT712  
                   ,:DCLVTRNFR.SBMT-PRT-NR-STS-CD                       CAT712  
                   ,:DCLVTRNFR.CONTROL-NBR-STS-CD                       CAT712  
                   ,:DCLVTRNFR.DLVR-NBR                                 CAT712  
                   ,:DCLVTRNFR.DLVR-NBR-STTS-CD                         CAT712  
                   ,:DCLVTRNFR.ACCT-DLVR-NBR                            CAT712  
                   ,:DCLVTRNFR.ACCT-DLVR-STTS-CD                        CAT712  
                   ,:DCLVTRNFR.RCV-NBR                                  CAT712  
                   ,:DCLVTRNFR.RCV-NBR-STTS-CD                          CAT712  
                   ,:DCLVTRNFR.ACCT-RCV-NBR                             CAT712  
                   ,:DCLVTRNFR.ACCT-RCV-STTS-CD                         CAT712  
                   ,:DCLVTRNFR.TRNFR-TYPE-CD                            CAT712  
                   ,:DCLVTRNFR.TRNFR-TYPE-STTS-CD                       CAT712  
                   ,:DCLVTRNFR.TRANS-TYPE-CD                            CAT712  
                   ,:DCLVTRNFR.TRANS-TYPE-STTS-CD                       CAT712  
                   ,:DCLVTRNFR.RCV-CUST-NM                              CAT712  
                   ,:DCLVTRNFR.RCV-CUST-NM-STS-CD                       CAT712  
                   ,:DCLVTRNFR.RCV-SS-PRIM-NBR                          CAT712  
                   ,:DCLVTRNFR.RCV-SS-PRIM-STS-CD                       CAT712  
                   ,:DCLVTRNFR.RCV-SS-SCNDY-NBR                         CAT712  
                   ,:DCLVTRNFR.RCV-SS-SCDY-STS-CD                       CAT712  
                   ,:DCLVTRNFR.RCV-ACCT-TYPE-CD                         CAT712  
                   ,:DCLVTRNFR.RCV-ACT-TYP-STS-CD                       CAT712  
                   ,:DCLVTRNFR.RCV-OCC-BRKR-NBR                         CAT712  
                   ,:DCLVTRNFR.RCV-OCC-STTS-CD                          CAT712  
                   ,:DCLVTRNFR.RCV-CRSPN-NBR                            CAT712  
                   ,:DCLVTRNFR.RCV-CRSPN-STTS-CD                        CAT712  
                   ,:DCLVTRNFR.ACAT-CNTL-ASTD-NBR                       CAT712  
                   ,:DCLVTRNFR.CNTL-ASTD-STTS-CD                        CAT712  
                   ,:DCLVTRNFR.CMNT-TXT                                 CAT712  
                   ,:DCLVTRNFR.CMNT-STTS-CD                             CAT712  
                   ,:DCLVTRNFR.PRCS-DT                                  CAT712  
                   ,:DCLVTRNFR.STTS-CD                                  CAT712  
                   ,:DCLVTRNFR.STTLM-TM-CD                              CAT712  
                   ,:DCLVTRNFR.VAL-FREE-CD                              CAT712  
                   ,:DCLVTRNFR.TRANS-RFRN-ID-CD                         CAT712  
                   ,:DCLVTRNFR.TRANS-RFRN-STTS-CD                       CAT712  
                   ,:DCLVTRNFR.DB-CR-CD                                 CAT712  
                   ,:DCLVTRNFR.DSTBN-SIDE-CD                            CAT712  
                   ,:DCLVTRNFR.SYS-ACT-CD                               CAT712  
                   ,:DCLVTRNFR.SYS-RJCT-RSN-CD                          CAT712  
                   ,:DCLVTRNFR.TRNFR-TYPE-RJC1-CD                       CAT712  
                   ,:DCLVTRNFR.TRNFR-TYPE-RJC2-CD                       CAT712  
                   ,:DCLVTRNFR.TRNFR-TYPE-RJCT-CD                       CAT712  
                   ,:DCLVTRNFR.TRN-TYP-RJC-STS-CD                       CAT712  
                   ,:DCLVTRNFR.PHSCL-SEQ-NBR                            CAT712  
                   ,:DCLVTRNFR.PHSCL-SEQ-STTS-CD                        CAT712  
                   ,:DCLVTRNFR.LGCL-SEQ-NBR                             CAT712  
                   ,:DCLVTRNFR.LGCL-SEQ-NR-STS-CD                       CAT712  
                   ,:DCLVTRNFR.RR-CD                                    CAT712  
                   ,:DCLVTRNFR.BRANCH-CD                                CAT712  
                   ,:DCLVTRNFR.DVDND-NAA-CD                             CAT712  
                   ,:DCLVTRNFR.SELL-INSTN-NAA-CD                        CAT712  
                   ,:DCLVTRNFR.CASH-SWEEP-NAA-CD                        CAT712  
                   ,:DCLVTRNFR.PRTCP-CONTRA-CD                          CAT712  
                   ,:DCLVTRNFR.ACM-HOLDER-NAA-CD                        CAT712  
                   ,:DCLVTRNFR.ACCT-ACTIVITY-IND                        CAT712  
                   ,:DCLVTRNFR.ACCT-ORDERS-IND                          CAT712  
                   ,:DCLVTRNFR.ACCT-RJCT-RSBM-IND                       CAT712  
                   ,:DCLVTRNFR.ACCT-DB-BAL-T1-IND                       CAT712  
                   ,:DCLVTRNFR.ACCT-MRGN-DB-IND                         CAT712  
                   ,:DCLVTRNFR.ACCT-SHRT-PSTN-IND                       CAT712  
                   ,:DCLVTRNFR.ACCT-SEC-RSTRD-IND                       CAT712  
                   ,:DCLVTRNFR.ACCT-AST-EXCS-IND                        CAT712  
                   ,:DCLVTRNFR.ACCT-OPTN-PSTN-IND                       CAT712  
                   ,:DCLVTRNFR.ACCT-LTD-PRTNR-IND                       CAT712  
                   ,:DCLVTRNFR.ACCT-TIN-MSMTH-IND                       CAT712  
                   ,:DCLVTRNFR.ACCT-DPLCT-TRN-IND                       CAT712  
                   ,:DCLVTRNFR.ACCT-CUST-70-IND                         CAT712  
                   ,:DCLVTRNFR.ACCT-QULFD-PLN-IND                       CAT712  
                   ,:DCLVTRNFR.ACCT-MNGD-IND                            CAT712  
                   ,:DCLVTRNFR.ACCT-PRVT-RNG-IND                        CAT712  
                   ,:DCLVTRNFR.ACCT-BRKR-TIF-IND                        CAT712  
                   ,:DCLVTRNFR.NSCC-NON-ADP-IND                         CAT712  
                   ,:DCLVTRNFR.CYCLE-CD                                 CAT712  
                   ,:DCLVTRNFR.DAYS-STTS-QTY                            CAT712  
                   ,:DCLVTRNFR.STTLM-DT                                 CAT712  
                   ,:DCLVTRNFR.ACCT-NA-UPDT-IND                         CAT712  
                   ,:DCLVTRNFR.ACCT-TRNFR-FEE-AMT                       CAT712  
                   ,:DCLVTRNFR.ACCT-IRA-TRMNT-AMT                       CAT712  
                   ,:DCLVTRNFR.ACCT-IRA-MAINT-AMT                       CAT712  
                   ,:DCLVTRNFR.ACCT-DLRV-PRGR-IND                       CAT712  
                   ,:DCLVTRNFR.ACCT-CD                                  CAT712  
                   ,:DCLVTRNFR.STTLM-ASCTD-DT                           CAT712  
                   ,:DCLVTRNFR.STTLM-ASCTD-STS-CD                       CAT712  
                   ,:DCLVTRNFR.RCRD-LNGTH-STTS-CD                       CAT712  
                   ,:DCLVTRNFR.RCRD-STTS-CD                             CAT712  
                   ,:DCLVTRNFR.NSCC-PEND-CD                             CAT712  
                   ,:DCLVTRNFR.NSCC-ACK-IND                             CAT712  
                   ,:DCLVTRNFR.CICS-TERM-ID-CD                          CAT712  
                   ,'CAT712'                                            CAT712  
                   ,:DCLVTRNFR.CRT-TMSTP                                CAT712  
                   ,:DCLVTRNFR.UPDT-TMSTP                               CAT712  
                   ,:DCLVTRNFR.ACCT-EQUITY-AMT                          CAT712  
LRM004             ,:DCLVTRNFR.FRV-MFC-CMPLT-IND                        CAT712  
LRM004             ,:DCLVTRNFR.ACCT-FRZN-IND                            CAT712  
LRM004             ,:DCLVTRNFR.BRANCH-ALTNT-CD                          CAT712  
LRM005             ,:DCLVTRNFR.GIFT-IND                                 CAT712  
LRM005             ,:DCLVTRNFR.RSTR-TRD-90-DY-IND                       CAT712  
LRM005             ,:DCLVTRNFR.REG-T-IND                                CAT712  
LRM005             ,:DCLVTRNFR.ADOPT-AGRMT-IND                          CAT712  
LRM005             ,:DCLVTRNFR.RR-ORGNL-CD                              CAT712  
LRM006             ,:DCLVTRNFR.CVRSN-ACCT-NBR                           CAT712  
DJ0003             ,:DCLVTRNFR.AUCTION-RT-IND                                   
LRM008             ,:DCLVTRNFR.PENNY-STK-IND                                    
LRM009             ,:DCLVTRNFR.GEO-CD                                           
LRM010             ,:DCLVTRNFR.FOREIGN-FEE-IND                                  
LRM010             ,:DCLVTRNFR.FOREIGN-FEE-AMT                                  
LRM011             ,:DCLVTRNFR.PEND-DVDND-DB-AMT                                
LRM011             ,:DCLVTRNFR.NTWRK-LVL4-FND-IND                               
LRM013             ,:DCLVTRNFR.PAPER-FEE-AMT)                                   
           END-EXEC.                                                    CAT712  
                                                                        CAT712  
           EVALUATE SQLCODE                                             CAT712  
                WHEN +0                                                 CAT712  
                     ADD +1   TO  WS-VTRNHSTY-ISRT-TOTAL                CAT712  
                     SET VTRNHSTY-ROW-INSERTED TO TRUE                  CAT712  
                WHEN -803                                               CAT712  
                    DISPLAY ' DUPLICATE ROWS IN VTRNHSTY'               CAT712  
                            ' CLIENT_NBR = ' WS-CLIENT-NBR,             CAT712  
                            ' ACAT_CONTROL_NBR = ' WS-ACAT-CNTL-NBR     CAT712  
                    SET VTRNHSTY-ROW-INSERTED TO TRUE                   CAT712  
                    MOVE +0     TO SQLCODE                              CAT712  
                WHEN OTHER                                              CAT712  
                    DISPLAY ' VTRNHSTY INSERT ERROR'                    CAT712  
                    PERFORM SQL-ERROR-ROUTINE                           CAT712  
           END-EVALUATE.                                                CAT712  
                                                                        CAT712  
       INSERT-VTRNHSTY-ROW-EXIT.                                        CAT712  
           EXIT.                                                        CAT712  
      /                                                                 CAT712  
       DELETE-VTRNFR.                                                   CAT712  
           EXEC SQL                                                     CAT712  
                DELETE                                                  CAT712  
                FROM VTRNFR                                             CAT712  
                WHERE CLIENT_NBR = :WS-CLIENT-NBR                       CAT712  
                 AND  ACAT_CONTROL_NBR = :WS-ACAT-CNTL-NBR              CAT712  
           END-EXEC.                                                    CAT712  
                                                                        CAT712  
           EVALUATE SQLCODE                                             CAT712  
                WHEN +0                                                 CAT712  
                     ADD +1   TO  WS-VTRNFR-DLTE-COUNT                  CAT712  
                     ADD +1   TO  WS-VTRNFR-DLTE-TOTAL                  CAT712  
                WHEN OTHER                                              CAT712  
                    DISPLAY 'DELETE VTRNFR ERROR'                               
                    PERFORM SQL-ERROR-ROUTINE                           CAT712  
           END-EVALUATE.                                                CAT712  
                                                                        CAT712  
       DELETE-VTRNFR-EXIT.                                              CAT712  
           EXIT.                                                        CAT712  
                                                                        CAT712  
LRM007 DELETE-ACTIAST-RTN.                                                      
LRM007     EXEC SQL                                                     CAT712  
LRM007          DELETE                                                  CAT712  
LRM007          FROM ACTIAST                                            CAT712  
LRM007          WHERE CLIENT_NBR = :WS-CLIENT-NBR                       CAT712  
LRM007           AND  ACAT_CONTROL_NBR = :WS-ACAT-CNTL-NBR              CAT712  
LRM007     END-EXEC.                                                    CAT712  
LRM007                                                                  CAT712  
LRM007     EVALUATE SQLCODE                                             CAT712  
LRM007          WHEN +0                                                 CAT712  
LRM007          WHEN +100                                               CAT712  
LRM007               CONTINUE                                                   
LRM007          WHEN OTHER                                              CAT712  
                    DISPLAY 'DELETE ACTIAST ERROR'                              
LRM007              PERFORM SQL-ERROR-ROUTINE                           CAT712  
LRM007     END-EVALUATE.                                                CAT712  
LRM007                                                                          
LRM007     MOVE SQLERRD(3)               TO W-SQLERRD-3                         
LRM007     ADD W-SQLERRD-3 TO  WS-ACTIAST-DLTE-COUNT.                   CAT712  
LRM007                                                                          
032340 CONVERT-TO-CCYYMMDD.                                             CAT712  
032350                                                                  CAT712  
032360     MOVE '19'              TO WS-DATE-CCYYMMDD-CC                CAT712  
                                     OF WS-DATE-CCYYMMDD-AREA.          CAT712  
032370     MOVE WS-DATE-MMDDYY-MM TO WS-DATE-CCYYMMDD-MM                CAT712  
                                     OF WS-DATE-CCYYMMDD-AREA.          CAT712  
032380     MOVE WS-DATE-MMDDYY-DD TO WS-DATE-CCYYMMDD-DD                CAT712  
                                     OF WS-DATE-CCYYMMDD-AREA.          CAT712  
032390     MOVE WS-DATE-MMDDYY-YY TO WS-DATE-CCYYMMDD-YY                CAT712  
                                     OF WS-DATE-CCYYMMDD-AREA.          CAT712  
032400     IF WS-DATE-MMDDYY-YY < '90'                                  CAT712  
032500        MOVE '20'           TO WS-DATE-CCYYMMDD-CC                CAT712  
                                     OF WS-DATE-CCYYMMDD-AREA.          CAT712  
032600                                                                  CAT712  
      *******************                                               CAT712  
       SQL-ERROR-ROUTINE.                                               CAT712  
      *******************                                               CAT712  
                                                                        CAT712  
           CALL DSNTIAR               USING  SQLCA                      CAT712  
                                             WS-DB2-MESSAGE-AREA        CAT712  
                                             WS-ERR-LINE-LEN            CAT712  
                                                                        CAT712  
           DISPLAY ' '                                                  CAT712  
                                                                        CAT712  
           PERFORM VARYING WS-ERROR-INDEX FROM 1 BY 1                   CAT712  
              UNTIL WS-ERROR-INDEX GREATER THAN 12                      CAT712  
                 IF WS-ERROR-MSG (WS-ERROR-INDEX) > SPACES              CAT712  
                    DISPLAY '*** ' WS-ERROR-MSG (WS-ERROR-INDEX)        CAT712  
                 END-IF                                                 CAT712  
           END-PERFORM                                                  CAT712  
                                                                        CAT712  
           DISPLAY ' '                                                  CAT712  
           DISPLAY ' *** CAT712 ABENDED ****'                           CAT712  
           DISPLAY ' ACAT-CLIENT IS : ' WS-CLIENT-NBR.                  CAT712  
           DISPLAY ' ACAT-CONTROL-NBR = ' WS-ACAT-CNTL-NBR.             CAT712  
           DISPLAY ' '                                                  CAT712  
                                                                        CAT712  
           EXEC SQL  ROLLBACK  END-EXEC                                 CAT712  
           MOVE +3999    TO ABEND-CODE                                  CAT712  
           CALL ABEND USING ABEND-CODE.                                 CAT712  
                                                                        CAT712  
       CALL-ABEND.                                                      CAT712  
           CALL ABEND USING ABEND-CODE.                                 CAT712  
      ******************************************************************CAT712  
