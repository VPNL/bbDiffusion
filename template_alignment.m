% function to align the neonate template and the ROIs to new BCP infant template
% XY 2022 
clc;clear;close all;
templatedir = '/share/kalanit/biac2/kgs/projects/babybrains/mri/code/AFQ/babyAFQ/templates/template_alignments/';
origTemplate = 'UNCNeo-withCerebellum-for-babyAFQ.nii.gz';
newTemplatelists = {'BCP-01M-T2.nii.gz','BCP-03M-T2.nii.gz','BCP-06M-T2.nii.gz','BCP-12M-T2.nii.gz'};
ROIdir = '/share/kalanit/biac2/kgs/projects/babybrains/mri/code/AFQ/babyAFQ/templates/template_alignments/UNC_Neo_tracts_ROIs/';
cd(templatedir)
%%
for t = 3:length(newTemplatelists)
%     %run this flirt in terminal instead, otherwise, the .mat file created
%     %use system(cmd) cannot be used..
%     cd(templatedir)
%     cmd = ['flirt -in ' origTemplate ' -ref ' newTemplatelists{t} ' -out UNCneo-to-' newTemplatelists{t} ' -omat UNCneo-to-' newTemplatelists{t}(1:end-7) '.mat'];
%     system(cmd)
    
    newROIdir = fullfile(templatedir,[newTemplatelists{t}(1:end-9),'ROIs']);
    mkdir(newROIdir);
    cd(ROIdir)
    roifiles = dir('*.nii.gz');
    roilists = {roifiles(:).name};

    for r = 1:length(roilists)
        cmd = ['flirt -in ' fullfile(ROIdir,roilists{r}) ...
            ' -ref ' fullfile(templatedir,newTemplatelists{t}) ...
            ' -out ' fullfile(newROIdir,roilists{r}) ...
            ' -init UNCneo-to-' newTemplatelists{t}(1:end-7) '.mat -applyxfm'];
        unix(cmd);
    end
end