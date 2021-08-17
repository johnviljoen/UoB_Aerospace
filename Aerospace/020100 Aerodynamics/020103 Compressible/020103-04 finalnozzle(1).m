function sliderSin

clear
f=figure('visible','off','position',...
    [360 500 800 800]);
slhan=uicontrol('style','slider','position',[100 680 600 40],...
    'min',0,'max',2.0,'callback',@updatenoz);
set(slhan,'Value',1.5);
set(slhan, 'SliderStep', [0.0005,0.1]);
hsttext=uicontrol('style','text',...
    'position',[420 740 40 15],'visible','off');
hsttext2=uicontrol('style','text',...
    'position',[300 740 120 15],'visible','off');
hsttext3=uicontrol('style','text',...
    'position',[100 740 80 15],'visible','off');
axes('units','pixels','position',[100 50 600 600]);
movegui(f,'center')
set(f,'visible','on');
    
function updatenoz(source,eventdata)   
    
Pexit=get(slhan,'value');
set(hsttext,'visible','on','string',num2str(Pexit,'%f%'))
set(hsttext2,'visible','on','string','P0=2, and Pexit=')
% x=linspace(0,4*pi);
% y=sin(num*x);
% plot(x,Mout);
% ax=gca;
% ax.XLim=[0 2*pi]

nsample=1000;
gam=1.403;
dx=1.0/(nsample-1);
x(1,1)=0.0;
x=zeros(nsample,1);
Msub=zeros(nsample,1);
Msuper=zeros(nsample,1);
Mout=zeros(nsample,1);
AonAthroat=zeros(nsample,1);
AonAstar=zeros(nsample,1);

P0_init=2.0;%(1+0.5*(gam-1)*Minit^2)^(gam/(gam-1))*1.0
%Pexit=0.75;

%this assumes choked at throat, ie that nozshape(1.0)=A/A*. We then get the
%subsonic and supersonic Mach numbers for these cases.
[Mexit_choked_sub,Mexit_choked_super]=Arat(nozshape(1.0));

P0onP_choked_exit=Prat(Mexit_choked_sub);
P_exit_choked_sub=(1/P0onP_choked_exit)*P0_init;

%the supersonic case has a normal shock exactly at the exit. For this case
%we need the P0/P at exit, followed by the normal shock.
P0onP_choked_exit=Prat(Mexit_choked_super)
[shockrat,mafter]=normshock(Mexit_choked_super);
Mexit_choked_super
mafter
shockrat
P0onP_after=Prat(mafter)
% shockrat is (total pressure after shock)/(static pressure before shock)
P_exit_choked_sup=(1/P0onP_after)*shockrat*(1/P0onP_choked_exit)*P0_init;

%ideal expansion case is 
Pideal=(1/Prat(Mexit_choked_super))*P0_init;

if(Pexit<P_exit_choked_sup)
    disp(' ')
    disp('Choked - supersonic')
    mode=3;
elseif((Pexit>P_exit_choked_sup)&(Pexit<P_exit_choked_sub))
    disp(' ')
    disp('Choked - transonic')
    mode=2;
elseif(Pexit>P_exit_choked_sub)
    disp(' ')
    disp('Subsonic')
    mode=1;
end


if(mode==1)
    
%start from the downstream condition. We know that at exit, static pressure
%is equal to the ambient downstream pressure
P0onPexit=P0_init/Pexit;
%from isentropic pressure relation
Mexit=sqrt((2*((P0onPexit)^((gam-1)/gam)-1))/(gam-1));
AonAstar_exit=Astar(Mexit);

%AonAstar_init=Astar(Minit);
AonAthroat_exit=nozshape(1.0);

AthroatonAstar=(1/AonAthroat_exit)*AonAstar_exit;

AonAthroat(1,1)=nozshape(x(1,1));
AonAstar(1,1)=(AonAthroat(1,1))*AthroatonAstar;
AthroatonAstarh=AthroatonAstar;
[Msub(1,1),Msuper(1,1)]=Arat(AonAstar(1,1));
Mout(1,1)=Msub(1,1);
Msub(1,1);
Msuper(1,1);
skip=50;

for i=2:nsample
  x(i,1)=x(i-1,1)+dx;
  [AonAthroat(i,1)]=nozshape(x(i,1));
  % in this case AthroatonAstar is NOT 1.0, as nozzle not choked
  AonAstar(i,1)=(AonAthroat(i,1))*AthroatonAstar;
  [Msub(i,1),Msuper(i,1)]=Arat(AonAstar(i,1));
  %if(x(i,1)>0.5)
      Mout(i,1)=Msub(i,1);
  %elseif(x(i,1)<0.5)
  %    Mout(i,1)=Msub(i,1);
  %end
  %disp('A/At     A/A*      M')  
   
