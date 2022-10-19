clear all;

%Resolución del problema 4

%{
Se tienen 2 casos:
    CASO 1: a1b1c1, c2b2a2
    CASO 2: a1b1c1, a2b2c2
%}

%Se pide el caso de interés a resolver
caso = input('Ingrese caso que desea resolver (1 o 2):');

%Se plantean las distancias según el caso (1) o (2)
if caso == 1
    Da1b1 = 10.7703;
    Da1b2 = 22.3607;
    Da2b1 = 22.3886; 
    Da2b2 = 9.6566;
    Db1c1 = 9.6566;
    Db1c2 = 22.3607;
    Db2c1 = 22.3886;
    Db2c2 = 10.7703;
    Da1c1 = 19.0065;
    Da1c2 = 16;
    Da2c1 = 17;
    Da2c2 = 19.0065;
    Da1a2 = 25.1644;
    Db1b2 = 24;
    Dc1c2 = 25.1644;
else 
    Da1b1 = 10.7703;
    Da1b2 = 22.3607;
    Da2b1 = 22.3607; 
    Da2b2 = 10.7703;
    Db1c1 = 9.6566;
    Db1c2 = 22.3886;
    Db2c1 = 22.3886;
    Db2c2 = 9.6566;
    Da1c1 = 19.0065;
    Da1c2 = 25.1644;
    Da2c1 = 25.1644;
    Da2c2 = 19.0065;
    Da1a2 = 16;
    Db1b2 = 24;
    Dc1c2 = 17;
end

% Se calcula el GMD entre fase
DAB=(Da1b1*Da1b2*Da2b1*Da2b2)^(1/4);
DBC=(Db1c1*Db1c2*Db2c1*Db2c2)^(1/4);
DAC=(Da1c1*Da1c2*Da2c1*Da2c2)^(1/4);

% Y el GMD total por fase
GMD = (DAB*DBC*DAC)^(1/3);

% GMR inicial, diametro de conductores y espaciamiento
Ds = 0.017374;
r = (0.044069/2);
d = 0.45;

% Calculo de parámetros de subconductores
Db = sqrt(Ds*d);
rb = sqrt(r*d);

% Parametros para calculo de inductancia
DSA = sqrt(Db*Da1a2);
DSB = sqrt(Db*Db1b2);
DSC = sqrt(Db*Dc1c2);

% Parametros para calculo de capacitancia
rA = sqrt(rb*Da1a2);
rB = sqrt(rb*Db1b2);
rC = sqrt(rb*Dc1c2);

% Calculo de GMR de inductancia y capacitancia
GMRL = (DSA*DSB*DSC)^(1/3);
GMRC = (rA*rB*rC)^(1/3);

% Calculo de inductancia y capacitancia por unidad de longitud
L = 0.2*log(GMD/GMRL) % [mH/km]
C = 0.0556/log(GMD/GMRC) % [muF/km]

