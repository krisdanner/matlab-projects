lat = -3; lon = -48.326; h = 8336.28;
lat0 = -2.3310835100; lon0 = -44.4208387800; h0 = 58.826;

a = 6378137; e =  0.0818191908426215; %wgs84

N = a / sqrt(1 - e^2 * sind(lat)^2);

X = (N + h) * cosd(lat) * cosd(lon);
Y = (N + h) * cosd(lat) * sind(lon);
Z = (N * (1 - e^2) + h) * sind(lat);

x0 = (N + h0) * cosd(lat0) * cosd(lon0);
y0 = (N + h0) * cosd(lat0) * sind(lon0);
z0 = (N * (1 - e^2) + h0) * sind(lat0);

A = [-sind(lon0) cosd(lon0) 0; -sind(lat0)*cosd(lon0) -sind(lat0)*sind(lon0) cosd(lat0); 
cosd(lat0)*cosd(lon0) cosd(lat0)*sind(lon0) sind(lat0)]*[X-x0;Y-y0;Z-z0];

x = A(1);
y = A(2);
z = A(3);

if y > 0
    az = atand(x/y);
end

if y < 0
    az = atand(x/y) + 180;
end

if y == 0 && x > 0
    az = 90;
end

if y == 0 && x < 0
    az = 270;
end

if az < 0
    az = az + 360;
end

el = atand( (z*sind(az))/x );

dist = z/sind(el);