end

%plot(x,Mout,x,AonAthroat)
set(hsttext3,'visible','on','string','Subsonic')
        
elseif(mode==2)
    
    % more fiddly - need to iterate on shock position, which must be
    % between 0.5 and 1.0. The shock position in x is 'mid'. It might lie
    % in the second half of the nozzle, between x=0.5 and x=1.0. It may
    % also be outside the nozzle, but this will lead to fully supersonic
    % flow in the nozzle.
    
    left=0.5;
    right=1.0;
    % this is used for plotting later only
    AthroatonAstarh=1.0;
    
    for i=1:20
    mid=0.5*(left+right);
    AonAstar(i,1)=nozshape(mid);
    
    %find the 2 possible Mach numbers
    [msub,msuper]=Arat(AonAstar(i,1));
    %select supersonic
    machup=msuper;
    %get pressure ratio (downstream total)/(upstream static) and Mach
    %number after shock
    [shockrat,mafter]=normshock(machup);
    P0onP_up=Prat(machup);
    
    %work out area ratio on exit
    AonAstar_after=Astar(mafter);
    AonAstar_exit=AonAstar_after*(nozshape(1.0)/nozshape(mid));
    
    %this one is for plotting only
    
    %AstarbeforeonAstarafter=1.0*(1/nozshape(mid))*Astar(mafter);
    AstarbeforeonAstarafter=(1/Astar(msuper))*Astar(mafter);
    
    %now compute exit Mach number and total pressure ratio
    [m1,m2]=Arat(AonAstar_exit);
    Mexit=m1;    
    P0onP_exit=Prat(Mexit);
    
    %this is a hypothetical exit pressure. We need to check to see how
    %close it is to the specified exit pressure, and then move the shock if
    %necessary
    Pexit_test=P0_init*(1/P0onP_exit)*shockrat*(1/P0onP_up);
    
    if(Pexit_test<Pexit)
        right=mid;
    else
        left=mid;
    end
    Pexit_test;
    Pexit;
    mid;
    
    end
    
    disp('Shock location | A/At at shock | A*_beforeshock/A*_aftershock | P0_aftershock/P_beforeshock');
    disp('-------------------------------------------------------------------------------------------');
    fprintf('%f           %f              %f                %f \n',mid,nozshape(mid),AstarbeforeonAstarafter,shockrat);
    disp(' ');
    disp('M_before | M_after | P0/P_before | P0/P_after | P0/P_exit');
    disp('-------------------------------------------------------------------------------------------');
    fprintf('%f   %f    %f     %f     %f\n',msuper,msub,Prat(msuper),Prat(msub),Prat(Mexit));
    disp(' ');
    %this is just a check to recalculate Pexit and make sure it matches the
    %specified value
    out=(1/Prat(Mexit))*shockrat*(1/Prat(msuper))*P0_init;
    fprintf('(1/(P0/P_exit))*(P0_aftershock/P_beforeshock)*(1/(P0/P_before))= %f \n',out);
    disp(' ');
    
 %now we know the shock location, set plotting variables
 %it's choked
 AonAthroat_init=nozshape(0.0);
 AthroatonAstar=1.0;
 AonAstar_init=(AonAthroat_init)*AthroatonAstar;
 [m1,m2]=Arat(AonAstar_init);
 Mout(1,1)=m1;
 AonAstar(1,1)=AonAstar_init;
 AonAthroat(1,1)=nozshape(x(1,1));
 
 for i=2:nsample
  x(i,1)=x(i-1,1)+dx;
  [AonAthroat(i,1)]=nozshape(x(i,1));
  
  if((x(i,1)>0.5)&(x(i,1)<mid))
      AthroatonAstar=1.0;
      AonAstar(i,1)=(AonAthroat(i,1))*AthroatonAstar;
      [Msub(i,1),Msuper(i,1)]=Arat(AonAstar(i,1));
      Mout(i,1)=Msuper(i,1);      
  elseif(x(i,1)<0.5)
      AthroatonAstar=1.0;
      AonAstar(i,1)=(AonAthroat(i,1))*AthroatonAstar;
      [Msub(i,1),Msuper(i,1)]=Arat(AonAstar(i,1));
      Mout(i,1)=Msub(i,1);
  elseif(x(i,1)>mid)
      %need care here, because A* has changed through the shock
      AonAstar(i,1)=nozshape(x(i,1))*(1/nozshape(mid))*Astar(mafter);%%%(AonAthroat(i,1))*AthroatonAstar;
      [Msub(i,1),Msuper(i,1)]=Arat(AonAstar(i,1));
      Mout(i,1)=Msub(i,1);
  end    
 end
  %plot(x,Mout)  AstarbeforeonAstarafter
  

    set(hsttext3,'visible','on','string','Transonic') 
    
