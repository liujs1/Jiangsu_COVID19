% read data
filename = 'Figure4data.xlsx';
sheet = 1;
jiangsu_xlRange = 'B2:C62';
quanguofeihubei_xlRange= 'D2:E53';
jiangsu_datas = xlsread(filename,sheet,jiangsu_xlRange);
quanguofeihubei_datas = xlsread(filename,sheet,quanguofeihubei_xlRange);
date_start = '20th Jan.';
figure
set(gcf,'position',[0,0,700,500]);
%% China non-Hubei confirmed
xdata=[1:52];
ydata=quanguofeihubei_datas(:,1);
xx=linspace(0,52,1000);
subplot(2,2,1)
% from python scipy fit
L = 1.28878246e+04;
x0 = 1.46906357e+01;
k =  2.56164276e-01;
yy = L ./ (1 + exp(-k.*(xx-x0))) ;

% first order derivative
syms x
f = L / (1 + exp(-k*(x-x0)));
df = diff(f,x);
dyy=subs(df,x,xx);
dyy=double(dyy);

hold on
truth = plot(xdata,ydata,'.','MarkerSize',15);
sigmoid = plot(xx,yy,'LineWidth',2);
[maxdyy,imaxdyy]=max(dyy);

xlim([-1,53]);
ylim([0,14000])
set(gca,'FontSize',14,'TickLabelInterpreter','latex')
xlabel('Days ($20^{th}$ Jan. 2020 as 1 on $x$-Axes)','FontSize',15,'Interpreter','latex');
ylabel({'Cumulative number of confirmed' ;'patients in China (non-Hubei)'},'FontSize',15,'Interpreter','latex');
xticks([0:5:55])
yticks([0:2000:15000])
twoorder1=plot([-2,-2],[-2,-3],'LineWidth',1.5);
twoorder2=plot([-2,-2],[-2,-3],'LineWidth',1.5);

yyaxis right
oneorder=plot(xx,dyy,'LineWidth',2);
plot(xx(imaxdyy).*[1,1],[0,maxdyy],'Color','black','LineWidth',1.5)

yyaxis left
plot(xx(imaxdyy),yy(imaxdyy),'o','Color','black','MarkerSize',15,'LineWidth',1.5)
title('$f(x) = \frac{12887.8246}{1+e^{-0.256164276\left(x-14.6906357\right)}}$','FontSize',16,'Interpreter','latex');
% text('Interpreter','latex','String','$f(x) = \frac{12887.8246}{1+e^{-0.256164276\left(x-14.6906357\right)}}$','FontSize',20)
text('String','(A)','FontSize',20,'Position',[0,13000])
text('Interpreter','latex','String','$3^{rd}$ Feb. 2020','FontSize',10,'Position',[xx(imaxdyy)+1,yy(imaxdyy)-1400])
set(gca,'linewidth',2.5);
legend([truth,sigmoid,oneorder,twoorder1],{'the truth','sigmoid fitting','$1^{st}$ order derivative','$2^{nd}$ order derivative'},'LineWidth',0.5,'Location','east','Interpreter','latex','FontSize',10)
% set(gca,'ygrid','on','gridlinestyle','-','Gridalpha',0.4,'LineWidth',0.5)
%% jiangsu confirmed
xdata=[1:61];
ydata=jiangsu_datas(:,1);
xx=linspace(0,61,1000);
subplot(2,2,2)
% from python scipy fit
L = 6.33346195e+02;
x0 = 1.54893645e+01;
k =  2.59140904e-01;
yy = L ./ (1 + exp(-k.*(xx-x0))) ;

% first order derivative
syms x
f = L / (1 + exp(-k*(x-x0)));
df = diff(f,x);
dyy=subs(df,x,xx);
dyy=double(dyy);

hold on
plot(xdata,ydata,'.','MarkerSize',15)
plot(xx,yy,'LineWidth',2)
[maxdyy,imaxdyy]=max(dyy);
xlim([-1,63]);
ylim([0,700])
set(gca,'FontSize',14,'TickLabelInterpreter','latex')
xlabel('Days ($20^{th}$ Jan. 2020 as 1 on $x$-Axes)','FontSize',15,'Interpreter','latex');
ylabel({'Cumulative number of confirmed' ;'patients in Jiangsu  Province'},'FontSize',15,'Interpreter','latex');
xticks([0:5:63])
yticks([0:100:700])
twoorder=plot([-2,-2],[-2,-3],'LineWidth',1.5);
twoorder=plot([-2,-2],[-2,-3],'LineWidth',1.5);

yyaxis right
plot(xx,dyy,'LineWidth',2)
plot(xx(imaxdyy).*[1,1],[0,maxdyy],'Color','black','LineWidth',1.5)

yyaxis left
plot(xx(imaxdyy),yy(imaxdyy),'o','Color','black','MarkerSize',15,'LineWidth',1.5)
title('$f(x) = \frac{633.346195}{1+e^{-0.259140904\left(x-15.4893645\right)}}$','FontSize',16,'Interpreter','latex');
% text('Interpreter','latex','String','$f(x) = \frac{12887.8246}{1+e^{-0.256164276\left(x-14.6906357\right)}}$','FontSize',20)
text('String','(B)','FontSize',20,'Position',[0,650])
text('Interpreter','latex','String','$4^{th}$ Feb. 2020','FontSize',10,'Position',[xx(imaxdyy)+3,yy(imaxdyy)])
set(gca,'linewidth',2.5);
% set(gca,'ygrid','on','gridlinestyle','-','Gridalpha',0.4,'LineWidth',0.5)

