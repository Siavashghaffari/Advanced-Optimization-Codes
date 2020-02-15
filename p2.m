gen=0;
sigma=0;
sigA=0;
   for i=1:50
    x1(i,:)=round(rand(1,8));
    x2(i,:)=round(rand(1,8));
    x3(i,:)=round(rand(1,8));
    x4(i,:)=round(rand(1,8));
    x5(i,:)=round(rand(1,8));
    x6(i,:)=round(rand(1,8));
    x7(i,:)=round(rand(1,8));
    x8(i,:)=round(rand(1,8));
    x9(i,:)=round(rand(1,8));
    x10(i,:)=round(rand(1,8));
   end   
for o=1:100
    gen=gen+1;
    for i=1:50
    for j=1:8
        C(i,j)=x1(i,j);
    end
    for j=1:8
        C(i,j+8)=x2(i,j);
    end
    for j=1:8
        C(i,j+16)=x3(i,j);
    end
    for j=1:8
        C(i,j+24)=x4(i,j);
    end
    for j=1:8
        C(i,j+32)=x5(i,j);
    end
    for j=1:8
        C(i,j+40)=x6(i,j);
    end
    for j=1:8
        C(i,j+48)=x7(i,j);
    end
    for j=1:8
        C(i,j+56)=x8(i,j);
    end
    for j=1:8
        C(i,j+64)=x9(i,j);
    end
    for j=1:8
        C(i,j+72)=x10(i,j);
    end
    x12=binvec2dec(x1(i,:));
    x22=binvec2dec(x2(i,:));
    x32=binvec2dec(x3(i,:));
    x42=binvec2dec(x4(i,:));
    x52=binvec2dec(x5(i,:));
    x62=binvec2dec(x6(i,:));
    x72=binvec2dec(x7(i,:));
    x82=binvec2dec(x8(i,:));
    x92=binvec2dec(x9(i,:));
    x102=binvec2dec(x10(i,:));
    x11=(1000+1000)/(2^8-1)*x12-1000;
    x21=(1000+1000)/(2^8-1)*x22-1000;
    x31=(1000+1000)/(2^8-1)*x32-1000;
    x41=(1000+1000)/(2^8-1)*x42-1000;
    x51=(1000+1000)/(2^8-1)*x52-1000;
    x61=(1000+1000)/(2^8-1)*x62-1000;
    x71=(1000+1000)/(2^8-1)*x72-1000;
    x81=(1000+1000)/(2^8-1)*x82-1000;
    x91=(1000+1000)/(2^8-1)*x92-1000;
    x101=(1000+1000)/(2^8-1)*x102-1000;
    if x11-3*x41+5*x71-x101>=0
        S1=x11-3*x41+5*x71-x101;
    else
        S1=0;
    end   
    if x11+2*x21+4*x41+8*x81-100>=0
        S2=x11+2*x21+4*x41+8*x81-100;
    else
        S2=0;
    end    
     if x11+3*x31+6*x61-9*x91-50>=0
        S3=x11+3*x31+6*x61-9*x91-50;
    else
        S3=0;
    end    
        A=10^6;
        h1=x11+x31+x51+x71+x91;
        h2=x21+2*x41+3*x61+4*x81+5*x101;
        h3=2*x21-5*x51+8*x81;
        sum=0;
        for k=1:10
        L=1/.k.*xk1.^2+k.*xk1+k.^2;
        sum=sum+L;
        end
    F(i,:)=A-(sum+S1+S2+S3+h1^2+h2^2+h3^2);  
end
   for i=1:50
     sigma=sigma+F(i); 
   end
   %Roulette wheel selection
  for i=1:50 
    M=F(i)/sigma;
    sigA=sigA+M;
    p(i)=sigA;
  end
for i=1:50
a=rand;
 if (a>0)&(a<=p(1))
        Z(i,:)=C(i,:);
 end
for k=2:50
   if (a>p(k-1))&(a<=p(k))
        Z(i,:)=C(i,:);
   end
end
end
%Crossover
for i=1:25
    e=rand;
    Pc=0.7;
    g=ceil(50*rand);
c=ceil(50*rand);
U(i,:)=C(g,:);
V(i,:)=C(c,:);
d=ceil(rand*32);
    if e<=Pc
for j=1:80
if j<=d
    V1(i,j)=U(i,j);
    U1(i,j)=V(i,j);
else
    V1(i,j)=V(i,j);
    U1(i,j)=U(i,j);
end
end
else
    for j=1:80
         V1(i,j)=V(i,j);
    U1(i,j)=U(i,j);
    end
    end
