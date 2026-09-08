function [p] = calculate_time(game_state_i, game_state_o)
% Determine probability of state transition based on time
% game_state_i = [0, 0, 0, 0];
% game_state_o = [0, 0, 0, 0];
s_i = game_state_i(1); g_i = game_state_i(2); xg_i = game_state_i(3); t_i = game_state_i(4);
s_o = game_state_o(1); g_o = game_state_o(2); xg_o = game_state_o(3); t_o = game_state_o(4);

% time
if (t_i < t_o)
    p = 0;
elseif (t_i == 0)
    if (s_i == s_o && g_i == g_o && xg_i == xg_o)
        p = 1;
    else
        p = 0;
    end
elseif (t_i - t_o == 0)
    p = 0.5;
elseif (t_i - t_o <= 10)
    p = 0.5;
else
    p = 0;
end