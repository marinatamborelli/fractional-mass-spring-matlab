% Para mlf.m : Mittag-Leffler function Versión 1.2.0.0 por Igor Podlubny 
clc; clear; close all;

% Parâmetros físicos
m  = 1;        % massa
k  = 1;        % constante da mola
x0 = 1;        % posição inicial
v0 = 0;        % velocidade inicial

% Vetor de tempo
t = linspace(0, 20, 1000);

% Valores de alfa
alphas = [1.6 1.7 1.8 1.9 2];

figure;
hold on;
grid on;

for alpha = alphas
    % Termos da solução (divisão de termos para facilitar a digitação)
    term1 = mlf(alpha, 1, -(k/m)*t.^alpha) * x0;
    term2 = t .* mlf(alpha, 2, -(k/m)*t.^alpha) * v0;

    % Solução total (junção das duas partes da equação)
    x = term1 + term2;

    % Plot
    plot(t, x, 'LineWidth', 1.6, ...
        'DisplayName', ['\alpha = ' num2str(alpha)]);
end

xlabel('t');
ylabel('x(t)');
legend('Location','best');

% Para gerar o pdf automático da imagem:
set(gcf, 'Color', 'w');      % fundo branco
set(gca, 'FontSize', 12);   % fonte legível

exportgraphics(gcf, 'massa_mola_fracionario.pdf', ...
               'ContentType', 'vector');
