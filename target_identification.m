%time = [25, 30, 35, 40, 45,55,60,65];
%speed_kts = [256, 264, 276, 289, 305];
%speed_kts = [210,300,350,400,450];
%speed_kts = [352,350,348,346,344,342,341,340];
%alt_ft = [14200,14000,13650,13450,13300,13200,13025,13000];
time = [25, 30, 35, 40, 45,50,55,60,65,70,75,80,85,90];
speed_kts = [92,92,90,87,85,82,80,72,58,50,42,33,21,11];
alt_ft = [1275,1200,1125,975,925,850,825,725,725,700,650,625,600,600];
speed = [];
alt = [];
rocd = [];

% conversion from kts to kmph and from feet to meters
for i = 1:length(speed_kts)
    speed(i) = speed_kts(i) * 1.852;
    alt(i) = alt_ft(i) * 0.3048;
end

disp('Speed in km/h:');
disp(speed);
disp('Altitude in meters:');
disp(alt);

% calculation of ROCD
for i = 1:(length(speed) - 1)
    cal = (alt(i + 1) - alt(i)) / (time(i + 1) - time(i));
    rocd(i) = cal;
end

disp('ROCD:');
disp(rocd);

heli_count = 0;
aeroplane_count = 0;
predicted_labels = zeros(1, length(speed)); 

% condition
for i = 1:length(speed)
    if speed(i) < 450 || alt(i) < 6096
        predicted_labels(i) = 1;  
        %predicted_labels(i) = 0;  
        heli_count = heli_count + 1;
        aeroplane_count = aeroplane_count + 1;
    elseif speed(i) < 1000 || alt(i) < 13716
        predicted_labels(i) = 0;  
        heli_count = heli_count - 1;
        aeroplane_count = aeroplane_count + 1;
    else
        predicted_labels(i) = 0;  
    end
end

disp('Predicted labels:');
disp(predicted_labels);

% calculating probability of helicopter or aeroplane
total_points = length(predicted_labels);
heli_probability = (sum(predicted_labels == 1) / total_points) * 100;
aeroplane_probability = (sum(predicted_labels == 0) / total_points) * 100;

disp(['Probability of Helicopter: ', num2str(heli_probability), '%']);
disp(['Probability of Aeroplane: ', num2str(aeroplane_probability), '%']);
