function [best_min, I_best_min,start_s2, stop_s1] = findMinDifference(s1, s2, t_song)

stop_s1 = map(t_song, 0, 30, 1, length(s1));
stop_s1 = round(stop_s1);

min_list = zeros((length(s1)-stop_s1),3);
min_list = transpose(min_list);
for i = 1:length(min_list)
    new_stop = stop_s1 + i;
    [min_cut, I] = end_weight(s1,s2,new_stop);
    min_list(1,i) = min_cut;
    min_list(2,i) = I;
    min_list(3,i) = new_stop;
end

[best_min,I_best_min] = min(min_list(1,:));
start_s2 = min_list(2,I_best_min);
stop_s1 = min_list(3, I_best_min);

end