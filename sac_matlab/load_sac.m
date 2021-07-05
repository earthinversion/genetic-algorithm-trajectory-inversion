function [sachdr,data] = load_sac(filename)

%load_sac
%
%	Function to read header and data from an SAC file.
%	R. Aster, 3/2001.
%       usage:  [sachdr,data] = load_sac(filename)
%   R. Porritt, 8,2010
%       added checks against endian swapping and 32/64 bit systems
%       should work for all systems currently


[fid,message] = fopen(filename,'r','ieee-le');

%read in headers
if fid ~= -1
  [fheader,count] = fread(fid,70,'float');
  [nheader,count] = fread(fid,35,'long');
  [lheader,count] = fread(fid,5,'long');
  [kheader,count] = fread(fid,[8,24],'char');

  
  if (nheader(7) ~= 6)
     fclose(fid);
     [fid,message] = fopen(filename,'r','ieee-be');
     [fheader,count] = fread(fid,70,'float');
     [nheader,count] = fread(fid,35,'long');
     [lheader,count] = fread(fid,5,'long');
     [kheader,count] = fread(fid,[8,24],'char');
  end

  
% assign structure values from headers, using SAC naming convention

%strings
  sachdr.kstnm=char(kheader(:,1)');
  sachdr.kevnm=([char(kheader(:,2));char(kheader(:,3))])';
  sachdr.khole=char(kheader(:,4)');
  sachdr.ko=char(kheader(:,5)');
  sachdr.ka=char(kheader(:,6)');
  sachdr.kt0=char(kheader(:,7)');
  sachdr.kt1=char(kheader(:,8)');
  sachdr.kt2=char(kheader(:,9)');
  sachdr.kt3=char(kheader(:,10)');
  sachdr.kt4=char(kheader(:,11)');
  sachdr.kt5=char(kheader(:,12)');
  sachdr.kt6=char(kheader(:,13)');
  sachdr.kt7=char(kheader(:,14)');
  sachdr.kt8=char(kheader(:,15)');
  sachdr.kt9=char(kheader(:,16)');
  sachdr.kf=char(kheader(:,17)');
  sachdr.kuser0=char(kheader(:,18)');
  sachdr.kuser1=char(kheader(:,19)');
  sachdr.kuser2=char(kheader(:,20)');
  sachdr.kcmpnm=char(kheader(:,21)');
  sachdr.knetwk=char(kheader(:,22)');
  sachdr.kdatrd=char(kheader(:,23)');
  sachdr.kinst=char(kheader(:,24)');

%integers
  sachdr.nzyear = nheader(1);
  sachdr.nzjday = nheader(2);
  sachdr.nzhour = nheader(3);
  sachdr.nzmin = nheader(4);
  sachdr.nzsec = nheader(5);
  sachdr.nzmsec = nheader(6);
%this is a non-sac variable calculated from nzsec and nzmsec
  sachdr.sec = nheader(5) + (nheader(6)/1000);
  sachdr.nvhdr = nheader(7);
  sachdr.npts = nheader(10);
  sachdr.iftype = nheader(16);
  sachdr.idep = nheader(17);
  sachdr.iztype = nheader(18);
  sachdr.iqual = nheader(19);
  sachdr.isynth = nheader(20);

%longs
  sachdr.leven=lheader(1);
  sachdr.lpspol=lheader(2);
  sachdr.lovrok=lheader(3);
  sachdr.lcalda=lheader(4);

%floats
  sachdr.delta = fheader(1);
  sachdr.depmin = fheader(2);
  sachdr.depmax = fheader(3);
  sachdr.scale = fheader(4);
  sachdr.odelta = fheader(5);
  sachdr.b = fheader(6);
  sachdr.e = fheader(7);
  sachdr.o = fheader(8);
  sachdr.a = fheader(9);
  sachdr.t0 = fheader(11);
  sachdr.t1 = fheader(12);
  sachdr.t2 = fheader(13);
  sachdr.t3 = fheader(14);
  sachdr.t4 = fheader(15);
  sachdr.t5 = fheader(16);
  sachdr.t6 = fheader(17);
  sachdr.t7 = fheader(18);
  sachdr.t8 = fheader(19);
  sachdr.t9 = fheader(20);
  sachdr.resp0 = fheader(22);
  sachdr.resp1 = fheader(23);
  sachdr.resp2 = fheader(24);
  sachdr.resp3 = fheader(25);
  sachdr.resp4 = fheader(26);
  sachdr.resp5 = fheader(27);
  sachdr.resp6 = fheader(28);
  sachdr.resp7 = fheader(29);
  sachdr.resp8 = fheader(30);
  sachdr.resp9 = fheader(31);
  sachdr.stla = fheader(32);
  sachdr.stlo = fheader(33);
  sachdr.stel = fheader(34);
  sachdr.stdp = fheader(35);
  sachdr.evla = fheader(36);
  sachdr.evlo = fheader(37);
  sachdr.evel = fheader(38);
  sachdr.evdp = fheader(39);
  sachdr.user0 = fheader(41);
  sachdr.user1 = fheader(42);
  sachdr.user2 = fheader(43);
  sachdr.user3 = fheader(44);
  sachdr.user4 = fheader(45);
  sachdr.user5 = fheader(46);
  sachdr.user6 = fheader(47);
  sachdr.user7 = fheader(48);
  sachdr.user8 = fheader(49);
  sachdr.user9 = fheader(50);
  sachdr.dist = fheader(51);
  sachdr.az = fheader(52);
  sachdr.baz = fheader(53);
  sachdr.gcarc = fheader(54);
  sachdr.depmen = fheader(57);
  sachdr.cmpaz = fheader(58);
  sachdr.cmpinc = fheader(59);

%data
[data,count] = fread(fid,sachdr.npts,'float');

  close_stat = fclose(fid);
else
  disp(message)
  sachdr=0;
  data=0;
end