end
for i=1:25
  for j=1:8
       x1(i,j)=U(i,j);
    end
    for j=1:8
      x2(i,j)=U(i,j+8);
    end
    for j=1:8
       x3(i,j)=U(i,j+16);
    end
    for j=1:8
        x4(i,j)=U(i,j+24);
    end
    for j=1:8
        x5(i,j)=U(i,j+32);
    end
    for j=1:8
       x6(i,j)=U(i,j+40);
    end
    for j=1:8
       x7(i,j)=U(i,j+48);
    end
    for j=1:8
      x8(i,j)=U(i,j+56);
    end
    for j=1:8
        x9(i,j)=U(i,j+64);
    end
    for j=1:8
        x10(i,j)=U(i,j+72);
    end
    x12=binvec2dec(x1(i,:));
    x22=binvec2dec(x2(i,:));
    x32=binvec2dec(x3(i,:));
    x42=binvec2dec(x4(i,:));
    x52=binvec2dec(x5(i,:));
    x62=binvec2dec(x6(i,:));
    x72=binvec2dec(x7(i,:));
    x82=binvec2dec(x8(i,:));
    x92=binvec2dec(x9(i,:));
    x102=binvec2dec(x10(i,:));
    x11=(1000+1000)/(2^8-1)*x12-1000;
    x21=(1000+1000)/(2^8-1)*x22-1000;
    x31=(1000+1000)/(2^8-1)*x32-1000;
    x41=(1000+1000)/(2^8-1)*x42-1000;
    x51=(1000+1000)/(2^8-1)*x52-1000;
    x61=(1000+1000)/(2^8-1)*x62-1000;
    x71=(1000+1000)/(2^8-1)*x72-1000;
    x81=(1000+1000)/(2^8-1)*x82-1000;
    x91=(1000+1000)/(2^8-1)*x92-1000;
    x101=(1000+1000)/(2^8-1)*x102-1000;
   if x11-3*x41+5*x71-x101>=0
        S1=x11-3*x41+5*x71-x101;
    else
        S1=0;
    end   
    if x11+2*x21+4*x41+8*x81-100>=0
        S2=x11+2*x21+4*x41+8*x81-100;
    else
        S2=0;
    end    
     if x11+3*x31+6*x61-9*x91-50>=0
        S3=x11+3*x31+6*x61-9*x91-50;
    else
        S3=0;
    end    
        A=10^6;
        h1=x11+x31+x51+x71+x91;
        h2=x21+2*x41+3*x61+4*x81+5*x101;
        h3=2*x21-5*x51+8*x81;
        sum=0;
        for k=1:10
        L=1/.k.*xk1.^2+k.*xk1+k.^2;
        sum=sum+L;
        end
    F1(i,:)=A-(sum+S1+S2+S3+h1^2+h2^2+h3^2);
    for j=1:8
       x1(i,j)=V(i,j);
    end
    for j=1:8
      x2(i,j)=V(i,j+8);
    end
    for j=1:8
       x3(i,j)=V(i,j+16);
    end
    for j=1:8
        x4(i,j)=V(i,j+24);
    end
    for j=1:8
        x5(i,j)=V(i,j+32);
    end
    for j=1:8
       x6(i,j)=V(i,j+40);
    end
    for j=1:8
       x7(i,j)=V(i,j+48);
    end
    for j=1:8
      x8(i,j)=V(i,j+56);
    end
    for j=1:8
        x9(i,j)=V(i,j+64);
    end
    for j=1:8
        x10(i,j)=V(i,j+72);
    end
    x12=binvec2dec(x1(i,:));
    x22=binvec2dec(x2(i,:));
    x32=binvec2dec(x3(i,:));
    x42=binvec2dec(x4(i,:));
    x52=binvec2dec(x5(i,:));
    x62=binvec2dec(x6(i,:));
    x72=binvec2dec(x7(i,:));
    x82=binvec2dec(x8(i,:));
    x92=binvec2dec(x9(i,:));
    x102=binvec2dec(x10(i,:));
    x11=(1000+1000)/(2^8-1)*x12-1000;
    x21=(1000+1000)/(2^8-1)*x22-1000;
    x31=(1000+1000)/(2^8-1)*x32-1000;
    x41=(1000+1000)/(2^8-1)*x42-1000;
    x51=(1000+1000)/(2^8-1)*x52-1000;
    x61=(1000+1000)/(2^8-1)*x62-1000;
    x71=(1000+1000)/(2^8-1)*x72-1000;
    x81=(1000+1000)/(2^8-1)*x82-1000;
    x91=(1000+1000)/(2^8-1)*x92-1000;
    x101=(1000+1000)/(2^8-1)*x102-1000;
   if x11-3*x41+5*x71-x101>=0
        S1=x11-3*x41+5*x71-x101;
    else
        S1=0;
    end   
    if x11+2*x21+4*x41+8*x81-100>=0
        S2=x11+2*x21+4*x41+8*x81-100;
    else
        S2=0;
    end    
     if x11+3*x31+6*x61-9*x91-50>=0
        S3=x11+3*x31+6*x61-9*x91-50;
    else
        S3=0;
    end    
        A=10^6;
        h1=x11+x31+x51+x71+x91;
        h2=x21+2*x41+3*x61+4*x81+5*x101;
        h3=2*x21-5*x51+8*x81;
        sum=0;
        for k=1:10
        L=1/.k.*xk1.^2+k.*xk1+k.^2;
        sum=sum+L;
        end
    F2(i,:)=A-(sum+S1+S2+S3+h1^2+h2^2+h3^2);  
    for j=1:8
       x1(i,j)=U1(i,j);
    end
    for j=1:8
      x2(i,j)=U1(i,j+8);
    end
    for j=1:8
       x3(i,j)=U1(i,j+16);
    end
    for j=1:8
        x4(i,j)=U1(i,j+24);
    end
    for j=1:8
        x5(i,j)=U1(i,j+32);
    end
    for j=1:8
       x6(i,j)=U1(i,j+40);
    end
    for j=1:8
       x7(i,j)=U1(i,j+48);
    end
    for j=1:8
      x8(i,j)=U1(i,j+56);
    end
    for j=1:8
        x9(i,j)=U1(i,j+64);
    end
    for j=1:8
        x10(i,j)=U1(i,j+72);
    end
    x12=binvec2dec(x1(i,:));
    x22=binvec2dec(x2(i,:));
    x32=binvec2dec(x3(i,:));
    x42=binvec2dec(x4(i,:));
    x52=binvec2dec(x5(i,:));
    x62=binvec2dec(x6(i,:));
    x72=binvec2dec(x7(i,:));
    x82=binvec2dec(x8(i,:));
    x92=binvec2dec(x9(i,:));
    x102=binvec2dec(x10(i,:));
    x11=(1000+1000)/(2^8-1)*x12-1000;
    x21=(1000+1000)/(2^8-1)*x22-1000;
    x31=(1000+1000)/(2^8-1)*x32-1000;
    x41=(1000+1000)/(2^8-1)*x42-1000;
    x51=(1000+1000)/(2^8-1)*x52-1000;
    x61=(1000+1000)/(2^8-1)*x62-1000;
    x71=(1000+1000)/(2^8-1)*x72-1000;
    x81=(1000+1000)/(2^8-1)*x82-1000;
    x91=(1000+1000)/(2^8-1)*x92-1000;
    x101=(1000+1000)/(2^8-1)*x102-1000;
   if x11-3*x41+5*x71-x101>=0
        S1=x11-3*x41+5*x71-x101;
    else
        S1=0;
    end   
    if x11+2*x21+4*x41+8*x81-100>=0
        S2=x11+2*x21+4*x41+8*x81-100;
    else
        S2=0;
    end    
     if x11+3*x31+6*x61-9*x91-50>=0
        S3=x11+3*x31+6*x61-9*x91-50;
    else
        S3=0;
    end    
        A=10^6;
        h1=x11+x31+x51+x71+x91;
        h2=x21+2*x41+3*x61+4*x81+5*x101;
        h3=2*x21-5*x51+8*x81;
        sum=0;
        for k=1:10
        L=1/.k.*xk1.^2+k.*xk1+k.^2;
        sum=sum+L;
        end
    F3(i,:)=A-(sum+S1+S2+S3+h1^2+h2^2+h3^2);  
    for j=1:8
       x1(i,j)=U(i,j);
    end
    for j=1:8
      x2(i,j)=V1(i,j+8);
    end
    for j=1:8
       x3(i,j)=V2(i,j+16);
    end
    for j=1:8
        x4(i,j)=V2(i,j+24);
    end
    for j=1:8
        x5(i,j)=V2(i,j+32);
    end
    for j=1:8
       x6(i,j)=V2(i,j+40);
    end
    for j=1:8
       x7(i,j)=V2(i,j+48);
    end
    for j=1:8
      x8(i,j)=V2(i,j+56);
    end
    for j=1:8
        x9(i,j)=V2(i,j+64);
    end
    for j=1:8
        x10(i,j)=V2(i,j+72);
    end
    x12=binvec2dec(x1(i,:));
    x22=binvec2dec(x2(i,:));
    x32=binvec2dec(x3(i,:));
    x42=binvec2dec(x4(i,:));
    x52=binvec2dec(x5(i,:));
    x62=binvec2dec(x6(i,:));
    x72=binvec2dec(x7(i,:));
    x82=binvec2dec(x8(i,:));
    x92=binvec2dec(x9(i,:));
    x102=binvec2dec(x10(i,:));
    x11=(1000+1000)/(2^8-1)*x12-1000;
    x21=(1000+1000)/(2^8-1)*x22-1000;
    x31=(1000+1000)/(2^8-1)*x32-1000;
    x41=(1000+1000)/(2^8-1)*x42-1000;
    x51=(1000+1000)/(2^8-1)*x52-1000;
    x61=(1000+1000)/(2^8-1)*x62-1000;
    x71=(1000+1000)/(2^8-1)*x72-1000;
    x81=(1000+1000)/(2^8-1)*x82-1000;
    x91=(1000+1000)/(2^8-1)*x92-1000;
    x101=(1000+1000)/(2^8-1)*x102-1000;
   if x11-3*x41+5*x71-x101>=0
        S1=x11-3*x41+5*x71-x101;
    else
        S1=0;
    end   
    if x11+2*x21+4*x41+8*x81-100>=0
        S2=x11+2*x21+4*x41+8*x81-100;
    else
        S2=0;
    end    
     if x11+3*x31+6*x61-9*x91-50>=0
        S3=x11+3*x31+6*x61-9*x91-50;
    else
        S3=0;
    end    
        A=10^6;
        h1=x11+x31+x51+x71+x91;
        h2=x21+2*x41+3*x61+4*x81+5*x101;
        h3=2*x21-5*x51+8*x81;
        sum=0;
        for k=1:10
        L=1/.k.*xk1.^2+k.*xk1+k.^2;
        sum=sum+L;
        end
    F4(i,:)=A-(sum+S1+S2+S3+h1^2+h2^2+h3^2);  
    %Elliticism
    for j=1:80
    T(i,j)=U(i,j);
    T(i+25,j)=V(i,j);
    T(i+50,j)=U1(i,j);
    T(i+75,j)=V1(i,j);
    end
    T(i,81)=F1(i);
    T(i+25,81)=F2(i);
    T(i+50,81)=F3(i);
    T(i+75,81)=F4(i);
    vec=T(:,81);
