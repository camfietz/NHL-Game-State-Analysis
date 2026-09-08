function [p] = calculate_xgoals(game_state_i, game_state_o)
% Determine probability of state transition based on xgoals
s_i = game_state_i(1); g_i = game_state_i(2); xg_i = game_state_i(3); t_i = game_state_i(4);
s_o = game_state_o(1); g_o = game_state_o(2); xg_o = game_state_o(3); t_o = game_state_o(4);

% 5on5
if (s_i == 0)

    xgoal_difference = xg_o - xg_i;
    p = skewednormpdf(xgoal_difference, 0, 0, 1);

% 5on4
elseif (s_i == 1)
    
    xgoal_difference = xg_o - xg_i;
    
    % + xG
    if (xgoal_difference >= 0)
        p = skewednormpdf(xgoal_difference, 0, 0, 1) * (1 + 0.1918);
    
    % - xG
    elseif (xgoal_difference < 0)
        p = skewednormpdf(xgoal_difference, 0, 0, 1) * (0.5 + 0.09567);
    
    end

% 4on5
elseif (s_i == -1)

    xgoal_difference = xg_o - xg_i;
    
    % + xG
    if (xgoal_difference > 0)
        p = skewednormpdf(xgoal_difference, 0, 0, 1) * (0.5 + 0.09567);
    
    % - xG
    elseif (xgoal_difference <= 0)
        p = skewednormpdf(xgoal_difference, 0, 0, 1) * (1 + 0.1918);
    
    end

end
