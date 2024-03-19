

%% init simulation

init_invpend

%% run simulation

record_video = true;
video_name = "invpend_with_PID2.avi";

% alter parameters:

invpend_use_resistance = true;

mdl = "invpend"; % the model to be run

paramStruct.StopTime = "20";

out = sim(mdl,paramStruct);

%% visualize results

cart_height = 1;
cart_width = 2;
arm_length = 2;

theta = out.theta.Data;
x = out.x.Data;
F = out.F.Data;

if record_video
    v = VideoWriter(video_name);
    open(v)
end

f = figure();
f.Position = [240,250,1000,500];
plot(x)

for i = 1:333:length(x)
    clf
    X = [x(i),x(i)-arm_length*sin(theta(i))];
    Y = [0,arm_length*cos(theta(i))];
    plot(X,Y)
    hold on
    rectangle('Position',[x(i)-(cart_width/2), -(cart_height/2),cart_width , cart_height])
    plot(x(i), 0, 'ro', 'MarkerSize', 5);
    plot(x(i)-arm_length*sin(theta(i)),arm_length*cos(theta(i)),'ro','MarkerSize',15);
    quiver(x(i),-cart_height,F(i),0,0,'linewidth',2);
    yline(-0.025,'b')
    yline(0.025,'b')
    xline(0,'--')
    grid on
    axis([-10 10 -5 5])
    pbaspect([2 1 1])
    title(i)
    pause(0.0001)
    
    if record_video
         frame = getframe(gcf);    
         writeVideo(v,frame);
    end
end

if record_video
   close(v)
end






