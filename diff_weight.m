function [weight] = diff_weight(s1, s2, ref1, ref2)
if ref1 > size(s1,2)
    diffs = s1(:,size(s1,2)) - s2(:,ref2);
else
    diffs = s1(:,ref1) - s2(:,ref2);
end
weight = abs(mean(diffs));
end