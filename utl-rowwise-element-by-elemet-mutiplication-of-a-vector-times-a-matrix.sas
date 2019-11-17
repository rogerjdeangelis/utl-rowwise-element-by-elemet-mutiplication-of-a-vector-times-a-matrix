Element by elemet mutiplication of a vector times a matrix                                                                  
                                                                                                                            
github                                                                                                                      
https://tinyurl.com/wc4bly5                                                                                                 
https://github.com/rogerjdeangelis/utl-rowwise-element-by-elemet-mutiplication-of-a-vector-times-a-matrix                   
                                                                                                                            
SAS Forum                                                                                                                   
https://tinyurl.com/veocw32                                                                                                 
https://communities.sas.com/t5/SAS-Programming/Multiply-variables-across-datasets-based-on-condition/m-p/604046             
                                                                                                                            
macros                                                                                                                      
https://tinyurl.com/y9nfugth                                                                                                
https://github.com/rogerjdeangelis/utl-macros-used-in-many-of-rogerjdeangelis-repositories                                  
                                                                                                                            
                                                                                                                            
*_                   _                                                                                                      
(_)_ __  _ __  _   _| |_                                                                                                    
| | '_ \| '_ \| | | | __|                                                                                                   
| | | | | |_) | |_| | |_                                                                                                    
|_|_| |_| .__/ \__,_|\__|                                                                                                   
        |_|                                                                                                                 
;                                                                                                                           
libname sd1 "d:/sd1";                                                                                                       
                                                                                                                            
data sd1.one;                                                                                                               
input A B C D;                                                                                                              
cards4;                                                                                                                     
8 2 4 7                                                                                                                     
1 3 5 6                                                                                                                     
7 3 3 10                                                                                                                    
4 3 7 5                                                                                                                     
1 6 7 8                                                                                                                     
4 1 7 9                                                                                                                     
2 7 1 2                                                                                                                     
1 8 10 10                                                                                                                   
7 7 6 10                                                                                                                    
;;;;                                                                                                                        
run;quit;                                                                                                                   
                                                                                                                            
data sd1.two;                                                                                                               
input B A D C;                                                                                                              
cards4;                                                                                                                     
0.2 0.3 0.1 0.4                                                                                                             
;;;;;                                                                                                                       
run;quit;                                                                                                                   
                                                                                                                            
SD1.ONE total obs=9                                                                                                         
                                                                                                                            
Obs    A    B     C     D                                                                                                   
                                                                                                                            
 1     8    2     4     7                                                                                                   
 2     1    3     5     6                                                                                                   
 3     7    3     3    10                                                                                                   
 4     4    3     7     5                                                                                                   
 5     1    6     7     8                                                                                                   
 6     4    1     7     9                                                                                                   
 7     2    7     1     2                                                                                                   
 8     1    8    10    10                                                                                                   
 9     7    7     6    10                                                                                                   
                                                                                                                            
                                                                                                                            
SD1.TWO total obs=1                                                                                                         
                                                                                                                            
Obs     A      B      C      D                                                                                              
                                                                                                                            
 1     0.3    0.2    0.4    0.1                                                                                             
                                                                                                                            
                                                                                                                            
*            _               _                                                                                              
  ___  _   _| |_ _ __  _   _| |_                                                                                            
 / _ \| | | | __| '_ \| | | | __|                                                                                           
| (_) | |_| | |_| |_) | |_| | |_                                                                                            
 \___/ \__,_|\__| .__/ \__,_|\__|                                                                                           
                |_|                                                                                                         
;                                                                                                                           
                                                                                                                            
Up to 40 obs from WANT total obs=9                                                                                          
                                                                                                                            
Obs     A      B      C      D                                                                                              
                                                                                                                            
 1     2.4    0.4    1.6    0.7                                                                                             
 2     0.3    0.6    2.0    0.6                                                                                             
 3     2.1    0.6    1.2    1.0                                                                                             
 4     1.2    0.6    2.8    0.5                                                                                             
 5     0.3    1.2    2.8    0.8                                                                                             
 6     1.2    0.2    2.8    0.9                                                                                             
 7     0.6    1.4    0.4    0.2                                                                                             
 8     0.3    1.6    4.0    1.0                                                                                             
 9     2.1    1.4    2.4    1.0                                                                                             
                                                                                                                            
*                                                                                                                           
 _ __  _ __ ___   ___ ___  ___ ___                                                                                          
| '_ \| '__/ _ \ / __/ _ \/ __/ __|                                                                                         
| |_) | | | (_) | (_|  __/\__ \__ \                                                                                         
| .__/|_|  \___/ \___\___||___/___/                                                                                         
|_|                                                                                                                         
;                                                                                                                           
                                                                                                                            
%utlfkil(d:/xpt/want.xpt);*just in case it exists;                                                                          
                                                                                                                            
%utl_submit_r64('                                                                                                           
 library(haven);                                                                                                            
 library(SASxport);                                                                                                         
 one<-as.matrix(read_sas("d:/sd1/one.sas7bdat"));                                                                           
 two<-read_sas("d:/sd1/two.sas7bdat");                                                                                      
 want <- as.data.frame(one %*% diag(two));                                                                                  
 colnames(want)<-c("A","B","C","D");                                                                                        
 write.xport(want,file="d:/xpt/want.xpt");                                                                                  
');                                                                                                                         
                                                                                                                            
libname xpt xport "d:/xpt/want.xpt";                                                                                        
data want;                                                                                                                  
  set xpt.want;                                                                                                             
run;quit;                                                                                                                   
libname xpt clear;                                                                                                          
                                                                                                                            
