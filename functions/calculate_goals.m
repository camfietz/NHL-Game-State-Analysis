function [p] = calculate_goals(game_state_i, game_state_o)
% Determine probability of state transition based on goals
s_i = game_state_i(1); g_i = game_state_i(2); xg_i = game_state_i(3); t_i = game_state_i(4);
s_o = game_state_o(1); g_o = game_state_o(2); xg_o = game_state_o(3); t_o = game_state_o(4);

goal_difference = g_o - g_i;
lambda = (xg_i - g_i) / (2.2395);

% scoring 5on5
if (s_i == 0)

    p = skewednormpdf(goal_difference, 0, lambda, 1);

% scoring 5on4
elseif (s_i == 1)
    
    % scoring a goal
    if (goal_difference > 0)
        p = skewednormpdf(goal_difference, 0, lambda, 1) * (1 + 0.1918);
    
    % allowing a goal
    elseif (goal_difference < 0)
        p = skewednormpdf(goal_difference, 0, lambda, 1) * (0.5 + 0.09567);
    
    % mid point
    elseif (goal_difference == 0)
        if (lambda >= 0)
            p = skewednormpdf(goal_difference, 0, lambda, 1) * (0.5 + 0.09567);
        else
            p = skewednormpdf(goal_difference, 0, lambda, 1) * (1 + 0.1918);
        end
    end

% scoring 4on5
elseif (s_i == -1)
    
    % scoring a goal
    if (goal_difference > 0)
        p = skewednormpdf(goal_difference, 0, lambda, 1) * (0.5 + 0.09567);
    
    % allowing a goal
    elseif (goal_difference < 0)
        p = skewednormpdf(goal_difference, 0, lambda, 1) * (1 + 0.1918);
        
    % mid point
    elseif (goal_difference == 0)
        if (lambda > 0)
            p = skewednormpdf(goal_difference, 0, lambda, 1) * (1 + 0.1918);
        else
            p = skewednormpdf(goal_difference, 0, lambda, 1) * (0.5 + 0.09567);
        end
    end

end
