% load dataset
dataset_train;

% PDFs
figure
g_d_pdf = histogram(goals,'Normalization','pdf');
ylabel("Frequency"); xlabel("Goals");
mean(goals), std(goals)

figure
xg_d_pdf = histogram(xgoals,'Normalization','pdf');
ylabel("Frequency"); xlabel("Expected Goals");
mean(xgoals), std(xgoals)

% CDFs
% g_d_cdf = histogram(goals,'Normalization','cdf');
% g_d_cdf = histogram(xgoals,'Normalization','cdf');
% plot(g_d_cdf.Values)