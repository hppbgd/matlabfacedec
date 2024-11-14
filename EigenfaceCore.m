function [m, A, Eigenfaces,D] = EigenfaceCore(T)
    

%%%求样本的平均向量
m = mean(T,2); % Computing the average face image m = (1/P)*sum(Tj's)    (j = 1 : P)
Train_Number = size(T,2);

%%%%计算每个样本与平均向量的差向量
A = [];  
for i = 1 : Train_Number
    temp = double(T(:,i)) - m; %计算每个样本的减去平均人脸
    A = [A temp]; % 合成一个N*N矩阵
end

%%%%%%%%%%%%%%%%%%%%%%%% 求解特征值和特征向量


L = A'*A; %.计算协方差矩阵
[V D] = eig(L); %.求特征向量和特征

% 选取特征向量
L_eig_vec = [];
for i = 1 : size(V,2) 
    if( D(i,i)>1 )
        L_eig_vec = [L_eig_vec V(:,i)];
    end
end

% 降维
Eigenfaces = A * L_eig_vec; % 特征脸获取

