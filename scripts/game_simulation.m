
game_analysis;
dataset_60;
time = 60;

total_correct = 0;
total_count = 0;
total_histogram = [];
win_high = 0; high_i = 0;
win_low = 100; low_i = 0;

for i = 1 : length(goals)
    test_g = goals(i);
    test_xg = xgoals(i);
    % test_s = situation(i);

    % create markov chain
    mc = dtmc(P);
    states = zeros(mc.NumStates,1);
    % state properties
    [game_state, index] = convert_game_state('5on5', 0, 0, time);
    states(index) = 1000; % simulations from game state
    steps = 25; % number of steps for each simulation
    sim = simulate(mc,steps,'X0',states);

    % calculate win percentage
    sim_end_points = sim(end,:);
    wins = 0; losses = 0; ties = 0;
    for j = 1 : length(sim_end_points)
        if any(win_index == sim_end_points(j))
            wins = wins + 1;
        end
        if any(loss_index == sim_end_points(j))
            losses = losses + 1;
        end
        if any(tie_index == sim_end_points(j))
            ties = ties + 1;
        end
    end

    win_percentage = wins / (wins + losses) * 100;
    fprintf('RESULTS: %d wins - %d losses - %d ties = %.2f%%\n', wins, losses, ties, win_percentage);
    total_histogram = [total_histogram win_percentage];

    if win_percentage >= 50
        total_correct = total_correct + 1;
    end
    total_count = total_count + 1;

    if win_percentage > win_high
        win_high = win_percentage;
        high_i = i;
    end
    if win_percentage < win_low
        win_low = win_percentage;
        low_i = i;
    end

end

correct_percentage = total_correct / total_count * 100
figure; g_d_pdf = histogram(total_histogram, 'BinEdges', linspace(0, 100, 11));
ylabel("Number of Games"); xlabel("Simulated Win %");