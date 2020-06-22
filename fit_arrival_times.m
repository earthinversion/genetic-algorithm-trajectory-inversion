function E=fit_arrival_times(pp,x,y,z)
%     [x,y,z,stn] = get_stations_coords();
    % pp: v, x0, y0, gamma, delta, t0
    c = 320; %shockwave speed in m/s
    beta = asin(c/pp(1));
    X = cos(pp(4))*sin(beta).*(x-pp(2)) + sin(pp(4))*sin(pp(5)).*(y-pp(3)) - cos(pp(5)).*z;
    Y = -sin(pp(4)).*(x-pp(2))+cos(pp(4)).*(y-pp(3));
    Z = cos(pp(4))*cos(pp(5)).*(x-pp(2))+ sin(pp(4))*cos(pp(5))*(y-pp(3))+sin(pp(5))*z;
    
    d_pre = ((sqrt(X.^2 + Y.^2)/tan(beta))-Z)/pp(1) + pp(6);
    d_pre = d_pre';
    dobs = [495.4 464.77 479.56 442.66 472.25 442.48 477.44 415.94 415.95 435.4 435.70 415.95 361.93];

    E=sum((dobs-d_pre).^2);
