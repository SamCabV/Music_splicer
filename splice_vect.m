function [s_spliced] = splice_vect(s1, s2, s1_start, s1_stop, s2_start, s2_stop)

split_s1 = s1(:,(s1_start:s1_stop));
split_s2 = s2(:,(s2_start:s2_stop));

s_spliced = [split_s1 split_s2];

end
