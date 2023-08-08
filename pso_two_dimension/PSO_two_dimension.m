 clear all;
 clc ;
 
% 砞﹚﹍
fun_select = 3;
w_on = 0; %turn on the w weight
test_cnt = 100;


test_cnt_Pgd = zeros(test_cnt,1);
test_min_flag = 0;
for test_times = 1:test_cnt

population = 100; % 砞﹚采竤计秖
iteration = 50; % 砞﹚穓碝Ω计
% range = [-2 2]; % X 跑计絛瞅 0~5
% Vmax_xy = 2 ; % 砞﹚程硉
% Vmax = [Vmax_xy Vmax_xy];
c1=2;c2=2;Pid_x=[];

if(w_on == 1)
    w=0.9;
else
    w=1;
end
    
% w=1;

%---------------------------Function--------------------------------------% 
%---function_1---%
if(fun_select == 1)
    range = [-2 2]; % X 跑计絛瞅 0~5
end
%---function_2---%      Rosenbroke(R2)
if(fun_select == 2)
    range = [-5 5];
end
%---function_3---%      Modified Himmelblau Function(MH)   
if(fun_select == 3)
    range = [-5 5];
end
%---function_4---%      Easom(ES)   
if(fun_select == 4)
    range = [0 5];
end

%-------------------------Function End------------------------------------% 
Vmax_xy = (abs(range(1,1))+abs(range(1,2)))/2; % 砞﹚程硉
Vmax = [Vmax_xy Vmax_xy];

w_delta = (0.9-0.4)/iteration;

x_set = zeros(population,1);
y_set = zeros(population,1);
iteration_set=zeros(population,iteration);
pos_set=zeros(population,iteration);
pbest = zeros(1,population);
Pxi_xy = zeros(population ,2);
Pgd_xy = zeros(1,2);
Pgd_x = zeros(1,1);
Pgd_y = zeros(1,1);

% 玻ネ﹍
%  y = range(1,1) + rand(population,1).*( range(1,2)-range(1,1) );
Rand_2 = range(1,1) + rand(population,2).*( range(1,2)-range(1,1) );
Vid = rand(population,2);

% 砞﹚続莱﹍程
% Pgd = -(10^6);
% Pid(1:population,1) = -(10^6);

initial_value = 0.5;
Pgd = initial_value;
Pid(1:population,1) = initial_value;


% success_cnt = zeros(test_success,1);
Pgd_rec = zeros(iteration,1);

%test success ratio
% for s=1:test_success
%    success_flag = 0;
% 
    for p=1:iteration

                 
    %     if(success_ratio(p,1) == 99.99)
    % %     if( ((5 - abs(set_min - Pgd))/5*100) == 100)
    %         break;
    %     end
    %         success_ratio =  0.5- abs(set_min - Pgd);
    %         success_set(p,1) = p;
    %         success_set(p,2) = success_ratio;

       
        if(w_on == 1)
            w = w - w_delta;
        else
            w=1;
        end
        %--------------------------続莱ㄧ计--------------------------------%        
        if(fun_select == 1)
            fit = Rand_2(:,1).*exp(-Rand_2(:,1).^2.-Rand_2(:,2).^2);
        end     
        if(fun_select == 2)
           fit = 100.*(Rand_2(:,1).^2 - Rand_2(:,2)).^2 + (Rand_2(:,1) - 1).^2; 
        end
        if(fun_select == 3)
           fit = (Rand_2(:,2) + Rand_2(:,1).^2 - 11).^2 + (Rand_2(:,1) + Rand_2(:,2).^2 - 7).^2 + Rand_2(:,1); 
        end  
        if(fun_select == 4)
           fit = -cos(Rand_2(:,1)).*cos(Rand_2(:,2)).*exp(-((Rand_2(:,1) - pi).^2 + (Rand_2(:,2) - pi).^2)); 
        end              
        %------------------------fit function end ------------------------%
        iteration_set(1:population,p) = fit;
        pos_set_x(1:population,p) = Rand_2(:,1);       
        pos_set_y(1:population,p) = Rand_2(:,2);
        % 纗,穝(Globe best value ; Pgd)
        % [PI,ix] = max(fit);
        [PI,ix] = min(fit);

        % if PI > Pgd
        if PI < Pgd
            Pgd = PI;
            Pgd_rec (p,1) = Pgd;
            Pgd_x(:,1) = Rand_2(ix,1)';
            Pgd_y(:,1) = Rand_2(ix,2)';
            Pgd_xy = Rand_2(ix,:);
        else
            Pgd_rec(p,1) = Pgd;
        end

    % 纗,穝(Particle best value ; Pid)
            for i=1:population

                % if fit(i) > Pid(i)
                if fit(i) < Pid(i)
                    Pid(i) = fit(i);
                    Pxi_xy(i,:) = Rand_2(i,:);
                    Pxi_x(:,1) = Rand_2(:,1);
                    Pxi_y(:,2) = Rand_2(:,2);
    %                 Pxi_xy = Pxi_x;
    %                 Pxi_xy(:,2) = Pxi_y(:,2);
                end

            % 穝(程硉猭)

                Vid(i,:) = w*Vid(i,:) + c1*rand*(Pxi_xy(i,:)-Rand_2(i,:)) + c2*rand*(Pgd_xy(1,:)-Rand_2(i,:));

                if Vid(i,:) > w*Vmax(1,:)
                    Vid(i,:) = w*Vmax(1,:);
                else
                    if Vid(i,:) < -w*Vmax(1,:)
                        Vid(i,:) = -w*Vmax(1,:);
                    end
                end

    %             if Vid(i) > Vmax
    %                 Vid(i) = Vmax;
    %             else
    %                 if Vid(i) < -Vmax
    %                 Vid(i) = -Vmax;
    %                 end
    %             end

            % 穝采竤竚
                Rand_2(i,:) = Rand_2(i,:)+Vid(i,:);
            % 琌Τ叉瞒﹍絛瞅
                if Rand_2(i,1)<range(1,1), Rand_2(i,1)=range(1,1); end
                if Rand_2(i,2)<range(1,1), Rand_2(i,2)=range(1,1); end
                if Rand_2(i,1)>range(1,2), Rand_2(i,1)=range(1,2); end            
                if Rand_2(i,2)>range(1,2), Rand_2(i,2)=range(1,2); end            
    %             if Rand_2(i,1)<range(1,1), Rand_2(i,1)=range(1,1); end
    %             if Rand_2(i,2)>range(1,2), Rand_2(i,2)=range(1,2); end      

            end

    end

    
    %-------------------find the convergence iteration -----------------%
    Pgd_rec_temp = zeros(iteration,1);
    Pgd_rec_temp = Pgd_rec;
    
    min_num = min(Pgd_rec_temp);
    if (test_min_flag == 0)
        test_min = min_num;
        test_min_flag = 1;
    end
    
    for find_min = 1:iteration
        if(Pgd_rec_temp(find_min,1) > min_num+0.00001)
            Pgd_rec_temp(find_min,1) = 0;
        end
    end
    
    [aa,bb]= find(Pgd_rec_temp);
    min_iteraion = min(aa);
    
