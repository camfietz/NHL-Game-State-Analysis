% situation
s_list = [-1 0 1];
% state 1-343:    4on5:  -1
% state 344-686:  5on5:  0
% state 687-1029: 5on4:  1

% goal differential
g_list = [-3 -2 -1 0 1 2 3];
% state 1-49:    G:  -3
% state 50-98:   G:  -2
% state 99-147:  G:  -1
% state 148-196: G:  0
% state 197-245: G:  1
% state 246-294: G:  2
% state 295-343: G:  3

% xgoal differential
xg_list = [-2.4 -1.6 -0.8 0 0.8 1.6 2.4];
% state 1-7:     xG:  -2.4
% state 8-14:    xG:  -1.6
% state 15-21:   xG:  -0.8
% state 22-28:   xG:  0
% state 29-35:   xG:  0.8
% state 36-42:   xG:  1.6
% state 43-49:   xG:  2.4

% time remaining
t_list = [60 50 40 30 20 10 0];
% state 1:    t:  60
% state 2:    t:  50
% state 3:    t:  40
% state 4:    t:  30
% state 5:    t:  20
% state 6:    t:  10
% state 7:    t:  0

% state dimensions
s_dim = length(s_list);
g_dim = length(g_list);
xg_dim = length(xg_list);
t_dim = length(t_list);
n = s_dim*g_dim*xg_dim*t_dim;

% initialize probability, partials, win/loss/tie matrix
P = zeros(n);
p_s = zeros(n); p_g = zeros(n); p_xg = zeros(n); p_t = zeros(n);
win_index = []; loss_index = []; tie_index = [];

% calculate probabilities using functions
row = 1;
for x_s = -1:1
    for x_g = -3:3
        for x_xg = -2.4:0.8:2.4
            for x_t = 60:-10:0
                col = 1;
                for y_s = -1:1
                    for y_g = -3:3
                        for y_xg = -2.4:0.8:2.4
                            for y_t = 60:-10:0

                                p_s(row, col) = calculate_situation([x_s x_g x_xg x_t], [y_s y_g y_xg y_t]);
                                p_g(row, col) = calculate_goals([x_s x_g x_xg x_t], [y_s y_g y_xg y_t]);
                                p_xg(row, col) = calculate_xgoals([x_s x_g x_xg x_t], [y_s y_g y_xg y_t]);
                                p_t(row, col) = calculate_time([x_s x_g x_xg x_t], [y_s y_g y_xg y_t]);

                                col = col + 1;
                            end
                        end
                    end
                end
                row = row + 1;
            end
        end
    end
end

% determine win/loss/tie index
i = 1;
for x_s = -1:1
    for x_g = -3:3
        for x_xg = -2.4:0.8:2.4
            for x_t = 60:-10:0

                if (x_t == 0)
                    % if t = 0 and G > 0, probability of winning = 1
                    if (x_g > 0)
                        win_index = [win_index, i];
                    end
                    % if t = 0 and G < 0, probability of winning = 0
                    if (x_g < 0)
                        loss_index = [loss_index, i];
                    end
                    % else
                    if (x_g == 0)
                        tie_index = [tie_index, i];
                    end
                end

                i = i + 1;
            end
        end
    end
end

% generate probability matrix
P = p_s.*p_g.*p_xg.*p_t;
% normalize
P = P./sum(P,2);
