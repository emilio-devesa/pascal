program minimo_ejemplo (input, output);
{ En este ejemplo implementaremos una cuenta atrás que puede definir el usuario }

{ Todavia no vamos a usar esto, lo haremos si usamos modulos. Por eso queda entre comentarios }
{ import;
  export; }


const
	CERO = 0;


type
	tContador = RECORD
		actual: integer;
		final: integer;
	END;

var
	contador: tContador;


procedure PonerACero (var c: tContador);
{ Este procedimiento pone el valor final del contador a CERO }
begin
	c.final := CERO;
end;


procedure Descontar (var c: tContador);
begin
	c.actual := c.actual - 1;
end;


function EstablecerInicio: integer;
{ Esta función pregunta al usuario el valor inicial del contador }
var n: integer;
begin
	write ('introducir numero inicial: ');
	readln (n);
	EstablecerInicio := n;
end;


procedure ComenzarCuentaAtras (var c: tContador);
begin
	while c.actual <> c.final do begin
		Descontar (c);
		writeln (c.actual);
	end;
end;



begin
	PonerACero (contador);
	contador.actual := EstablecerInicio;
	ComenzarCuentaAtras (contador);
	writeln ('Se llego al final.');
	readln;
end.
