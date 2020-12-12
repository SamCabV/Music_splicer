function [best_w] = end_weight(s1, s2, stop_s1)
weights = zeros(1,length(s2));
for i = 1:length(s2)
    weights(1,i) = diff_weight(s1, s2, stop_s1, i);
end
best_w = min(weights);
end

