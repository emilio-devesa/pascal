program if_for (input, output);

var numero: integer; condicion: boolean;

begin

	condicion := true;
	writeln ('sentencia if cuando la condicion es verdadera');
	if condicion = true
	then writeln ('es verdadera')
	else writeln ('es falsa');

	condicion := false;
	writeln ('sentencia if cuando la condicion es falsa');
	if condicion = true
	then writeln ('es verdadera')
	else writeln ('es falsa');

	writeln ('bucle for. escribe hola tres veces.');
	{
	 no hace falta inicializar antes el valor de numero, porque FOR ya
	 le asigna un valor inicial. Dejamos la linea comentada:
	 numero := 0;
	}
	for numero := 1 to 3 do writeln ('hola');
	
	writeln ('bucle while. escribe hola cinco veces.');
	numero := 1; {le damos un valor inicial}
	while numero <= 5 do begin
		writeln ('hola');
		numero := numero + 1; {si no avanzamos, seria un bucle infinito}
	end;
	
	writeln ('bucle repeat. escribe adios una sola vez');
	numero := 1; {siempre hay que asegurarse de los valores iniciales}
	repeat
		writeln ('adios');
		numero := numero + 1; {avanzamos la variable}
	until numero > 1; {en este caso solo se ejecutara una vez}
	{prueba a cambiar la condicion de until.}

end.
