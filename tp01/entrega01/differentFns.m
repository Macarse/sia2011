function ret = differentFns()
  params = getParams();

  number_of_epochs = [];
  errors = [];

%    params = getParams();
%    [error, epochs] = main(params);
%    number_of_epochs(1) = epochs;
%    errors(1) = error;

%    params = getParams();
%    [error, epochs] = main(params);
%    number_of_epochs(1) = epochs;
%    errors(1) = error;
%  
    params = getParams();
    params.g = inline('(x>0) *1 -1*(x<0)');
    params.g_diff = inline('1');
    [error, epochs] = main(params);
    number_of_epochs(1) = epochs;
    errors(1) = error;

%    params = getParams();
%    params.g = inline('x*0.2');
%    params.g_diff = inline('0.2');
%    [error, epochs] = main(params);
%    number_of_epochs(1) = epochs;
%    errors(1) = error;

%  params = getParams();
%  params.g = inline(sprintf('1*(1./(1+exp(%f.*x))) - 0',-2*params.beta));
%  params.g_diff = inline(sprintf('1*(2 * %f .* (%s) .* (1 - (%s)))', params.beta, formula(params.g), formula(params.g)));
%  [error, epochs] = main(params);
%  number_of_epochs(1) = epochs;
%  errors(1) = error;
  
  
  errors
  number_of_epochs
