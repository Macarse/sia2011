function ret = differentEtas()
  params = getParams();

  number_of_epochs = [];
  i = 1;
  etas = [0.1:0.5:15];

  for eta=etas,
    params.eta = eta;
    errors = [];
    [errors, epochs] = main(params);
    number_of_epochs(i++) = epochs;
  end
  
  plot(etas, number_of_epochs);
end