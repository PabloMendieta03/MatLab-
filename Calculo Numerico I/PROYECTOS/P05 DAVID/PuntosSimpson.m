function I = PuntosSimpson(x, y)
    
    n = length(x);

    % Calculamos el ancho de los intervalos
    h = x(2) - x(1);
    
    % Verificar el número de intervalos
    num_intervalos = n - 1;
    
    I = 0;
    
    if mod(num_intervalos, 3) == 0
        % Método compuesto de Simpson 3/8
        for i = 1:3:num_intervalos-2
            I = I + (3*h / 8) * (y(i) + 3*y(i+1) + 3*y(i+2) + y(i+3));
        end
    elseif mod(num_intervalos, 3) == 1
        % Método trapezoidal para el primer intervalo
        I = (h / 2) * (y(1) + y(2));

        % Método compuesto de Simpson 3/8 para los intervalos restantes
        for i = 3:3:num_intervalos-2
            I = I + (3*h / 8) * (y(i) + 3*y(i+1) + 3*y(i+2) + y(i+3));
            
        end
    elseif mod(num_intervalos, 3) == 2
        % Método 1/3 de Simpson para los dos primeros intervalos
        I = (h / 3) * ( y(1) + 4*y(2) + y(3) );

        % Método compuesto de Simpson 3/8 para los intervalos restantes
        for i = 4:3:num_intervalos-2
            I = I + (3*h / 8) * (y(i) + 3*y(i+1) + 3*y(i+2) + y(i+3));
        end
    else
        error('Número de intervalos no válido para el método.');
    end
end
