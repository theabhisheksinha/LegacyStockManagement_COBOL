 SORT FIELDS=(4,3,CH,A,35,8,CH,A),                                              
              DYNALLOC=(SYSDA,10)                                               
 INCLUDE COND=((1,1,EQ,C'P'),AND,((7,1,EQ,C'0'),OR,                             
               (7,1,EQ,C'-'))),FORMAT=BI                                        
 SUM FIELDS=NONE                                                                
