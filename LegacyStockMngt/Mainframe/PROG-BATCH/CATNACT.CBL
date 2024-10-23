000001* PDX    - CATNACT  C0296127 05/07/10 10:48:46 TBLAMUR            00001000
000001* PDX    - CATNACT  C0254177 09/12/07 14:21:29 TBLAMUR            00001000
LRM002* TASK 54287. LOOPING CAUSED BY STOPPED NACT RECORD. MOVED THE            
LRM002* VALID MATCHING TEST STATEMENTS INSIDE THE READ RTN.                     
000001* PDX    - CATNACT  C0239502 09/20/06 09:40:39 TBLAMUR            00001000
LRM001* TASK 49154. LOOPING CAUSED BY SPACES IN ACCOUNT NBR.                    
000001* PDX    - CATNACT  C0196253 09/26/03 10:05:32 TBLAMUR            00001000
000001* PDX    - CATNACT  C0184804 04/04/03 09:55:33 TBEDTAK            00001000
       ID DIVISION.                                                     CATNACT 
       PROGRAM-ID.  CATNACT.                                            CATNACT 
       AUTHOR.                                                          CATNACT 
      ***************************************************************** CATNACT 
      *     OBTAIN AN INTERNALLY TRANSFERED NEW ACCOUNT NUMBER.       * CATNACT 
      *     THE PROGRAM RETURNS TRANSFERED-TO ACCOUNT NUMBER TO THE   * CATNACT 
      *     CALLING PROGRAM WHO PROVIDES TRANSFERED-FROM ACCT NUMBER. * CATNACT 
      *                                                               * CATNACT 
      *     PROGRAM READS N&A ACCT TRANSFER FILE THROUGH ALTERNATE    * CATNACT 
      *     INDEXED KEY FILE.                                         * CATNACT 
      *         INPUT FILE            : S*.***.BNAT42.NACTAF          * CATNACT 
      *         ALTERNATE INDEXED FILE: S*.***.BNAT42.NACTA1          * CATNACT 
      *         ALTERNATE INDEXED PATH: S*.***.BNAT42.NACTAP1         * CATNACT 
      *         ALTERNATE INDEX KEY   : TRANSFERED-FROM ACCT NUMBER   * CATNACT 
      ***************************************************************** CATNACT 
      *                                                                 CATNACT 
       ENVIRONMENT DIVISION.                                            CATNACT 
      *                                                                 CATNACT 
       INPUT-OUTPUT SECTION.                                            CATNACT 
      *                                                                 CATNACT 
       FILE-CONTROL.                                                    CATNACT 
           SELECT NACT-FILE     ASSIGN TO  NACTFL                       CATNACT 
                  ACCESS               IS  DYNAMIC                      CATNACT 
                  ORGANIZATION         IS  INDEXED                      CATNACT 
                  RECORD KEY           IS  NA-ONLINE-KEY                CATNACT 
                  ALTERNATE RECORD KEY IS  NA-ALTKEY1                   CATNACT 
                  FILE STATUS          IS  NACT-FL-STATUS.              CATNACT 
       EJECT                                                            CATNACT 
      *                                                                 CATNACT 
       DATA DIVISION.                                                   CATNACT 
       FILE SECTION.                                                    CATNACT 
       FD  NACT-FILE.                                                   CATNACT 
       01  NA-RECORD.                                                   CATNACT 
           03  NA-ONLINE-KEY.                                           CATNACT 
               05  NA-DATE                PIC 9(8)  COMP-3.             CATNACT 
               05  NA-TIME                PIC S9(8) COMP.               CATNACT 
           03  NA-ALTKEY1.                                              CATNACT 
               05  NA-FR-CLI              PIC X(03).                    CATNACT 
               05  NA-FR-BR               PIC X(03).                    CATNACT 
               05  NA-FR-ACCT             PIC X(05).                    CATNACT 
               05  NA-TYPE                PIC X(01).                    CATNACT 
           03  NA-ALTKEY2.                                              CATNACT 
               05  NA-TO-CLI              PIC X(03).                    CATNACT 
               05  NA-TO-BR               PIC X(03).                    CATNACT 
               05  NA-TO-ACCT             PIC X(05).                    CATNACT 
           03  NA-ACTION                  PIC X(01).                    CATNACT 
           03  NA-STAT                    PIC X(01).                    CATNACT 
           03  NA-FR-RR                   PIC X(03).                    CATNACT 
           03  NA-TO-RR                   PIC X(03).                    CATNACT 
           03  NA-TERMID                  PIC X(04).                    CATNACT 
           03  NA-BULKNO                  PIC 9(04).                    CATNACT 
           03  FILLER                     PIC X(06).                    CATNACT 
      *                                                                 CATNACT 
       WORKING-STORAGE SECTION.                                         CATNACT 
       77  ABEND-CODE                       PIC S9(4) COMP VALUE ZERO.  CATNACT 
       77  NACT-FL-STATUS                   PIC X(02).                  CATNACT 
       01  WS-WORK-AREA.                                                CATNACT 
           03  WS-CLT-CODE                  PIC X(03).                  CATNACT 
           03  WS-CLT-NUM        REDEFINES  WS-CLT-CODE                 CATNACT 
                                            PIC 9(03).                  CATNACT 
           03  WS-NACT-ALTKEY1.                                         CATNACT 
               05  WS-NACT-CLT-BR-AC.                                   CATNACT 
                   07  WS-NACT-CLT          PIC X(03).                  CATNACT 
                   07  WS-NACT-BR           PIC X(03).                  CATNACT 
                   07  WS-NACT-ACCT         PIC X(05).                  CATNACT 
               05  WS-NACT-TYPE             PIC X(01).                  CATNACT 
           03  WS-NACT-TO-CLT-BR-ACCT.                                  CATNACT 
               05  WS-NACT-TO-CLT           PIC X(03).                  CATNACT 
               05  WS-NACT-TO-BR            PIC X(03).                  CATNACT 
               05  WS-NACT-TO-ACCT          PIC X(05).                  CATNACT 
               05  WS-NACT-TO-CURR          PIC 9(03) VALUE 0.          CATNACT 
           03  WS-DONE-SW                   PIC X(01).                  CATNACT 
               88  WS-DONE                            VALUE 'Y'.        CATNACT 
       EJECT                                                            CATNACT 
           COPY NACTAREC.                                               CATNACT 
       EJECT                                                            CATNACT 
           COPY STUBCPY.                                                CATNACT 
       EJECT                                                            CATNACT 
       LINKAGE  SECTION.                                                CATNACT 
       01  INTERNAL-TRANSFER-PARM.                                      CATNACT 
           03  INTNL-PASSING-INFO.                                      CATNACT 
               05  INTNL-FROM-ACCOUNT.                                  CATNACT 
                   07  INTNL-FROM-CLT       PIC X(03).                  CATNACT 
                   07  INTNL-FROM-BR        PIC X(03).                  CATNACT 
                   07  INTNL-FROM-ACCT      PIC X(05).                  CATNACT 
           03  INTNL-RETURN-INFO.                                       CATNACT 
               05  INTNL-TO-ACCOUNT.                                    CATNACT 
                   07  INTNL-TO-CLT         PIC X(03).                  CATNACT 
                   07  INTNL-TO-BR          PIC X(03).                  CATNACT 
                   07  INTNL-TO-ACCT        PIC X(05).                  CATNACT 
               05  INTNL-RETURN-CODE        PIC X(01).                  CATNACT 
                   88  INTNL-ACCT-FND                 VALUE '0'.        CATNACT 
                   88  INTNL-ACCT-NOT-FND             VALUE '1'.        CATNACT 
                   88  INTNL-INVALID-INPUT            VALUE '2'.        CATNACT 
                   88  INTNL-ERROR                    VALUE '3'.        CATNACT 
       EJECT                                                            CATNACT 
      *                                                                 CATNACT 
       PROCEDURE DIVISION USING  INTERNAL-TRANSFER-PARM.                CATNACT 
           COPY MSGCOBO.                                                CATNACT 
           DISPLAY 'CATNACT: INTERNAL TRANSFERED ACCT SEARCH'           CATNACT 
                                                                        CATNACT 
           MOVE SPACE    TO INTNL-RETURN-INFO.                          CATNACT 
                                                                        CATNACT 
           IF  (INTNL-FROM-CLT   >  SPACE)                              CATNACT 
           AND (INTNL-FROM-BR    >  SPACE)                              CATNACT 
           AND (INTNL-FROM-ACCT  >  SPACE)                              CATNACT 
               MOVE SPACES               TO WS-NACT-ALTKEY1             CATNACT 
               MOVE INTNL-FROM-ACCOUNT   TO WS-NACT-CLT-BR-AC           CATNACT 
               MOVE WS-NACT-ALTKEY1      TO NA-ALTKEY1                  CATNACT 
           ELSE                                                         CATNACT 
