% set up data sessions
%
%% for 2021 dataset
subjLists = {'bb27/mri0/','bb41/mri0/','bb62/mri0/','bb28/mri3/'};
origDataDir = '/oak/stanford/groups/kalanit/biac2/kgs/projects/babybrains/mri/';
dataDir = '/oak/stanford/groups/kalanit/biac2/kgs/projects/bbDWI_development/data/';

for s = 4%1:length(subjLists)
    tmpsubj = subjLists{s};
    tempsplit = strsplit(tmpsubj,'/');
    subj = tempsplit{1};
    sess = tempsplit{2};

    % move raw diffusion data to folder
    dir1 =  fullfile(origDataDir,subj,sess,'raw','dwi','HB*');
    destdir = fullfile(dataDir,subj,sess,'dwi');mkdir(destdir);
    cmd = ['cp -r ' dir1 ' ' destdir];
    system(cmd)

    % move t2 to folder
    dir2 = fullfile(origDataDir,subj,sess,'preprocessed_acpc','t2_biascorr_acpc.nii.gz');
    destdir = fullfile(dataDir,subj,sess,'preprocessed_acpc');mkdir(destdir);
    cmd = ['cp ' dir2 ' ' destdir];
    system(cmd)

    % move aseg.nii to folder
    dir3 = fullfile(origDataDir,subj,sess,'preprocessed_acpc','asegWithVentricles_reslice.nii.gz');
    destdir = fullfile(dataDir,subj,sess,'preprocessed_acpc');
    if ~exist(destdir,'dir')
        mkdir(destdir);
    end
    cmd = ['cp ' dir3 ' ' destdir];
    system(cmd)
end
%% for 2019 dataset
subjLists = {'bb27/mri0/','bb41/mri0/','bb62/mri0/'};
origDataDir = '/oak/stanford/groups/kalanit/biac2/kgs/projects/babybrains_cyto/mri/';
dataDir = '/oak/stanford/groups/kalanit/biac2/kgs/projects/bbDWI_development/data/';

for s = 2:length(subjLists)
    tmpsubj = subjLists{s};
    tempsplit = strsplit(tmpsubj,'/');
    subj = tempsplit{1};
    sess = tempsplit{2};

    % move raw diffusion data to folder
    dir1 =  fullfile(origDataDir,subj,sess,'raw','dwi','HB*');
    destdir = fullfile(dataDir,subj,sess,'dwi');mkdir(destdir);
    cmd = ['cp -r ' dir1 ' ' destdir];
    system(cmd)

    % move t2 to folder
    dir2 = fullfile(origDataDir,subj,sess,'preprocessed_acpc','t2_biascorr_acpc.nii.gz');
    destdir = fullfile(dataDir,subj,sess,'preprocessed_acpc');mkdir(destdir);
    cmd = ['cp ' dir2 ' ' destdir];
    system(cmd)

    % move aseg.nii to folder
    dir3 = fullfile(origDataDir,subj,sess,'preprocessed_acpc','asegWithVentricles_reslice.nii.gz');
    destdir = fullfile(dataDir,subj,sess,'preprocessed_acpc');
    if ~exist(destdir,'dir')
        mkdir(destdir);
    end
    cmd = ['cp ' dir3 ' ' destdir];
    system(cmd)
end


