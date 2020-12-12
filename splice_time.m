  
function [s_spliced] = splice_time(s1, s2, t1_start, t1_stop, t2_start, t2_stop)
s1_start = round(map(t1_start, 0, 30, 1, length(s1)));
s1_stop = round(map(t1_stop, 0, 30, 1, length(s1)));
s2_start = round(map(t2_start, 0, 30, 1, length(s2)));
s2_stop = round(map(t2_stop, 0, 30, 1, length(s2)));

split_s1 = s1(:,(s1_start:s1_stop));
split_s2 = s2(:,(s2_start:s2_stop));

s_spliced = [split_s1 split_s2];

end