end
  for i=1:50
  Fs=transpose(vec);
     m=max(Fs);
     n=find(Fs==m);
     q=n(1);
     for j=1:80
         T1(i,j)=T(q,j);
     end
     vec(q)=0;     
  end
  %Mutation
  for i=1:50
      for j=1:80
      Pm=.001;
      w=rand;
      if rand<Pm
          if T(i,j)==1
              T(i,j)=0;
          else
              T(i,j)=1;
          end   
      end
      end
  end
  for i=1:50
  for j=1:8
       x1(i,j)=T1(i,j);
    end
    for j=1:8
      x2(i,j)=T1(i,j+8);
    end
    for j=1:8
       x3(i,j)=T1(i,j+16);
    end
    for j=1:8
        x4(i,j)=T1(i,j+24);
    end
    for j=1:8
        x5(i,j)=T1(i,j+32);
    end
    for j=1:8
       x6(i,j)=T1(i,j+40);
    end
    for j=1:8
       x7(i,j)=T1(i,j+48);
    end
    for j=1:8
      x8(i,j)=T1(i,j+56);
    end
    for j=1:8
        x9(i,j)=T1(i,j+64);
    end
    for j=1:8
        x10(i,j)=T1(i,j+72);
    end
    x12=binvec2dec(x1(i,:));
    x22=binvec2dec(x2(i,:));
    x32=binvec2dec(x3(i,:));
    x42=binvec2dec(x4(i,:));
    x52=binvec2dec(x5(i,:));
    x62=binvec2dec(x6(i,:));
    x72=binvec2dec(x7(i,:));
    x82=binvec2dec(x8(i,:));
    x92=binvec2dec(x9(i,:));
    x102=binvec2dec(x10(i,:));
    x11=(1000+1000)/(2^8-1)*x12-1000;
    x21=(1000+1000)/(2^8-1)*x22-1000;
    x31=(1000+1000)/(2^8-1)*x32-1000;
    x41=(1000+1000)/(2^8-1)*x42-1000;
    x51=(1000+1000)/(2^8-1)*x52-1000;
    x61=(1000+1000)/(2^8-1)*x62-1000;
    x71=(1000+1000)/(2^8-1)*x72-1000;
    x81=(1000+1000)/(2^8-1)*x82-1000;
    x91=(1000+1000)/(2^8-1)*x92-1000;
    x101=(1000+1000)/(2^8-1)*x102-1000;
        sum=0;
        for k=1:10
        L=1/.k.*xk1.^2+k.*xk1+k.^2;
        sum=sum+L;
        end
    Ft(i,:)=sum;  
    
  end
  Fmean=sum(Ft)/50;
  Fmax=max(Ft);
  convergence=Fmean/Fmax
end  
  
  
  
  