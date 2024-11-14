function OutputName = Recognition(TestImage, m, A, Eigenfaces)


ProjectedImages = [];
Train_Number = size(Eigenfaces,2);
for i = 1 : Train_Number
    temp = Eigenfaces'*A(:,i); %e��ÿ������ͶӰ�������ռ�
    ProjectedImages = [ProjectedImages temp]; 
end

%%%%%%%%%%%%%%%%%%%%%%%% �Ӳ��������������ȡ����
InputImage = imread(TestImage);
temp = InputImage(:,:,1);

[irow icol] = size(temp);
InImage = reshape(temp',irow*icol,1);
Difference = double(InImage)-m; 
ProjectedTestImage = Eigenfaces'*Difference; % ����������ͶӰ�������ռ�

%%%%%%%%%%%%%%%%%%%%%%%% ����ŷʽ����ȡ��С��ԭ��ó�ƥ�������


Euc_dist = [];
for i = 1 : Train_Number
    q = ProjectedImages(:,i);
    temp = ( norm( ProjectedTestImage - q ) )^2;
    Euc_dist = [Euc_dist temp];
end
%ѡȡ��Сŷʽ���������
[Euc_dist_min , Recognized_index] = min(Euc_dist);
%��ȡ�����������ִ���
OutputName = strcat(int2str(Recognized_index),'.jpg');


