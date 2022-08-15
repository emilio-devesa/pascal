program abrir_ficheros_gpc (input, output);


type
	{Nombre: 8 caracteres, 1 punto y 3 caracteres para la extension}
	tNombreFichero = string (12);
	tFicheroTexto = bindable text;


var f: tFicheroTexto; {Variable con la que manejaremos el fichero}


function ExisteFicheroTexto (nombre: tNombreFichero): boolean;
{Objetivo: Comprueba si existe un fichero con nombre tNombreFichero
 PreCD: El fichero es externo (bindable)
 PosCD: Devuelve TRUE si existe o FALSE en caso contrario}
var b: bindingtype; f: tFicheroTexto;
begin
	unbind (f);			{desenlaza f de enlaces previos si hay}
	b := binding (f);	{ínicia b}
	b.name := nombre;
	bind (f, b);		{enlaza la variable f con el fichero argumento}
	b := binding (f);	{actualiza b}
	ExisteFicheroTexto := b.existing;
end;


function EnlazaFicheroTexto (var f: tFicheroTexto; nombre: tNombreFichero): boolean;
{Objetivo: Enlaza un fichero tFicheroTexto
 PreCD: El fichero es externo (bindable)
 PosCD: Devuelve TRUE si ha podido enlazarlo o FALSE en caso contrario}
var b: bindingtype;
begin
	unbind (f);			{desenlaza f de enlaces previos si hay}
	b := binding (f);	{inicia b}
	b.name := nombre;
	bind (f, b);		{enlaza la variable f con el fichero argumento}
	b := binding (f);	{actualiza b}
	EnlazaFicheroTexto := b.bound;
end;


begin

	if ExisteFicheroTexto ('prueba.txt')
	then begin
			if EnlazaFicheroTexto (f, 'prueba.txt')
			then writeln ('Fichero prueba.txt enlazado')
			else writeln ('Fichero prueba.txt no enlazado');
	end
	else writeln ('Fichero prueba.txt no existe');

end.
