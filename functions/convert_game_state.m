function [game_state, index] = convert_game_state(s, g, xg, t)
% convert game state [s, g, xg, t] to game state for probability matrix

% possible states
s_list = [-1 0 1];
g_list = [-3 -2 -1 0 1 2 3];
xg_list = -2.4:0.8:2.4;
t_list = [60 50 40 30 20 10 0];

% situation
if (s == '5on5')
    s_o = 0;
elseif (s == '5on4')
    s_o = 1;
elseif (s == '4on5')
    s_o = -1;
end

% goals
g_o = round(g);
if (g >= 3)
    g_o = 3;
elseif (g <= -3)
    g_o = -3;
end

% expected goals
xg_o = round(xg/0.8)*0.8;
if (xg >= 2.4)
    xg_o = 2.4;
elseif (xg <= -2.4)
    xg_o = -2.4;
end

% time
t_o = round(t/10)*10;
if (t > 60)
    disp("time cannot be > 60");
    t_o = 60;
elseif (t < 0)
    disp("time cannot be < 0");
    t_o = 0;
end

% output
game_state = [s_o g_o xg_o t_o];

% corresponds to
s_index = find(s_list == s_o) - 1;
g_index = find(g_list == g_o) - 1;
xg_index = find(abs(xg_list - xg_o) < 1e-6) - 1;
t_index = find(t_list == t_o) - 1;

s_dim = length(s_list);
g_dim = length(g_list);
xg_dim = length(xg_list);
t_dim = length(t_list);
n = s_dim*g_dim*xg_dim*t_dim;

index = s_index*(n/(s_dim)) + g_index*(n/(s_dim*g_dim)) + xg_index*(n/(s_dim*g_dim*xg_dim)) + t_index*(n/(s_dim*g_dim*xg_dim*t_dim)) + 1;

end