function [m, A, Eigenfaces,D] = EigenfaceCore(T)
    

%%%��������ƽ������
m = mean(T,2); % Computing the average face image m = (1/P)*sum(Tj's)    (j = 1 : P)
Train_Number = size(T,2);

%%%%����ÿ��������ƽ�������Ĳ�����
A = [];  
for i = 1 : Train_Number
    temp = double(T(:,i)) - m; %����ÿ�������ļ�ȥƽ������
    A = [A temp]; % �ϳ�һ��N*N����
end

%%%%%%%%%%%%%%%%%%%%%%%% �������ֵ����������


L = A'*A; %.����Э�������
[V D] = eig(L); %.����������������

% ѡȡ��������
L_eig_vec = [];
for i = 1 : size(V,2) 
    if( D(i,i)>1 )
        L_eig_vec = [L_eig_vec V(:,i)];
    end
end

% ��ά
Eigenfaces = A * L_eig_vec; % ��������ȡ