elseif(mode==3)
    
%start from the downstream condition
P0onPexit=P0_init/Pexit;
Mexit=sqrt((2*((P0onPexit)^((gam-1)/gam)-1))/(gam-1));
AonAstar_exit=Astar(Mexit);

%it's choked
AonAthroat_exit=nozshape(1.0);

AthroatonAstar=1.0;%(1/AonAthroat_exit)*AonAstar_exit;

AonAthroat(1,1)=nozshape(x(1,1));
% in this case AthroatonAstar=1.0, as choked
AonAstar(1,1)=(AonAthroat(1,1))*1.0;
AthroatonAstarh=1.0;
[Msub(1,1),Msuper(1,1)]=Arat(AonAstar(1,1));
Mout(1,1)=Msub(1,1);
Msub(1,1);
Msuper(1,1);

for i=2:nsample
  x(i,1)=x(i-1,1)+dx;
  [AonAthroat(i,1)]=nozshape(x(i,1));
  % in this case AthroatonAstar=1.0, as choked
  AonAstar(i,1)=(AonAthroat(i,1))*1.0;
  [Msub(i,1),Msuper(i,1)]=Arat(AonAstar(i,1));
  if(x(i,1)>=0.5)
      Mout(i,1)=Msuper(i,1);
  elseif(x(i,1)<0.5)
      Mout(i,1)=Msub(i,1);
  end
end

if(Pexit<Pideal)
    set(hsttext3,'visible','on','string','Underexpanded') 
elseif(Pexit>Pideal)
    set(hsttext3,'visible','on','string','Overexpanded') 
end
     
end 
%AonAstarh=1.0;
ax(1,1)=0.45;
ax(2,1)=0.55;
ay(1,1)=1/AthroatonAstarh;
ay(2,1)=1/AthroatonAstarh;
plot(x,Mout,x,AonAthroat,ax,ay) 
legend('Mach','A/At','A*/At')
axis([0 1.0 0 2.5]) ;

disp('  A/At     A/A*      M');
for i=1:50:nsample
   fprintf('%f %f %f \n',AonAthroat(i,1),AonAstar(i,1),Mout(i,1));
end
fprintf('%f %f %f \n',AonAthroat(nsample,1),AonAstar(nsample,1),Mout(nsample,1));

end


function [Prat]=Prat(mach)

gam=1.403;
Prat=(1+0.5*(gam-1)*(mach^2))^(gam/(gam-1));

end

function [AonAstar]=Astar(mach)

gam=1.403;
AonAstar=(1/mach)*((2/(gam+1))*(1+0.5*(gam-1)*(mach^2)))^((gam+1)/(2*(gam-1)));

end

function [AonAthroat]=nozshape(x)
  % x from 0 to 1
  val=2.0;
  AonAthroat=val-(val-1.0)*(sin(x*pi))^2;
end

function [Msub,Msuper]=Arat(AonAstar)

%Mstart=0.3;
%M=0.5;
gam=1.403;
%AonAstar=(1/M)*((2/(gam+1))*(1+0.5*(gam-1)*(M^2)))^((gam+1)/(2*(gam-1)))

Msub=0.5;
for i=1:250
 Msub=(1/AonAstar)*((2/(gam+1))*(1+0.5*(gam-1)*(Msub^2)))^((gam+1)/(2*(gam-1)));
end
Msuper=1.5;
for i=1:250
 t1=Msuper*AonAstar;
 t2=(t1^(2*(gam-1)/(gam+1)))*(gam+1)/2.0;
 Msuper=sqrt((t2-1)*2/(gam-1));
end

end

function [shockrat,mafter]=normshock(machup)

gam=1.403;
mafter=sqrt((2.0+(gam-1)*(machup^2))/(2.0*gam*(machup^2)-(gam-1)));
% this it P0_down/P_up
shockrat=((0.5*(gam+1)*(machup^2))^(gam/(gam-1)))/( ((2*gam*machup^2-(gam-1))/(gam+1))^(1/(gam-1)) );

end


end