%    test_cnt_Pgd(test_times,1) = min_num / test_min;
   test_cnt_Pgd(test_times,1) = min_num;
   
 %-------------------find the convergence iteration End-----------------%
end
   


    
%------- 瓜 -------%
% hold on
% figure('position',[200,200,1024,768]);

%%%plot parameter setup
row = 2;
column = 2;
for cnt = 1:iteration

    
% figure(cnt);    
figure(1)
% figure('position',[200,200,1024,768]);

X = range(1,1):0.1:range(1,2);
Y = range(1,1):0.1:range(1,2);

%%%% main function picture
[xx,yy] = meshgrid(X,Y);

%-------------Function-------------------%
if(fun_select == 1)
    zz = xx.*exp(-xx.^2-yy.^2);
end
if(fun_select == 2)
    zz = 100.*(xx.^2 - yy).^2 + (xx - 1).^2;
end
if(fun_select == 3)
    zz = (yy + xx.^2 - 11).^2 + (xx + yy.^2 - 7).^2 + xx; 
end
if(fun_select == 4)
    zz = -cos(xx).*cos(yy).*exp(-((xx - pi).^2 + (yy - pi).^2)); 
end

%------------Function End -----------------%
%%%% Particle flying
z_set = iteration_set(1:population,cnt);
x_set = pos_set_x(1:population,cnt);
y_set = pos_set_y(1:population,cnt);


subplot(row,column,1);
surf(xx, yy ,zz);
view(3);
grid on
hold on
%%%plot particle group flying
plot3(x_set,y_set,z_set,'w*','linewidth',1);
%%%plot Group best particle
plot3(Pgd_x,Pgd_y,Pgd,'ro','linewidth',7);
hold off
title(['采计 = ',num2str(population),' ,舼计 = ',num2str(iteration)])
zlabel('続莱fit');

subplot(row,column,2);
% surf(xx,yy,zz);
[c,handle] = contour(xx,yy,zz,50);
% clabel(c,handle);
view(2);
grid on
hold on
plot3(x_set,y_set,z_set,'k*','linewidth',1);
plot3(Pgd_x,Pgd_y,Pgd,'ro','linewidth',7);
hold off
title([', 程ㄎ把计x = ',num2str(Pgd_x),', 程ㄎ把计y = ',num2str(Pgd_y),', 程ㄎ続莱fit = ',num2str(Pgd),', 计 = ',num2str(cnt)])



subplot(row,column,3);
surf(xx,yy,zz);
view([-90,0]);
grid on
hold on
plot3(x_set,y_set,z_set,'w*','linewidth',1);
plot3(Pgd_x,Pgd_y,Pgd,'ro','linewidth',7);
zlabel('続莱fit');
hold off


% subplot(row,column,4);
% surf(xx,yy,zz);
% view([0,0]);
% grid on
% hold on
% plot3(x_set,y_set,z_set,'w*','linewidth',1);
% plot3(Pgd_x,Pgd_y,Pgd,'ro','linewidth',7);
% hold off

subplot(row,column,4);
plot(Pgd_rec,'-r');
hold on
grid on
xlabel('计');
ylabel('続莱fit');
title(['Μ滥计 = ',num2str(min_iteraion),'  0.00001 跌Μ滥'])


% subplot(row,column,5);
% contour(xx,yy,zz,50);
% view(3);
% grid on
% hold on
% plot3(Pgd_x,Pgd_y,test_cnt_Pgd(:,1),'ro','linewidth',7);

end

figure
plot(test_cnt_Pgd(:,1),'-r');
xlabel('代刚Ω计');
ylabel('続莱fit');
title(['代刚Ω计 = ',num2str(test_times)])

% figure
% % subplot(row,column,4);
% plot(Pgd_rec,'-r');
% hold on
% grid on

% subplot(row,column,4);
% plot(success_ratio,'-r');
% hold on
% grid on

% subplot(3,2,5);
% plot(success_cnt,'-r');
% hold on
% grid on

hold off