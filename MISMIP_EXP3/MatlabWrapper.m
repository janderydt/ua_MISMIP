%% setup Ua folders
[~,hostname]= system("hostname"); 
if strfind(hostname,"C23000100")
    run /mnt/md0/Ua/setup_Ua2D_alpha.m
    UserVar.hostname = "C23000100";
    NumWorkers = 1;
end

Ua2D;