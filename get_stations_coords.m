function [xx,yy,zz,stn] = get_stations_coords()
    % List of sac data files
    sacFiles={'LATB.HHZ.D.20131205.101000.v.sac'...
        'NST.HSZ.CWB_SMT.01_2013.339.v.sac'...
        'ENT.HSZ.CWB_SMT.01_2013.339.v.sac'...
        'YHNB.HHZ.D.20131205.101000.v.sac'...
        'TWE.HSZ.CWB_SMT.01_2013.339.v.sac'...
        'TIPB.HHZ.D.20131205.101000.v.sac'...
        'TWBB.HHZ.D.20131205.101000.v.sac'...
        'WFSB.HHZ.D.20131205.101000.v.sac'...
        'SXI1.HHZ.D.20131205.101000.v.sac'...
        'NWF.HSZ.CWB_SMT.01_2013.339.v.sac'...
        'TWS1.HSZ.CWB_SMT.01_2013.339.v.sac'...
        'YD07.HHZ.D.20131205.101000.v.sac'...
        'TWY.HSZ.CWB_SMT.01_2013.339.v.sac'};
    % extracting station lat, lon and station name information from the
    % header of the sac files
    stationHeader = cell(length(sacFiles),1);
    stn = cell(length(sacFiles),1);
    stnlat = cell(length(sacFiles),1);
    stnlon = cell(length(sacFiles),1);
    for ff=1:length(sacFiles)
        s1='./signal/';
        s2=sacFiles{ff};
        filename=strcat(s1,s2);
        [stationHeader{ff},]=load_sac(filename); 
        stn{ff}=strtrim(stationHeader{ff}.kstnm);
        stnlat{ff}=stationHeader{ff}.stla;
        stnlon{ff}=stationHeader{ff}.stlo;
    end
    station_info_table = table(stn, stnlat, stnlon);
    station_info_array = table2array(station_info_table);
    stn = station_info_array(:,1);
    x = station_info_array(:,2);
    y = station_info_array(:,3);

    xx = ones(length(x),1);
    yy = ones(length(x),1);
    zz = ones(length(x),1);
    for i=1:length(xx)
        xx(i) = x{i}; 
        yy(i) = y{i};
        zz(i) = 0;
    end



