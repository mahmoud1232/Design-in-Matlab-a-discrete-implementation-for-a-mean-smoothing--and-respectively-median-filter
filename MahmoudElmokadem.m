%---------------------------------------------------
% STUDENT Name: Mahmoud B. Elmokadem \\ ID\p2701566
% Machine Vision Module code: ENGT5202 
% Supervised by  Prof.DR\ Cristian Serdean 
%-----------------------------------------------------------------------
% Designing a Matlab code implementing a mean (smoothing) and respectively Median filter.
% USING A DISCRETE ALGORITHMIC IMPLEMENTATION STARTING FROM SCRATCH
%
%            RESULTS WILL BE DISPLAYED IN THE COMMAND WINDOW
% 
%-----------------------------------------------------------------------
clc                                    %to clear the Command window
clear                                  %to clean the Workspace
string show ;                          %Define a viriable called show type string 

%4x8 image
image = [2 8 0 2 4 4 4 0 ;            % This is our small image fragment that we want to filter
         0 2 2 0 4 6 6 0 ;
         4 8 6 6 6 4 4 9 ;
         1 9 1 2 2 3 4 4];
%5x4 Image                             %other Image to test 
%image = [50 50 50 50 ;
 %        50 50 50 50;
  %       80 80 80 80;
   %    100 100 100 100 ;
    %   100 100 100 100] ;
A=im2double(image);                   % Convert form uint8 to double
%user input padding value 
padding= "Choose the Padding, 0 = Without Padding , 1 = Padding by Zeros , 2=Padding by Replicate ";  
x=input(padding);                     %Store the input value from the user into x varible 

%Using Switch Statement. 
switch x
%
%---------------------------------------------------------------
%-------------------------Without Padding----------------------
%---------------------------------------------------------------
    case 0 
[row,col]=size(A);
%----------------
% Mean (smoothing) Filter 
%----------------
newimag=zeros(row,col);
newimag=double(newimag);
for i = 2:1:row-1
    for j = 2:1:col-1
        sum=0;
        sum = (A(i-1,j-1)/9 + A(i-1,j)/9 + A(i-1,j+1)/9 + A(i,j-1)/9 + A(i,j+1)/9 + A(i+1,j-1)/9 + A(i+1,j)/9 + A(i+1,j+1)/9+A(i,j)/9);
        newimag(i,j) = sum ;
    end
end
newimag; 
%Result of Mean filter "Without padding"
Mean_Filter_result_withoutpadding=newimag(1+1:end-1,2:end-1) 
%-----------------------------
% -----------Median Filter---- 
%-----------------------------
Med = [];  %Defining Empty Array to store all mask's elements on it  
Mnewimg=zeros(row,col);
Mnewimg=uint8(Mnewimg);
for i=2:1:row-1
    for j=2:1:col-1
        %process inside the mask
        Med(1) = A(i-1,j-1);
        Med(2) = A(i-1,j) ;
        Med(3) = A(i-1,j+1);
        Med(4) = A(i,j-1);
        Med(5) = A(i,j+1);
        Med(6) = A(i+1, j-1);
        Med(7) = A(i+1,j);
        Med(8) = A(i+1,j+1);
        Med(9) = A(i,j);
        Mnewimg(i,j) = median(Med,"all"); 
         
    end
end
%Result of Median filter "Without Padding " 
 Mnewimg;
 Median_Filter_result_withoutpadding=Mnewimg(1+1:end-1,2:end-1)   

%---------------------------------------------------------------
%-------------------------Padding by Zeros----------------------
%---------------------------------------------------------------
case 1 
%Padding by Zeros "preparing the matrix befor Algorithm" 
    B_zeros = padarray(A,[1,1],0,'both'); 
    A2=B_zeros ; % matrix 6*10 
    [row,col]=size(B_zeros);
%--------------------------------------------
%---------------------Mean (smoothing) Filter 
%--------------------------------------------
newimag=zeros(row,col);
newimag=double(newimag);
for i = 2:1:row-1
    for j = 2:1:col-1
      sum=0;
      sum = (A2(i-1,j-1)/9 + A2(i-1,j)/9 + A2(i-1,j+1)/9 + A2(i,j-1)/9 + A2(i,j+1)/9 + A2(i+1,j-1)/9 + A2(i+1,j)/9 + A2(i+1,j+1)/9+A2(i,j)/9);
      newimag(i,j) = sum ;
    end
end
%result of Mean filter "Padding By zeros" 
newimag;
Mean_Filter_Result_zeros=newimag(1+1:end-1,2:end-1)
%--------------------------
% -----------Median Filter 
%--------------------------
Med = [];
Mnewimg=zeros(row,col);
Mnewimg=uint16(Mnewimg); 
for i=2:row-1
    for j=2:col-1
        %process inside the mask
        Med(1) = A2(i-1,j-1);
        Med(2) = A2(i-1,j) ;
        Med(3) = A2(i-1,j+1);
        Med(4) = A2(i,j-1);
        Med(5) = A2(i,j+1);
        Med(6) = A2(i+1,j-1);
        Med(7) = A2(i+1,j);
        Med(8) = A2(i+1,j+1);
        Med(9) = A2(i,j);
        Mnewimg(i,j) = median(Med); 
         
    end
end
%Result of Median filter "Padding By zeros"
 Mnewimg;    %Matrix  
 Median_Filter_result_zeros = Mnewimg(1+1:end-1,2:end-1)
% 
%---------------------------------------------------------------
%----------------------------Padding by Repricate---------------
%---------------------------------------------------------------
        case 2 
%Padding by replicate "preparing the matrix befor Algorithm" 
    B_replicate = padarray(A,[1,1],'replicate','both'); 
    A3= B_replicate ;
    [row,col]=size(B_replicate); 

 %------------------------------
 %-------------Mean Filter------ 
 %------------------------------
imnew=zeros(row,col);
imnew=double(imnew);
for i = 2:1:row-1
    for j = 2:1:col-1
        sum=0;
        sum = (A3(i-1,j-1)/9 + A3(i-1,j)/9 + A3(i-1,j+1)/9 + A3(i,j-1)/9 + A3(i,j+1)/9 + A3(i+1,j-1)/9 + A3(i+1,j)/9 + A3(i+1,j+1)/9+A3(i,j)/9);
        imnew(i,j) = sum ;
    end
end
imnew;
%result of Mean filter "Padding By Replicate"
Mean_filter_result_Replicate=imnew(1+1:end-1,2:end-1)


%---------------------------
%----Median Filter---------- 
%---------------------------
Med = [];
medianim=zeros(row,col);
medianim=uint16(medianim);
for i=2:1:row-1
    for j=2:1:col-1
        %process inside the mask
        Med(1) = A3(i-1,j-1);
        Med(2) = A3(i-1,j) ;
        Med(3) = A3(i-1,j+1);
        Med(4) = A3(i,j-1);
        Med(5) = A3(i,j+1);
        Med(6) = A3(i+1,j-1);
        Med(7) = A3(i+1,j);
        Med(8) = A3(i+1,j+1);
        Med(9) = A3(i,j);
        medianim(i,j) = median(Med);  
    end
end
%the resuelt 
medianim; 
%result of Median filter "Padding By Replicate" 
Median_Filter_result_Replicate=medianim(1+1:end-1,2:end-1)


    otherwise 
        show ="Error input choose 0=without padding,1=for padding with zeros,2=padding with replicate"
end 






