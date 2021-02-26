% 1386/10/15 (Jan, 5th, 2008) by Akbar Karimi, Hadi Nobahari and Patrick Siarry
%
% TCACS is a hybrid optimization algorithm combining Tabu Search (TS) and
% Continuous Ant Colony System (CACS).
%
% Following is a brief description of the function's input and output
% arguments:
% FunctionName : A string containing the name of the MATLAB m-file in which
% the objective function is implemented. This function should have the
% following form:
%
%    Y=MyFunctionName(X)
%
% Where X is a M x N matrix; each row of X contains a point in
% N-dimensional space for which the value of the objective function is
% calculated and stored in element of Y. Y is a column
% vector of M elements, holding the objective function values
% corresponding to points specified by the rows of X.
% be calculated.
%
% Domain : A 2 x N matrix that specifies the minimum and maximum limits of
% the search variables. The first row holds the lower limits and the second
% row the upper limits. the i-th column corresponds to the i-th variable.
%
% MaxFE : Maximum number of function evaluations. The algorithm stops when
% it has executed the objective function for MaxFE times.
%
% MaxAcceptedError : Maximum acceptable error value, which is defined as the Euclidean
% distance between the best point and the farthest promising point at the
% current iteration. This is a measure of the accuracy with which we want
% the solution and the algorithm stops when the error falls below this value.
%
% Options : A cell array containing the user-defined values for the control
% parameters of the algorithm. In order to use the default parameter
% setting (which is based on the problem dimension), this argument must be
% absent. However, when TCACS is called with argument Options, its content will
% be interpreted as the following pattern and description of the
% parameters:
%
%   {nAnts, WeightingMode, WeightingFactor, PCAFactor}
%
% nAnts : Number of Ants used.
% WeightingMode : It can be either 0 for Rank method or 1 for Roulette method.
% WeightingFactor : It should be between 0 and 1.
% PCAFactor : An integer value ranging from 1 upward (1,2,3,...).
%
% XOpt : A column vector containing the optimum values of the varioables
% which will minimize the objective function.
%
% FOpt : Optimum objective function value found; associated with XOpts.
% nFE : Number of objective function evaluations performed.
%
% Here is an Example of how to use TCACS:
% Suppose that we want to find the minimum of the 2-variable function
%       f(x1,x2) = (x1-1.2)^2+(x2-2.3)^2+(x1-x2)^2
% where  0<x1<2 and 1<x2<3.
%
% The first step is to write the proper MATLAB function. For this case we
% should write a small MATLAB function named MyFunction.m that will look like this:
%
%   function Y=MyFunction(x)
%       Y=(x(:,1)-1.2).^2+(x(:,2)-2.3).^2+(x(:,1)-x(:,2)).^2;
%   return
%
% Remember that using the above code makes is possible to pass more than one points to MyFunction and
% evaluate them.
%
% The next step is calling TCACS with appropriate input arguments. If we
% wish to use default parameter setting, the following command should be
% entered at MATLAB command window:
%
%   [XOpt FOpt nFE]=TCACS('MyFunction', [0 1;2 3], 1000, 1e-5)
%
% And to run the algorithm with custom settings, say with 13 Ants, using the
% Roulette method, WeightingFactor of 0.75, and PCAFactor of 3, the following
% command should be used:
%
%   [XOpt FOpt nFE]=TCACS('MyFunction', [0 1;2 3], 1000, 1e-5, {13, 1, 0.75, 3})
%
%The output will be something like this:
% XOpt =
%
%     1.5667
%     1.9333
%
%
% FOpt =
%
%     0.4033
%
%
% nFE =
%
%    300

function [XOpt, FOpt, nFE]=TCACS(FunctionName, Domain, MaxFE, MaxAcceptedError, Options)
% Execution Options -------------------------------------
DemoMode=0;
PlotBalls=0;
PromptUpdateMode=0;

% Algorithm Settings ------------------------------------
TabuBoundSigma=3;

% Initialization ----------------------------------------
nVar=size(Domain,2);
if nargin==4
    if nVar<4
        nAnts=10;
        WeightingMode=0; % Rank
        WeightingFactor=1;
        PCAFactor=1;
    else
        nAnts=15;
        WeightingMode=1; % Roulette
        WeightingFactor=0.5;
        PCAFactor=2;
    end
else
    nAnts=Options{1};
    WeightingMode=Options{2};
    WeightingFactor=Options{3};
    PCAFactor=Options{4};
end
b=Domain(2,:);
a=Domain(1,:);
N=round(MaxFE/nAnts);    % Max Number of iteration
rand('state' ,sum(100*clock));
Ymax=-inf;
TabuRegionSize=inf;
nFE=0;
XOpt=zeros(nVar,1);
FOpt=inf;
sigma=zeros(nVar,1);
for i=1:nVar
    sigma(i)=4*(b(i)-a(i));
