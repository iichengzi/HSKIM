function [stat edges] = labels2edges_revised(labels)
%IMRAG ���������Ǿ��󣬻��ÿ�����ıߣ���imRAG��д��

% count number of regions
N = double(max(labels(:)));

if size(labels,3) ~=1
    error('��Ǿ����Ϊһά')
end

% size of label matrix
dim = size(labels);

%�����ڽӾ���
stat=zeros(N);

%//ͳ�Ƽ��㵱ǰ��ı�����ҡ��¡����¡����µı���Ƿ���ͬ��ȷ�������ڽӹ�ϵ

%---1.�������±仯����i�У�Ϊlabels(i+1,:��-labels(i,:��
diff1 = abs(diff(double(labels), 1, 1));

%��0Ԫ����ζ������ı仯
[rows cols] = find(diff1);

% �仯�ĵ�ǰλ�ú�����λ����labels�����ж�Ӧ������
indx1 = sub2ind(dim, rows, cols);
indx2 = sub2ind(dim, rows+1, cols);

%ͳ�ƾ��� 
num_1=numel(indx1);
for i=1:num_1
    stat(labels(indx1(i)),labels(indx2(i)))=stat(labels(indx1(i)),labels(indx2(i)))+1;
end

%ͳ�Ʊ�
edges = unique([labels(indx1) labels(indx2)], 'rows');

%---2.�������ұ仯����i�У�Ϊlabels(:��i+1��-labels(:,i��
diff2 = abs(diff(double(labels), 1, 2));

%��0Ԫ����ζ������ı仯
[rows cols] = find(diff2);

% �仯�ĵ�ǰλ�ú�����λ����labels�����ж�Ӧ������
indx1 = sub2ind(dim, rows, cols);
indx2 = sub2ind(dim, rows, cols+1);

%ͳ�ƾ���
num_2=numel(indx1);
for i=1:num_2
    stat(labels(indx1(i)),labels(indx2(i)))=stat(labels(indx1(i)),labels(indx2(i)))+1;
end

%ͳ�Ʊ�
edges = unique([edges; unique([labels(indx1) labels(indx2)], 'rows')],'rows');


%---3.�������¶ԽǱ仯����(i,j)��Ϊlabels(j+1��i+1��-labels(j,i��
diff3 =abs(labels(2:end,2:end)-labels(1:end-1,1:end-1));

%��0Ԫ����ζ������ı仯
[rows cols] = find(diff3);

% �仯�ĵ�ǰλ�ú�����λ����labels�����ж�Ӧ������
indx1 = sub2ind(dim, rows, cols);
indx2 = sub2ind(dim, rows+1, cols+1);

%ͳ�ƾ���
num_3=numel(indx1);
for i=1:num_3
    stat(labels(indx1(i)),labels(indx2(i)))=stat(labels(indx1(i)),labels(indx2(i)))+1;
end

%ͳ�Ʊ�
edges = unique([edges; unique([labels(indx1) labels(indx2)], 'rows')],'rows');

% %---�������¶ԽǱ仯����(i,j)��Ϊlabels(i��j+1��-labels(i+1,j��
diff4 =abs(labels(2:end,1:end-1)-labels(1:end-1,2:end));

%��0Ԫ����ζ������ı仯
[rows cols] = find(diff4);

% �仯�ĵ�ǰλ�ú�����λ����labels�����ж�Ӧ������
indx1 = sub2ind(dim, rows, cols+1);
indx2 = sub2ind(dim, rows+1, cols);

%ͳ�ƾ���
num_4=numel(indx1);
for i=1:num_4
    stat(labels(indx1(i)),labels(indx2(i)))=stat(labels(indx1(i)),labels(indx2(i)))+1;
end

%ͳ�Ʊ�
edges = unique([edges; unique([labels(indx1) labels(indx2)], 'rows')],'rows');


%���������ظ�
% format output to have increasing order of n1,  n1<n2, and
% increasing order of n2 for n1=constant.
edges = sortrows(sort(edges, 2));

% remove eventual double edges
edges = unique(edges, 'rows');
stat = floor(stat/2);


% if nargout == 1
%     varargout{1} = edges;
% end
% 
% if nargout == 2
%     varargout{1} = floor(stat/2);
%     varargout{2} = edges;
% end

