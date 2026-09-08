function [p] = calculate_situation(game_state_i, game_state_o)
% Determine probability of state transition based on gameplay situation
% game_state_i = [0, 0, 0, 0];
% game_state_o = [0, 0, 0, 0];
s_i = game_state_i(1); g_i = game_state_i(2); xg_i = game_state_i(3); t_i = game_state_i(4);
s_o = game_state_o(1); g_o = game_state_o(2); xg_o = game_state_o(3); t_o = game_state_o(4);

% 5on5
if (s_i == 0)
    % probability to 5on5
    if (s_o == 0)
        p = 0.7864;
    % probability to 5on4
    elseif (s_o == 1)
        p = 0.1068;
    % probability to 4on5
    elseif (s_o == -1)
        p = 0.1068;
    end

% 5on4
elseif (s_i == 1)
    % probability to 5on5
    if (s_o == 0)
        p = 0.7864;
    % probability to 5on4
    elseif (s_o == 1)
        p = 0.0956;
    % probability to 4on5
    elseif (s_o == -1)
        p = 0.1180;
    end

% 4on5
elseif (s_i == -1)
    % probability to 5on5
    if (s_o == 0)
        p = 0.7864;
    % probability to 5on4
    elseif (s_o == 1)
        p = 0.1180;
    % probability to 4on5
    elseif (s_o == -1)
        p = 0.0956;
    end

end