function y = updateLearningRate(errors, actualEpoch, params )
    
    len = length(errors);
    deltaLearningRate = 0;
    
    % At least two epochs are needed.
    if (len >= 2),

        % If the error has increased we have to decrement the learning rate
        if (errors(actualEpoch) - errors(actualEpoch-1)) > 0,
            params.adaptive_eta_last_decremented = actualEpoch;

            if (errors(actualEpoch) - errors(actualEpoch - 1)) > params.adaptive_eta_decrement,
                deltaLearningRate = -1 * params.adaptive_eta_b * params.eta;
            endif

        % If the last params.adaptive_eta_steps have diminished the
        % error we are being too conservative, increment de learning rate!
        else if ((actualEpoch - params.adaptive_eta_last_decremented) >= params.adaptive_eta_steps),

                 if (sum(errors((actualEpoch - params.adaptive_eta_steps + 1):actualEpoch)) >= params.adaptive_eta_increment),
                    deltaLearningRate = params.adaptive_eta_a;
                 endif
            endif
        endif
    endif

    y = params.eta + deltaLearningRate;

end