% function to align the neonate template to new BCP infant template
%

templatedir = '/share/kalanit/biac2/kgs/projects/babybrains/mri/code/AFQ/babyAFQ/templates/template_alignments/';
origTemplate = 'UNCNeo-withCerebellum-for-babyAFQ.nii.gz';
newTemplatelists = {'BCP-01M-T2.nii.gz','BCP-03M-T2.nii.gz','BCP-06M-T2.nii.gz','BCP-12M-T2.nii.gz'};

cd(templatedir)
for t = 1%:length(newTemplatelists)
cmd = ['flirt -in ' origTemplate ' -ref ' newTemplatelists{t} ' -out UNCneo-to-' newTemplatelists{t} ' -omat UNCneo-to-' newTemplatelists{t}(1:end-7) '.mat'];
system(cmd)




end