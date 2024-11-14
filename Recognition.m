function OutputName = Recognition(TestImage, m, A, Eigenfaces)


ProjectedImages = [];
Train_Number = size(Eigenfaces,2);
for i = 1 : Train_Number
    temp = Eigenfaces'*A(:,i); %e将每个样本投影到特征空间
    ProjectedImages = [ProjectedImages temp]; 
end

%%%%%%%%%%%%%%%%%%%%%%%% 从测试人脸库计算提取特征
InputImage = imread(TestImage);
temp = InputImage(:,:,1);

[irow icol] = size(temp);
InImage = reshape(temp',irow*icol,1);
Difference = double(InImage)-m; 
ProjectedTestImage = Eigenfaces'*Difference; % 将待测样本投影到特征空间

%%%%%%%%%%%%%%%%%%%%%%%% 按照欧式距离取最小的原则得出匹配的人脸


Euc_dist = [];
for i = 1 : Train_Number
    q = ProjectedImages(:,i);
    temp = ( norm( ProjectedTestImage - q ) )^2;
    Euc_dist = [Euc_dist temp];
end
%选取最小欧式距离的人脸
[Euc_dist_min , Recognized_index] = min(Euc_dist);
%获取该人脸的数字代号
OutputName = strcat(int2str(Recognized_index),'.jpg');


