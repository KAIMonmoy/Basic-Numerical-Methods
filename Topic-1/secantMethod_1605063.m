function [root, nIter] = secantMethod_1605063(func, xl, xu, es, maxIter)

    if(xl > xu)
        xl = xl + xu;
        xu = xl - xu;
        xl = xl - xu;
    end

    nIter = 0;
    ea = (1.1 * es + 0.1); %added .1 for handling ea = 0
    xr = 0;

    while (nIter < maxIter && ea > es)

        xr = xu - ( ( (xl - xu) * func(xu) ) / ( func(xl) - func(xu) ) ) ;
        nIter = nIter + 1;
        
        if (xr ~= 0 && nIter>1)
            ea = abs((xr-xu)/xr)*100;
        end

        xl = xu;
        xu = xr;

    end

    root = xr;

    fprintf('\nSecant method\n\n');
    fprintf('Estimated Root = %0.6f\n', root);
    fprintf('Function(Root) = %0.6f\n', func(root));
    fprintf('Approximate error = %0.6f\n', ea);
    fprintf('Number of iterations = %d\n', nIter);
