function ret = init_weights(params)

    ret = {};

    % set the random weights
    if isempty(params.hidden) == false
        % + 1 for the threshold
        % inputs to first row of hidden
        ret(1) = params.MIN_WEIGHT + (params.MAX_WEIGHT - params.MIN_WEIGHT) .*\
            rand(params.INPUTS_QTY + 1,params.hidden(1)+1);

        % intermediate layers in hiddden layers
        for i=2:length(params.hidden),
            ret(i) = params.MIN_WEIGHT + (params.MAX_WEIGHT - params.MIN_WEIGHT) .* rand(params.hidden(i-1) + 1,params.hidden(i)+1);
        end
        
        % last hidden layer to outputs
        ret(length(params.hidden)+1) = params.MIN_WEIGHT + (params.MAX_WEIGHT - params.MIN_WEIGHT) .* rand(params.hidden(length(params.hidden)) + 1, params.OUTPUTS_QTY);
    else
        ret(1) = params.MIN_WEIGHT + (params.MAX_WEIGHT - params.MIN_WEIGHT) .* rand(params.INPUTS_QTY + 1, params.OUTPUTS_QTY); 
    end

end