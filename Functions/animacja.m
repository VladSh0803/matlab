function animacja(difficult)
% Author: Vladyslav Shestakov
% Polish:
% Gra Pong
% difficult oznacza poziom trudnosci i musi byc w przedziale [0, 1]
% English:
% Ping Pong game
% difficult must be in interval [0, 1]

if nargin < 1 || isempty(difficult)
    difficult = 0.5;
end
fh = figure('keypressfcn', @fh_kpfcn);
set(fh, 'toolbar', 'none', 'menubar', 'none');
ah = axes(fh);
set(ah, 'nextplot', 'add');
size = get(0, 'screensize');
size = size(3:4);
size = min(size);
step = 0.02;
e = 0.1;
step_angle = pi/250;
angle = 0:step_angle:2 * pi;
xb = 0;
yb = 0;
a = 0.2;
paddle_length = 4;
x1 = -30;
y1 = -30;
x2 = 30;
y2 = 30;
xp1 = (zeros(paddle_length / step + 1, 1) + x1)';
xp2 = (zeros(paddle_length / step + 1, 1) + x2)';
y = -(paddle_length / 2):step:paddle_length / 2;
x_ball = a * cos(angle) + xb;
y_ball = a * sin(angle) + yb;
ball = plot(x_ball, y_ball);
paddle1 = plot(xp1, y);
paddle2 = plot(xp2, y);
ball_pos = [x_ball; y_ball];
paddle1_pos = [xp1; y];
paddle2_pos = [xp2; y];
set(fh, 'position', [size * 0.2 size * 0.2 size * 0.7 size * 0.7]);
set(paddle1, 'linewidth', 4, 'color', 'black'    );
set(paddle2, 'linewidth', 4, 'color', 'black');
set(ball, 'linewidth', 4, 'color', 'black');
fillh = fill(x_ball, y_ball, 'black');
set(ah, 'visible', 'off');
axis([x1 x2 y1 y2]);

N = 5;
th = title(num2str(N), 'fontsize', 20, 'visible', 'on');
for N = N - 1:-1:0
    pause(1);
    set(th, 'string', num2str(N));
end
set(th, 'string', 'Go!');
pause(1);
ball_speed1 = 0.1;
ball_speed2 = 0.2;
ball_speed = 0.1;
paddle_speed = 0.1;
a = 2 * pi * rand(1);
while (a < e || a - pi / 2 < e || ...
        a - pi < e || a - pi * 3 / 2 < e)
    a = 2 * pi * rand(1);
end
goals1 = 0;
goals2 = 0;
set(th, 'string', [num2str(goals1) ':' num2str(goals2)]);
try
    while goals1 ~= 11 && goals2 ~= 11 && ishghandle(fh)
        set(paddle2, 'xdata', paddle2_pos(1, :), ...
            'ydata', paddle2_pos(2, :));
        set(paddle1, 'xdata', paddle1_pos(1, :), ...
            'ydata', paddle1_pos(2, :));
        set(ball, 'xdata', ball_pos(1, :), 'ydata', ball_pos(2,:));
        set(fillh, 'xdata', ball_pos(1, :), 'ydata', ball_pos(2, :));
        drawnow
        p = ball_speed * [cos(a); sin(a)];
        ball_pos = ball_pos + p;
        if (ball_pos(1, round(pi / step_angle)) < x1)
            ball_speed = (ball_speed2 - ball_speed1) * rand(1) + ...
                ball_speed1;
            if (paddle1_pos(2, 1) > ball_pos(2, round(end / 2)) || ...
                    paddle1_pos(2, end) < ball_pos(2, round(end / 4)))
                goals2 = goals2 + 1;
                set(th, 'string', [num2str(goals1) ':' num2str(goals2)]);
                a = 2 * pi * rand(1);
                while (a < e || abs(a - pi / 2) < e || ...
                        abs(a - pi) < e || abs(a - pi * 3 / 2) < e || ...
                        abs(a - pi * 2) < e)
                    a = 2 * pi * rand(1);
                end
                ball_pos = [x_ball; y_ball];
                paddle1_pos = [xp1; y];
                paddle2_pos = [xp2; y];
                set(ball, 'xdata', ball_pos(1, :), ...
                    'ydata', ball_pos(2, :));
                set(fillh, 'xdata', ball_pos(1, :), ...
                    'ydata', ball_pos(2, :));
                set(paddle2, 'xdata', paddle2_pos(1, :), ...
                    'ydata', paddle2_pos(2, :));
                set(paddle1, 'xdata', paddle1_pos(1, :), ...
                    'ydata', paddle1_pos(2, :));
                pause(1);
            else
                %a = min(a, a + rand_angle * rand(1));
                a = pi - a;
            end
            if (goals2 == 11)
                break;
            end
        end
        if (ball_pos(1, 1) > x2)
            ball_speed = (ball_speed2 - ball_speed1) * rand(1) + ...
                ball_speed1;
            if (paddle2_pos(2, 1) > ball_pos(2, 1) || ...
                    paddle2_pos(2, end) < ball_pos(2, round(3 * end / 4)))
                goals1 = goals1 + 1;
                set(th, 'string', [num2str(goals1) ':' num2str(goals2)]);
                a = 2 * pi * rand(1);
                while (a < e || a - pi / 2 < e || ...
                        a - pi < e || a - pi * 3 / 2 < e)
                    a = 2 * pi * rand(1);
                end
                ball_pos = [x_ball; y_ball];
                paddle1_pos = [xp1; y];
                paddle2_pos = [xp2; y];
                set(ball, 'xdata', ball_pos(1, :), ...
                    'ydata', ball_pos(2, :));
                set(fillh, 'xdata', ball_pos(1, :), ...
                    'ydata', ball_pos(2, :));
                set(paddle2, 'xdata', paddle2_pos(1, :), ...
                    'ydata', paddle2_pos(2, :));
                set(paddle1, 'xdata', paddle1_pos(1, :), ...
                    'ydata', paddle1_pos(2, :));
                pause(1);
            else
                %a = min(a, a + rand_angle * rand(1));
                a = pi - a;
            end
            if (goals1 == 11)
                break;
            end
        end
        if (ball_pos(2, round(end / 4)) > y2 ||...
                ball_pos(2, round(3 * end / 4)) < y1)
            ball_speed = (ball_speed2 - ball_speed1) * rand(1) + ...
                ball_speed1;
            %a = min(a, a + rand_angle * rand(1));
            a = 2 * pi - a;
        end
        paddle_move = sign(ball_pos(2, round(end / 2)) - ...
            paddle1_pos(2, round(end / 2)));
        if (paddle1_pos(2, end) + paddle_speed * difficult * paddle_move < y2 && ...
                paddle1_pos(2, 1) + paddle_speed * difficult * paddle_move > y1)
            paddle1_pos = paddle1_pos + paddle_speed * difficult * ...
                [0; paddle_move];
        end
        switch get(fh, 'currentcharacter')
            case 'w'
                if (paddle2_pos(2, end) < y2)
                    paddle2_pos = paddle2_pos + paddle_speed * [0; 1];
                end
            case 's'
                if (paddle2_pos(2, 1) > y1)
                    paddle2_pos = paddle2_pos - paddle_speed * [0; 1];
                end
        end
    end
catch
    return;
end

if (ishghandle(fh))
    if (goals1 == 11)
        result = 'Sorry, better luck next time';
    else
        result = 'Congratulations! You win!';
    end
    set(th, 'string', result);
end