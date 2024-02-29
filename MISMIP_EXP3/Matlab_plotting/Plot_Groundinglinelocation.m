function Plot_Groundinglinelocation

files = dir("../ResultsFiles/*.mat");

H=figure; hold on;
G=figure; hold on;
CM = jet(numel(files));

for nn=1:numel(files)

    load(files(nn).folder+"/"+files(nn).name);

    CtrlVar.PlotGLs = 0;
    [xGL,yGL] = PlotGroundingLines(CtrlVar,MUA,GF);

    GL1d(nn) = mean(xGL,"all",'omitnan');
    time(nn) = CtrlVar.time;

    figure(G);
    if nn==1
        plot(MUA.coordinates(:,1),F.B,'.k');
    end
    plot(MUA.coordinates(:,1),F.b,'.','color',CM(nn,:));
    plot(MUA.coordinates(:,1),F.s,'.','color',CM(nn,:));


    figure(H);  
    plot(xGL/1e3,yGL/1e3,'color',CM(nn,:));
   

end

figure(H); %xlim([]); 
ylim([-10 10]);

figure; plot(time,GL1d); grid minor; box on;

