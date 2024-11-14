function T = CreateDatabase(TrainDatabasePath)
   


%%%%%%%��ȡѵ����·������ͳ����������
TrainFiles = dir(TrainDatabasePath);
Train_Number = 0;

for i = 1:size(TrainFiles,1)
    if not(strcmp(TrainFiles(i).name,'.')|strcmp(TrainFiles(i).name,'..')|strcmp(TrainFiles(i).name,'Thumbs.db'))
        Train_Number = Train_Number + 1; % Number of all images in the training database
    end
end


%%%%%%%%��2άͼ��ת��Ϊһά����
T = [];
for i = 1 : Train_Number
    
%��ȡͼ������ִ���
    str = int2str(i);
    str = strcat('\',str,'.jpg');
    str = strcat(TrainDatabasePath,str);
    
    img = imread(str);
    img = rgb2gray(img);
    
    [irow icol] = size(img);
   
    temp = reshape(img',irow*icol,1);   % ����ά����ת��Ϊһά����
    T = [T temp];                    
end