end

% Tabu List Settings ------------------------------------
TabuListSize=nAnts*1;
PromListSize=nAnts*1;
XTabu=[];
YTabu=[];
XProm=[];
YProm=[];
IsTabuReady=0;
XSeed=[];
YSeed=[];
X=zeros(nVar,nAnts);
Y=zeros(1,nAnts);
X2Z=eye(nVar);
DomainVolume=prod(Domain(2,:)-Domain(1,:));
InitialSpacing=(0.7*DomainVolume/nAnts)^(1/nVar);
if (DemoMode==2)
    for ifig=1:20
        delete(gcf);
    end
end
for nIter=1:N
    if nFE>=MaxFE
        break;
    end
    % Create a New Tour
    i=1;
    TabuDetectionNo=0;
    while i<=nAnts
        if IsTabuReady==0
            valid=false;
            while ~valid
                x=a'+rand(nVar,1).*(b-a)';
                valid=~LiesInTabuList(x,X,InitialSpacing);
            end
        else
            x=XOpt+((sigma.*randn(nVar,1))'*X2Z')';
            while (sum(x<a')+sum(x>b'))>0
                x=XOpt+((sigma.*randn(nVar,1))'*X2Z')';
            end
        end
        if (~LiesInTabuList(x,XTabu,TabuRegionSize)) || (IsTabuReady==0) || (TabuDetectionNo>1000)
            y=feval(FunctionName,x');
            nFE=nFE+1;
            X(:,i)=x;
            Y(i)=y;
            if PromptUpdateMode==1
                if rem(nFE,100)==0
                    disp(strcat('Number of Function Evaluations:',Num2Str(nFE)));
                    disp(strcat('Current Minumum Value:',Num2Str(FOpt)));
                    disp(strcat('Greatest Sigma Component:',Num2Str(max(sigma))));
                end
            end
            i=i+1;
            TabuDetectionNo=0;
        else
            TabuDetectionNo=TabuDetectionNo+1;
        end
    end
    if (IsTabuReady==1) && (DemoMode==1)
        NoOfPlots=nVar;
        NoOfCols=ceil(sqrt(NoOfPlots));
        NoOfRows=ceil(NoOfPlots/NoOfCols);
        for ip=1:NoOfPlots
            figure;
            subplot(NoOfRows,NoOfCols,ip);
            hold on;
            plot(X(ip,:),'k+');
        end
        pause;
    end
    % Global Maximum Update
    YmaxEachIteration=max(Y);
    if YmaxEachIteration>Ymax
        Ymax=YmaxEachIteration;
    end
    % Global Minimum Update
    [YminEachIteration,Imin]=min(Y);
    if YminEachIteration<FOpt
        XOpt=X(:,Imin);
        FOpt=Y(Imin);
    end
    if IsTabuReady==0
        XSeed=[XSeed X];
        YSeed=[YSeed Y];
        if length(YSeed)>=(TabuListSize+PromListSize)
            IsTabuReady=1;
            X=XSeed;
            Y=YSeed;
        end
    end
    if IsTabuReady==1
        XSeed=[X XTabu XProm];
        YSeed=[Y YTabu YProm];
        XProm=[];
        YProm=[];
        for i=1:PromListSize
            [Ybest,Ibest]=min(YSeed);
            size(XSeed);
            XProm=[XProm XSeed(:,Ibest)];
            YProm=[YProm YSeed(:,Ibest)];
            YSeed(:,Ibest)=[];
            XSeed(:,Ibest)=[];
        end

        X=XProm;
        Y=YProm;
        SelectablePoints=IsSelectable(XSeed,XOpt,sigma,TabuBoundSigma);
        AvailableSelections=sum(SelectablePoints);
        XSeed=XSeed(:,SelectablePoints==1);
        YSeed=YSeed(:,SelectablePoints==1);
        XTabu=[];
        YTabu=[];
        if (AvailableSelections>=(TabuListSize))
            TabuBallsNumber=TabuListSize;
        else
            TabuBallsNumber=AvailableSelections;
        end
        for i=1:TabuBallsNumber
            [Yworst,Iworst]=max(YSeed);
            XTabu=[XTabu XSeed(:,Iworst)];
            YTabu=[YTabu YSeed(:,Iworst)];
            YSeed(:,Iworst)=[];
            XSeed(:,Iworst)=[];
        end
        TabuRegionSize=0.5*CalculateTabuRegionSize(XProm,XTabu);
    end
    Y=Y+1e-300;
    if (DemoMode==1)&&(IsTabuReady==1)
        NoOfPlots=nVar;
        NoOfCols=ceil(sqrt(NoOfPlots));
        NoOfRows=ceil(NoOfPlots/NoOfCols);
        for ip=1:NoOfPlots
            figure(1);
            subplot(NoOfRows,NoOfCols,ip);
            hold off;
            UpperTReg=XOpt(ip)+TabuBoundSigma*sigma(ip);
            LowerTReg=XOpt(ip)-TabuBoundSigma*sigma(ip);
            OptReg=XOpt(ip);
            plot([0 PromListSize],[UpperTReg UpperTReg],'m-');hold on;
            plot([0 PromListSize],[LowerTReg LowerTReg],'m-');
            plot([0 PromListSize],[OptReg OptReg],'g-');
            plot(LowerTReg,'m-');
            if PlotBalls==1
                plot(XProm(ip,:),'go');
                if AvailableSelections~=0
                    plot(XTabu(ip,:),'ro');
                end
            end
            title(strcat('X_',num2str(ip),'=',num2str(OptReg)));
        end
    end
    % Pheromone Update
    X2Z = GetCoord(X',PCAFactor);
    X2Z=X2Z';
    Z=(X'*X2Z)';
    [Ymin, Imin]=min(Y);
    ZOpt=Z(:,Imin);
    iii=1:size(Z,2);
    W=CalculateWeights(ZOpt,Z(:,iii~=Imin),Y(:,iii~=Imin),WeightingMode,WeightingFactor,1);
    for j=1:nVar
        sigma(j)=sqrt(sum(W.*((Z(j,iii~=Imin)-ZOpt(j)).^2)));
    end
    distance=[];
    for i=1:size(X,2)
        distance=[distance norm(X(:,i)-XOpt,2)];
    end
    d=max(distance);
    if (d<=MaxAcceptedError)
        break
    end

end
%==========================================================================
% FUNCTIONS
%==========================================================================
function result=CalculateTabuRegionSize(XBest,XTabu)
CurrentSeparation=inf;
for i=1:size(XBest,2)
    for j=1:size(XTabu,2)
        CurrentSeparation=min(norm(XBest(:,i)-XTabu(:,j)),CurrentSeparation);
    end
end
result=CurrentSeparation/2;
%==========================================================================
function result=LiesInTabuList(Point,Pop,Separation)
result=0;
for i=1:size(Pop,2)
    if norm(Point-Pop(:,i))<Separation
        result=1;
        return
    end
end
%==========================================================================
function res=IsSelectable(XTabu,XMin,Sigma,BoundSigma)
[d, n]=size(XTabu);
checklist=zeros(n,1);
for i=1:n
    checklist(i)=(sum(abs(XTabu(:,i)-XMin)<(Sigma*BoundSigma))==d);
end
res=checklist';
%==========================================================================
function RM=GetCoord(X,m)
[np, nv]=size(X);
X=X-repmat(mean(X,1),np,1);
p=sum(X.^2,2).^m;
p=p/sum(p);
p=cumsum(p);
ind=sum(p<rand)+1;
Vectors=X(ind,:)/((sum(X(ind,:).^2))^.5);
Xcur=X;
Vcur=Vectors;
for i=2:(nv-1)
    Alpha=-sum(Xcur.*repmat(Vcur,np,1),2);
    Xcur=Xcur+Alpha*Vcur;
    p=sum(Xcur.^2,2).^m;
    p=p/sum(p);
    p=cumsum(p);
    ind=sum(p<rand)+1;
    Vcur=Xcur(ind,:)/((sum(Xcur(ind,:).^2))^.5);
    Vectors=[Vectors;Vcur];
end
V=([Vectors;ones(1,nv)]\[zeros(nv-1,1);10]);V=V/((sum(V.^2))^.5);
RM=[Vectors;V'];
%==========================================================================
function W=CalculateWeights(XOpt,X,Y,Mode,a,strength)
n=length(Y);
q=1:n;
d=sqrt(sum((X-repmat(XOpt,1,n)).^2,1));
switch Mode
    case 0
        [B,IY]=sort(Y);
        w_y(IY)=n-q+1;
        [B,IX]=sort(d,'descend');
        w_d(IX)=n-q+1;
        W=(abs(a*w_y+(1-a)*w_d)).^strength;
        W=W/sum(W);
    case 1
        w_y=(max(Y)-Y)/1;%max(Y);
        if w_y==0
            w_y=ones(1,n);
        end
        w_y=w_y/sum(w_y);
        w_d=(d-min(d))/1;%min(d);
        if w_d==0
            w_d=ones(1,n);
        end
        w_d=w_d/sum(w_d);
        W=(abs((a*w_y+(1-a)*w_d))).^strength;
        W=W/sum(W);
end
%==========================================================================
