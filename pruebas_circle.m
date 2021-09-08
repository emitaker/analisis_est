cmenv;
%El numero que indicara que Validacion leer
numero = 0;
%Guardamos los valores en vectores
tp_vector = [];
mp_vector = [];
ts_vector = [];
for j = 0:1:7
    %disp(numero)
    %Obtenemos la direccion de cada archivo 
    archivo = ['Variation' ' ' num2str(numero)];
    file = ([pwd,'\','circle\',archivo,'.erg']);
    %disp(file)
    %Leemos cada archivo
    CM = cmread(file);
    %Obtenemos datos y ploteamos la graficas de cada prueba
    Time_s = CM.Time.data';
    TrailerAngle_deg = (CM.Tr_Hitch_dr_0_z.data)*(180/pi);
    plot(Time_s,TrailerAngle_deg)
    xlabel('Time [s]')
    ylabel('Trailer Angle [deg]')
    figure
    lugar = 0;
    inicio = 0;
    estado = true;
    estado_mayor = false;
    for i = TrailerAngle_deg
        lugar = lugar + 1;
        if i > 0.1 && estado == true
            %Obtenemos el timepo de inicio del cambio de grado cero al deseado.
            inicio = Time_s(lugar);
            estado = false;
        end
        if i > 50 && estado_mayor == false
            if TrailerAngle_deg(lugar + 1) < i
                %Obtenemos el maximp mp y el tp
                mp_1 = i;
                tp = Time_s(lugar);
                tp = tp-inicio;
                estado_mayor = true;
            end
        end
    end
    disp(file)
    %Obtenemos factpres deseados como mp, tp, wn y ts
    mp = (mp_1 - 50)/50;
    factor = (((log(mp))^2)/((log(mp))^2+pi^2))^0.5;
    Wn = pi/(tp*((1-(factor)^2)^0.5));
    ts = 4/(factor*Wn);
    numero = numero + 1;
    %Lo agregamos al vector para guardarlo
    mp_vector(end + 1) = mp;
    tp_vector(end + 1) = tp;
    ts_vector(end + 1) = ts;
end
%Hacemos el análisis estadístico de los vectores.
tp_vector
media_tp = mean(tp_vector);
moda_tp = mode(tp_vector);
median_tp = median(tp_vector);
std_tp = std(tp_vector);
var_tp = var(tp_vector);
fprintf("Media tp: %d\t", media_tp);
fprintf(",varianza tp: %d\t", var_tp);
fprintf(",desviación std tp: %d\n", std_tp);

mp_vector
media_mp = mean(mp_vector);
moda_mp = mode(mp_vector);
median_mp = median(mp_vector);
std_mp = std(mp_vector);
var_mp = var(mp_vector);
fprintf("Media mp: %d\t", media_mp);
fprintf(",varianza mp: %d\t", var_mp);
fprintf(",desviación std mp: %d\n", std_mp);
    
ts_vector
media_ts = mean(ts_vector);
moda_ts = mode(ts_vector);
median_ts = median(ts_vector);
std_ts = std(ts_vector);
var_ts = var(ts_vector);
fprintf("Media ts: %d\t", media_ts);
fprintf(",varianza ts: %d\t", var_ts);
fprintf(",desviación std ts: %d\n", std_ts);