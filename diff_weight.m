function [weight] = diff_weight(s1, s2, ref1, ref2)
diffs = s1(:,ref1) - s2(:,ref2);
weight = abs(mean(diffs));
end