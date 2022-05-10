clear;
clc;
% MaxIter =1000; %Maximum iteration number
c1=2;
c2=2;

S=[0  -7/12  -1/4;
   0  -5/12  -3/4;
   0   5/12  -1/4;];
flim=[30;80;40];


fname = @PSED_val;
NDim = 1;
D=NDim;
MaxIter =1000;
PopSize=1000;
num_particle=PopSize;
Bound = fname();
LowerBound = Bound(:,1);    
UpperBound = Bound(:,2);
xmax=UpperBound; 
xmin=LowerBound;
w=0.9;          % Inertia weigth
% decrease the inertia 
startwaight = 0.9;
endwaight = 0.4;
waightstep = (startwaight-endwaight)/MaxIter;
%**********************************************************
particle=zeros(num_particle,D); 
particle(:,:)=xmin+(xmax-xmin)*rand(num_particle,D);

V=0.5*(xmax-xmin)*rand(num_particle,D); 
%**********************************************************

fitness=zeros(num_particle,1);% each particle's fitness value for all iterations
pbest=zeros(num_particle,D); % each particle's position for all iteration
for i=1:num_particle
    %选择符合要求的粒子
    Pg1=particle(i,:);
    Pg2=100-Pg1;
    if 0<=Pg2&&Pg2<=50
        if sum(-flim<=S*[Pg1;Pg2;-100])==3
            if sum(S*[Pg1;Pg2;-100]<=flim)==3
             fitness(i)=fname(particle(i,:)');
            else
             fitness(i)=inf;  
            end
        else
             fitness(i)=inf;
        end
    else
             fitness(i)=inf;
    end 
    
end
pbest_value=fitness;
[C,I]=min(pbest_value);
gbest_value(1)=C;
gbest(1,:)=particle(I,:);  % save the best particle 's position 
   for i=1:num_particle; % for the 1st iteration, each particle's best position is themselves
       pbest(i,:)=particle(i,:);
   end
for iter=1:MaxIter 
W(iter)= startwaight - iter*waightstep;
% W(iter)=1;
V(:,:)=(W(iter)*V(:,:)+c1*rand*(pbest(:,:)...
    -particle(:,:))+c2*rand*(repmat(gbest(:,:),num_particle,1)-particle(:,:)));
particle(:,:)=particle(:,:)+V(:,:);
particle(:,:)=min(particle(:,:),xmax);% make all position <=255
particle(:,:)=max(particle(:,:),xmin);% make all position <=255
   for i=1:num_particle
        Pg1=particle(i,:);
    Pg2=100-Pg1;
    if 0<=Pg2&&Pg2<=50
        if sum(-flim<=S*[Pg1;Pg2;-100])==3
            if sum(S*[Pg1;Pg2;-100]<=flim)==3
             fitness(i)=fname(particle(i,:)');
            else
             fitness(i)=inf;  
            end
        else
             fitness(i)=inf;
        end
    else
             fitness(i)=inf;
    end 
   end
   %update pbest and pbest_value following
   pbest_value(:)=min(pbest_value(:),fitness(:));
   for temp=1:num_particle
     if pbest_value(temp)== fitness(temp)   
        pbest(temp,:)=particle(temp,:);
%      else
%         pbest(temp,:)=pbest(temp,:);
     end
   end
   % update gbest and gbest_value
   [C,I]=min(pbest_value(:));
   gbest_value=min(C,gbest_value);
   if gbest_value==C
        gbest(1,:)=pbest(I,:);  % save the best particle 's position (in other words, the best codebook)
%    else
%         gbest(1,:)=gbest(1,:);
   end
   CD(iter)=gbest_value;
    fprintf('%d\t%f\n',iter,gbest_value);
   iter=iter+1;
   
end
plot(1:MaxIter ,CD);
xlabel('迭代次数');
ylabel('目标函数值');
gbest_value
hold on;