%% China non-Hubei cured
xdata=[1:52];
ydata=quanguofeihubei_datas(:,2);
xx=linspace(0,52,1000);
subplot(2,2,3)
% from python scipy fit
L = 1.26533205e+04;
x0 = 3.19805178e+01;
k =  1.81338448e-01;
yy = L ./ (1 + exp(-k.*(xx-x0))) ;

% first order derivative
syms x
f = L / (1 + exp(-k*(x-x0)));
df = diff(f,x);
% second order derivative
ddf = diff(df,x);

ddyy=subs(ddf,x,xx);
ddyy=double(ddyy);

hold on
plot(xdata,ydata,'.','MarkerSize',15)
plot(xx,yy,'LineWidth',2)
[maxddyy,imaxddyy]=max(ddyy);
[minddyy,iminddyy]=min(ddyy);

xlim([-1,53]);
ylim([0,14000])
set(gca,'FontSize',14,'TickLabelInterpreter','latex')
xlabel('Days ($20^{th}$ Jan. 2020 as 1 on $x$-Axes)','FontSize',15,'Interpreter','latex');
ylabel({'Cumulative number of cured' ;'patients in China (non-Hubei)'},'FontSize',15,'Interpreter','latex');
xticks([0:5:55])
yticks([0:2000:15000])
yyaxis right
plot(xx,ddyy,'LineWidth',2)
plot(xx(imaxddyy).*[1,1],[-50,maxddyy],'LineStyle','--','Color','black','LineWidth',1.5)

yyaxis left

plot(xx(iminddyy).*[1,1],[0,yy(iminddyy)],'LineStyle','--','Color','black','LineWidth',1.5)
plot(xx(iminddyy),yy(iminddyy),'o','Color','black','MarkerSize',15,'LineWidth',1.5)
plot(xx(imaxddyy),yy(imaxddyy),'o','Color','black','MarkerSize',15,'LineWidth',1.5)
title('$f(x) = \frac{12653.3205}{1+e^{-0.181338448\left(x-31.9805178\right)}}$','FontSize',16,'Interpreter','latex');
% text('Interpreter','latex','String','$f(x) = \frac{12887.8246}{1+e^{-0.256164276\left(x-14.6906357\right)}}$','FontSize',20)
text('String','(C)','FontSize',20,'Position',[0,13000])
text('Interpreter','latex','String','$13^{th}$ Feb. 2020','FontSize',10,'Position',[xx(imaxddyy)-3,yy(imaxddyy)],'HorizontalAlignment','right')
text('Interpreter','latex','String','$27^{th}$ Feb. 2020','FontSize',10,'Position',[xx(iminddyy)+3,yy(iminddyy)])
set(gca,'linewidth',2.5);
% set(gca,'ygrid','on','gridlinestyle','-','Gridalpha',0.4,'LineWidth',0.5)

%% jiangsu cured
xdata=[1:61];
ydata=jiangsu_datas(:,2);
xx=linspace(0,61,1000);
subplot(2,2,4)
% from python scipy fit
L = 6.29432005e+02;
x0 = 3.11901160e+01;
k =  1.96178022e-01;
yy = L ./ (1 + exp(-k.*(xx-x0))) ;

% first order derivative
syms x
f = L / (1 + exp(-k*(x-x0)));
df = diff(f,x);
% second order derivative
ddf = diff(df,x);

ddyy=subs(ddf,x,xx);
ddyy=double(ddyy);

hold on
plot(xdata,ydata,'.','MarkerSize',15)
plot(xx,yy,'LineWidth',2)
[maxddyy,imaxddyy]=max(ddyy);
[minddyy,iminddyy]=min(ddyy);

xlim([-1,63]);
ylim([0,700]);
set(gca,'FontSize',14,'TickLabelInterpreter','latex')
xlabel('Days ($20^{th}$ Jan. 2020 as 1 on $x$-Axes)','FontSize',15,'Interpreter','latex');
ylabel({'Cumulative number of cured' ;'patients in Jiangsu Province'},'FontSize',15,'Interpreter','latex');
xticks([0:5:63])
yticks([0:100:700])
yyaxis right
ylim([-5,5]);
plot(xx,ddyy,'LineWidth',2)
plot(xx(imaxddyy).*[1,1],[-5,maxddyy],'LineStyle','--','Color','black','LineWidth',1.5)

yyaxis left
plot(xx(iminddyy).*[1,1],[0,yy(iminddyy)],'LineStyle','--','Color','black','LineWidth',1.5)
plot(xx(iminddyy),yy(iminddyy),'o','Color','black','MarkerSize',15,'LineWidth',1.5)
plot(xx(imaxddyy),yy(imaxddyy),'o','Color','black','MarkerSize',15,'LineWidth',1.5)
title('$f(x) = \frac{629.432005}{1+e^{-0.196178022\left(x-31.1901160\right)}}$','FontSize',16,'Interpreter','latex');
% text('Interpreter','latex','String','$f(x) = \frac{12887.8246}{1+e^{-0.256164276\left(x-14.6906357\right)}}$','FontSize',20)
text('String','(D)','FontSize',20,'Position',[0,650])
text('Interpreter','latex','String','$12^{th}$ Feb. 2020','FontSize',10,'Position',[xx(imaxddyy)-3,yy(imaxddyy)],'HorizontalAlignment','right')
text('Interpreter','latex','String','$26^{th}$ Feb. 2020','FontSize',10,'Position',[xx(iminddyy)+3,yy(iminddyy)])

set(gca,'linewidth',2.5);
% set(gca,'ygrid','on','gridlinestyle','-','Gridalpha',0.4,'LineWidth',0.5)