function present1
syms x f(x);
for n=0:5
    switch(n)
        case 0
        fplot(x,legendre1(n),[-1,1],'m');
        hold on;
        text(-0.4,0.9,'P_0(x)','color','m')
        case 1
        fplot(x,legendre1(n),[-1,1],'k');
        hold on;
        text(0.6,0.8,'P_1(x)','color','k')
        continue
        case 2
        fplot(x,legendre1(n),[-1,1],'b');
        hold on;
        text(0.1,-0.6,'P_2(x)','color','b')
        continue
        case 3
        fplot(x,legendre1(n),[-1,1],'g');
        hold on;
        text(0.5,-0.5,'P_3(x)','color','g')
        continue
        case 4
        fplot(x,legendre1(n),[-1,1],'c');
        hold on;
        text(-0.75,-0.5,'P_4(x)','color','c')
        continue
        case 5
        fplot(x,legendre1(n),[-1,1],'r');
        hold on;
        text(0.8,-0.5,'P_4(x)','color','r')
        continue
    end
    ax = gca;
    ax.XAxisLocation = 'origin';
    ax.YAxisLocation = 'origin';
end
hold off;