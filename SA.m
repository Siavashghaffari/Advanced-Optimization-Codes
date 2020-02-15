function [Xopt,NFE,D,R]=SA

Tmax=1000;
Tmin=1;
n=2;
N=50;
alpha=0.5;
w=5;
X0=[5;5];

Xc=X0;
fc=fobj(Xc);
NFE=1;
T=Tmax;
D=eye(n,n);
R=[];
while isempty(R)
    u=2*rand(n,1)-1;
    Xn=Xc+D*u;
    fn=fobj(Xn);
    df=fn-fc;
    NFE=NFE+1;
    if df<0 || rand(1)<exp(-df/T)
        R=diag(Xn-Xc);
        D=(1-alpha)*D+alpha*w*R;
        Xc=Xn;
        fc=fn;
        disp('success')
    end
end

k=1;
while T>Tmin
    for i=1:N
        u=2*rand(n,1)-1;
        Xn=Xc+D*u;
        fn=fobj(Xn);
        df=fn-fc;
        NFE=NFE+1;
        if df<0 || rand(1)<exp(-df/T).*(df>0)
           %disp('sucess')
           Xn
           Xc
           R=diag(Xn-Xc);
           D=(1-alpha)*D+alpha*w*R;
           Xc=Xn;
           fc=fn;
        end
    end
    k=k+1
    Xc
    R
    T=cool(T,k);
end
Xopt=Xc;

%--------------------------------------------------------------------------
function f=fobj(X)
% the function of which minimization is desired
f=20+X(1)^2+X(2)^2-10*(cos(2*pi*X(1))+cos(2*pi*X(2)));

%--------------------------------------------------------------------------
function Tnew=cool(Told,k)
%Tnew=0.9*Told; % Exponential cooling
%Tnew=Told-?; % linear cooling
Tnew=Told/log(k); % Boltzman cooling
        
    