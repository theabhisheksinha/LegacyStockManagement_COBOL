cd 313\out                                                                      
type a                                                                          
LOCSITE RECFM=FB LRECL=2000 BLKSIZE=0                                           
LOCSITE CYL PRI=100 SEC=100                                                     
LOCSITE STORCLAS=GDSBATCH                                                       
GET ACSNSCCInput_313_02.DAT 'BTTT.C313.INPACAT.ASCENDIS(+1)' (replace           
QUIT                                                                            
