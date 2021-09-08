cmenv;
%Guardando los valores en un vector
maximos_pico_pos = [];
tiempos_pico_pos = [];
maximos_pico_neg = [];
tiempos_pico_neg = [];

% ciclo for para leer cada archivo de prueba
for prueba = 0:1:7
    archivo = ['Variation' ' ' num2str(prueba)];
    file = ([pwd, '\', 'line\',  archivo, '.erg'])
    CM = cmread(file);
    time_s = CM.Time.data';
    % convirtiendo los ángulos de radianes a grados
    TrailerAngle_deg = (CM.Tr_Hitch_dr_0_z.data') * (180/pi);
    %para el plot de cada gráfica
    %plot(time_s, TrailerAngle_deg)
    %xlabel('Time [s]')
    %ylabel('Angulo [deg]')
    %figure
    maximo_pulso_pos = max(TrailerAngle_deg);
    maximo_pulso_neg = min(TrailerAngle_deg);
    
    tp = 0;
    pos = 0;
    % por cada ángulo en el tiempo
    for t = 1: 1 : length(TrailerAngle_deg)
        pos = pos + 1;
        % si el valor absoluto del grado es el del mp encontrado
        if (TrailerAngle_deg(pos)) == maximo_pulso_pos
            mp_pos = TrailerAngle_deg(pos);
            tp_pos = time_s(t);
        end
        if (TrailerAngle_deg(pos)) == maximo_pulso_neg
            mp_neg = TrailerAngle_deg(pos);
            tp_neg = time_s(t);
        end
    end
    % maximo sobre impulso e-04
    maximos_pico_pos(end + 1) = mp_pos;
    maximos_pico_neg(end + 1) = mp_neg;
    tiempos_pico_pos(end + 1) = tp_pos;
    tiempos_pico_neg(end + 1) = tp_neg;
end
maximos_pico_pos
tiempos_pico_pos
%PARA EL MÁXIMO IMPULSO Positivo
media_mp_pos = mean(maximos_pico_pos);
moda_mp_pos = mode(maximos_pico_pos);
meadian_mp_pos = median(maximos_pico_pos);
std_mp_pos = std(maximos_pico_pos);
var_mp_pos = var(maximos_pico_pos);
fprintf("Media MP positivo: %d\t", media_mp_pos);
fprintf(",varianza MP positivo: %d\t", var_mp_pos);
fprintf(",desviación std MP positivo: %d\n", std_mp_pos);

%PARA EL TIEMPO MÁXIMO IMPULSO Positivo
media_tp_pos = mean(tiempos_pico_pos);
moda_tp_pos = mode(tiempos_pico_pos);
meadian_tp_pos = median(tiempos_pico_pos);
std_tp_pos = std(tiempos_pico_pos);
var_tp_pos = var(tiempos_pico_pos);
fprintf("Media TP positivo: %d\t", media_tp_pos);
fprintf(",varianza TP positivo: %d\t", var_tp_pos);
fprintf(",desviación std TP positivo: %d\n", std_tp_pos);

maximos_pico_neg
tiempos_pico_neg
%PARA EL MÁXIMO IMPULSO Negativo
media_mp_neg = mean(maximos_pico_neg);
moda_mp_neg = mode(maximos_pico_neg);
meadian_mp_pos = median(maximos_pico_neg);
std_mp_neg = std(maximos_pico_neg);
var_mp_neg = var(maximos_pico_neg);
fprintf("Media MP negativo: %d\t", media_mp_neg);
fprintf(",varianza MP negativo: %d\t", var_mp_neg);
fprintf(",desviación std MP negativo: %d\n", std_mp_neg);

%PARA EL TIEMPO MÁXIMO IMPULSO Negativo
media_tp_neg = mean(tiempos_pico_neg);
moda_tp_neg = mode(tiempos_pico_neg);
meadian_tp_neg = median(tiempos_pico_neg);
std_tp_neg = std(tiempos_pico_neg);
var_tp_neg = var(tiempos_pico_neg);
fprintf("Media TP negativo: %d\t", media_tp_neg);
fprintf(",varianza TP negativo: %d\t", var_tp_neg);
fprintf(",desviación std TP negativo: %d\n", std_tp_neg);
