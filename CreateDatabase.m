function T = CreateDatabase(TrainDatabasePath)
   


%%%%%%%读取训练库路径，并统计样本个数
TrainFiles = dir(TrainDatabasePath);
Train_Number = 0;

for i = 1:size(TrainFiles,1)
    if not(strcmp(TrainFiles(i).name,'.')|strcmp(TrainFiles(i).name,'..')|strcmp(TrainFiles(i).name,'Thumbs.db'))
        Train_Number = Train_Number + 1; % Number of all images in the training database
    end
end


%%%%%%%%将2维图像转化为一维向量
T = [];
for i = 1 : Train_Number
    
%获取图像的数字代号
    str = int2str(i);
    str = strcat('\',str,'.jpg');
    str = strcat(TrainDatabasePath,str);
    
    img = imread(str);
    img = rgb2gray(img);
    
    [irow icol] = size(img);
   
    temp = reshape(img',irow*icol,1);   % 将二维矩阵转换为一维矩阵
    T = [T temp];                    
end