time = linspace(0, 80, length(pitch_LQIDG));


plot(time, -refrence(:, 1), '--k', 'linewidth', 2);
hold on;
plot(time, pitch_LQIDG(:, 1)*180/pi, 'r', 'linewidth', 2);
hold off;
legend('Setpoint', 'LQIR-DG', 'Location','northeast', 'FontSize', 20);
axis([0 80 -40 50])
set(gca, 'FontSize', 16)
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 24);
ylabel('$\phi$(deg)', 'interpreter', 'latex', 'FontSize', 24);

plot(time, refrence(:, 2), '--k', 'linewidth', 2);
hold on;
plot(time, pitch_LQIDG(:, 1)*180/pi, 'r', 'linewidth', 2);
hold off;
legend('Setpoint', 'LQIR-DG', 'Location','northeast', 'FontSize', 20);
axis([0 80 -40 50])
set(gca, 'FontSize', 16)
xlabel('time($\sec)$', 'interpreter', 'latex', 'FontSize', 24);
ylabel('$\theta$(deg)', 'interpreter', 'latex', 'FontSize', 24);

