program abrir_ficheros_fpc (input, output);


uses sysutils;	{proporciona la funcion FileExists}


type
	{Nombre: 8 caracteres, 1 punto y 3 caracteres para la extension}
	tNombreFichero = string [12];	{en este ejemplo no se utiliza}
	tFicheroTexto = text;	{no es preciso marcarlo como bindable}


var f: tFicheroTexto; {Variable con la que manejaremos el fichero}


begin

	if FileExists ('prueba.txt')
	then begin
		{$i-} {Desactiva la comprobacion de errores de entrada/salida}
		assign(f, 'prueba.txt');
		{$i+} {Activa la comprobacion de errores de entrada/salida}
		if (IoResult <> 0)
		then begin
				writeln('Fichero prueba.txt no enlazado');
				halt(1);	{Termina el programa}
		end
		else writeln ('Fichero prueba.txt enlazado');
	end
	else writeln ('Fichero prueba.txt no existe');

end.
