% split = splice_vect(cut_list{1},cut_list{2}, 1, size(cut_list{1},2), 1, size(cut_list{2},2));
% split = splice_vect(split,cut_list{3}, 1, size(split,2), 1, size(cut_list{3},2));
% split = splice_vect(split,cut_list{4}, 1, size(split,2), 1, size(cut_list{4},2));
% split = splice_vect(split,cut_list{5}, 1, size(split,2), 1, size(cut_list{5},2));
[x,t_exp] = to_signal(split,fs);
sound(x,fs)
% for i = 1:length(cut_list)
%     all_specs(1,i) = cut_list{i}
% end