LRM001         SET  INTNL-ACCT-NOT-FND   TO TRUE                        CATNACT 
               GO TO GO-BACK-RTN                                        CATNACT 
           END-IF.                                                      CATNACT 
      *                                                                 CATNACT 
           OPEN INPUT NACT-FILE.                                        CATNACT 
           IF NACT-FL-STATUS  NOT =  '00' AND '97'                      CATNACT 
                DISPLAY 'CATNACT: NACT FILE OPEN ERROR'                 CATNACT 
                DISPLAY 'CATNACT: OPEN STATUS CODE = ' NACT-FL-STATUS   CATNACT 
                DISPLAY 'CATNACT: U1100 - ABENDING NACTFL'              CATNACT 
                MOVE  +1100   TO  ABEND-CODE                            CATNACT 
                GO TO CALL-ABEND                                        CATNACT 
           END-IF.                                                      CATNACT 
      *                                                                 CATNACT 
           PERFORM  MAIN-RTN THRU MAIN-RTN-EX                           CATNACT 
                UNTIL   INTNL-RETURN-CODE > SPACE.                      CATNACT 
      *                                                                 CATNACT 
           CLOSE NACT-FILE.                                             CATNACT 
           IF NACT-FL-STATUS  NOT =  '00'                               CATNACT 
                DISPLAY 'CATNACT: NACT FILE CLOSE ERROR'                CATNACT 
                DISPLAY 'CATNACT: CLOSE STATUS CODE = ' NACT-FL-STATUS  CATNACT 
                DISPLAY 'CATNACT: U3100 - ABEND CLOSE NACTFL'           CATNACT 
                MOVE  +3100   TO  ABEND-CODE                            CATNACT 
                GO TO CALL-ABEND                                        CATNACT 
           END-IF.                                                      CATNACT 
       GO-BACK-RTN.                                                     CATNACT 
           GOBACK.                                                      CATNACT 
      *                                                                 CATNACT 
       MAIN-RTN.                                                        CATNACT 
           START NACT-FILE                                              CATNACT 
                   KEY NOT < NA-ALTKEY1.                                CATNACT 
                                                                        CATNACT 
           IF NACT-FL-STATUS = '00'                                     CATNACT 
              CONTINUE                                                  CATNACT 
           ELSE                                                         CATNACT 
           IF NACT-FL-STATUS = '23'                                     CATNACT 
              SET INTNL-ACCT-NOT-FND TO TRUE                            CATNACT 
              GO TO MAIN-RTN-EX                                         CATNACT 
           ELSE                                                         CATNACT 
              DISPLAY 'CATNACT: ** NACT FILE START ERROR'               CATNACT 
              DISPLAY 'CATNACT: ** FILE STATUS CODE = ' NACT-FL-STATUS  CATNACT 
              MOVE  +2000   TO  ABEND-CODE                              CATNACT 
              GO TO CALL-ABEND                                          CATNACT 
           END-IF.                                                      CATNACT 
    *                                                                   CATNACT 
           MOVE SPACE TO WS-DONE-SW.                                    CATNACT 
           PERFORM READ-NEXT-NACT-FILE  UNTIL WS-DONE.                  CATNACT 
                                                                        CATNACT 
           IF INTNL-ACCT-NOT-FND                                        CATNACT 
              GO TO MAIN-RTN-EX.                                        CATNACT 
                                                                        CATNACT 
       MAIN-RTN-EX.   EXIT.                                             CATNACT 
       EJECT                                                            CATNACT 
      *                                                                 CATNACT 
       READ-NEXT-NACT-FILE.                                             CATNACT 
           READ NACT-FILE NEXT RECORD.                                  CATNACT 
                                                                        CATNACT 
           IF NACT-FL-STATUS = '00'                                     CATNACT 
              MOVE NA-RECORD TO NACTAREC                                CATNACT 
              IF NACT-ALTKEY1 (1:11) > WS-NACT-CLT-BR-AC                CATNACT 
                 SET INTNL-ACCT-NOT-FND TO TRUE                         CATNACT 
                 SET WS-DONE TO TRUE                                    CATNACT 
              ELSE                                                      CATNACT 
                 IF NACT-ALTKEY1 (1:11) < WS-NACT-CLT-BR-AC             CATNACT 
                    CONTINUE                                            CATNACT 
                 ELSE                                                   CATNACT 
                    IF NACT-TYPE = 'M'                                  CATNACT 
                        CONTINUE                                        CATNACT 
                    ELSE                                                CATNACT 
