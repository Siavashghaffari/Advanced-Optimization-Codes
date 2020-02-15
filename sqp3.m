%starting point
for k=1:10
    X1(k)=0;
end
%initialize l1,l2,H,D
for i=1:3
        l1(i)=0;
    end
    for i=1:3
        l2(i)=0;
    end
H=eye(10);
D=1000;
%tolerance for convergance
while(D>0.01)
%evaluating gradient for first point   
    for k=1:10
    F(k)=2*(1./k.*X1(k).^2+k.*X1(k)+k.^2)*(2./k.*X1(k)+k);
    end
%evaluating S with "QUADPROG" function
  A=[1,0,0,-3,0,0,5,0,0,-1;
       1,2,0,4,0,0,0,8,0,0;
       1,0,3,0,0,6,0,0,-9,0;];
  b=[-X1(1)+3*X1(4)-5*X1(7)+X1(10);
       -X1(1)-2*X1(2)-4*X1(4)-8*X1(8)+100;
       -X1(1)-3*X1(3)-6*X1(6)+9*X1(9)+50;];
  Aeq=[1,0,1,0,1,0,1,0,1,0;
       0,1,0,2,0,3,0,4,0,5;
       0,2,0,0,-5,0,0,8,0,0;];
  beq=[-0.9*(X1(1)+X1(3)+X1(5)+X1(7)+X1(9));
      -0.9*(X1(2)+2*X1(4)+3*X1(6)+4*X1(8)+5*X1(10));
      -0.9*(2*X1(2)-5*X1(5)+8*X1(8));];
  lb=-5*ones(10,1);
  ub=5*ones(10,1);
  [S,fval,exitflag,output,lambda]= quadprog(H,F,A,b,Aeq,beq,lb,ub);
   landa1=lambda.eqlin;
   landa2=lambda.ineqlin;
    M=X1;
    L1=F;
 %Find alpha   
    syms a
    for k=1:10
        f(k)=2*(1./k.*(X1(k)+a*S(k)).^2+k.*(X1(k)+a*S(k))+k.^2)*(2./k.*(X1(k)+a*S(k))+k).*S(k);
    end
    f1=sum(f);
  %check violation of constrain  
    R(1)=S(1)+S(3)+S(5)+S(7)+S(9);
    if X1(1)+X1(3)+X1(5)+X1(7)+X1(9)<0
        sign1=-1;
    else
        sign1=1;
    end
    R(2)=S(2)+2*S(4)+3*S(6)+4*S(8)+5*S(10);
    if X1(2)+2*X1(4)+3*X1(6)+4*X1(8)+5*X1(10)<0
        sign2=-1;
    else
        sign2=1;
    end
    R(3)=2*S(2)-5*S(5)+8*S(8);
    if 2*X1(2)-5*X1(5)+8*X1(8)<0
        sign3=-1;
    else
        sign3=1;
    end
    v=1000;
    z=1000;
    while(z>.0001)
    if X1(1)-3*X1(4)+5*X1(7)-X1(10)<=0
        R(4)=0;
    else
        R(4)=S(1)-3*S(4)+5*S(7)-S(10);
    end
     if X1(1)+2*X1(2)+4*X1(4)+8*X1(8)-100<=0
        R(5)=0;
    else
        R(5)=S(1)+2*S(2)+4*S(4)+8*S(8);
     end
     if X1(1)+3*X1(3)+6*X1(6)-9*X1(9)-50<=0
     R(6)=0;
    else
        R(6)=S(1)+3*S(3)+6*S(6)-9*S(9);
     end
 %updating landa    
     for i=1:3
         if landa1(i)>0.5*(l1(i)+landa1(i))
             R1(i)=landa1(i);
         else
             R1(i)=0.5*(l1(i)+landa1(i));
         end
     end
     for i=1:3
         if landa2(i)>0.5*(l2(i)+landa2(i))
             R1(i+3)=landa2(i);
         else
             R1(i+3)=0.5*(l2(i)+landa2(i));
         end
     end        
     al=solve(f1+landa1(1)*R1(1)*sign1+landa1(2)*R1(2)*sign2+landa1(3)*R1(3)*sign3+landa2(1)*R1(4)+landa2(2)*R1(5)+landa2(3)*R1(6),a);
     alph=subs(al);
     alpha=alph(1);
 %evaluating second point    
    for k=1:10
         X2(k)=X1(k)+alpha*S(k);
    end
    X1=X2;
    z=abs(alpha-v);
    v=alpha;
    end
    for i=1:3
        l1(i)=landa1(i);
    end
    for i=1:3
        l2(i)=landa2(i);
    end
     for k=1:10
         P(k)=X2(k)-M(k);
     end
     
     for k=1:10
    F(k)=2*(1./k.*X2(k).^2+k.*X2(k)+k.^2)*(2./k.*X2(k)+k);
     end
    L2=F;
    %updating Hessian
     Q=L2-L1;
     if P*transpose(Q)>=0.2*P*H*transpose(P)
         teta=1;
     else
         teta=(0.8*P*H*transpose(P))/(P*H*transpose(P)-P*transpose(Q));
     end
     gama=teta*transpose(Q)+(1-teta)*H*transpose(P);
     H=H-(H*transpose(P)*P*H)/(P*H*transpose(P))+gama*transpose(gama)/(P*transpose(P));
     %find tolerance of convergance
     for k=1:10
         D1(k)=(X2(k)-M(k)).^2;
     end
     D=sqrt(sum(D1));
     X1=X2;
     %Evaluating function
     for k=1:10
        L(k)=(1./k.*X2(k).^2+k.*X2(k)+k.^2).^2;
        end
    Ft=sum(L);
     end
       