LRM002                 IF NACT-ACTION = SPACE                           CATNACT 
LRM002                 AND (TRANSFER-REINSTATED OR TRANSFERRED)         CATNACT 
LRM002                    MOVE NACT-ALTKEY2     TO  INTNL-TO-ACCOUNT    CATNACT 
LRM002                    SET INTNL-ACCT-FND TO TRUE                    CATNACT 
LRM002                    SET WS-DONE TO TRUE                           CATNACT 
LRM002                 END-IF                                                   
                    END-IF                                                      
                 END-IF                                                 CATNACT 
              END-IF                                                    CATNACT 
           ELSE                                                         CATNACT 
              IF NACT-FL-STATUS = '10' OR '23'                          CATNACT 
                 SET INTNL-ACCT-NOT-FND TO TRUE                         CATNACT 
                 SET WS-DONE TO TRUE                                    CATNACT 
              ELSE                                                      CATNACT 
                 DISPLAY 'CATNACT: ** NACT FILE READ NEXT ERROR'        CATNACT 
                 DISPLAY 'CATNACT: ** FILE STATUS CODE = '              CATNACT 
                                                  NACT-FL-STATUS        CATNACT 
                 MOVE  +2100   TO  ABEND-CODE                           CATNACT 
                 GO TO CALL-ABEND                                       CATNACT 
              END-IF                                                    CATNACT 
           END-IF.                                                      CATNACT 
      *                                                                 CATNACT 
       CALL-ABEND.                                                      CATNACT 
           CALL  ABEND  USING ABEND-CODE.                               CATNACT 
      *                                                                 CATNACT 
