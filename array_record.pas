program array_record (input, output);

{En este programa veremos como usar tipos, arrays y registros.
 La idea es la siguiente: almacenar los cumpleaños de nuestros amigos
	En el array AA almacenaremos sus datos
	La entrada correlativa en el array AF sera la correspondiente a su
	fecha de cumpleaños.
	Al final, se muestra todo}


const
	CERO = 0; {usada para marcar el pricipio del array. podriamos hacer
				una llamada max tambien para el maximo de un array}

type
	tAmigo = RECORD			{ojo a como se declara}
		Nombre: string (15); {el numero indica la capacidad del string}
		Apellidos: string (30);
		Edad: integer;
	END;
	
	tFecha = RECORD
		Dia: integer;
		Mes: string (10);
	END;

	tArrayAmigo = array [CERO..5] of tAmigo; {ojo a como se declara}
	tArrayFecha = array [CERO..5] of tFecha;

var AA: tArrayAmigo; AF: tArrayFecha; i: integer;
{estas son variables globales. se pueden modificar en cualquier parte
del programa, por lo que entrañan cierto riesgo, deberiamos evitarlas y
usar variables locales dentro de cada procedimiento}




procedure MeterAmigo (i: integer);
{este procedimiento guarda los datos de un amigo en el array AA}
var n: string (15); a: string (30); e: integer; {esto son var. locales}
begin
	write ('nombre: ');
	readln (n);
	AA[i].Nombre := n;

	write ('apellidos: ');
	readln (a);
	AA[i].Apellidos := a;

	write ('edad: ');
	readln (e);
	AA[i].Edad := e;
end;



procedure MeterFecha (i: integer);
{este procedimiento guarda la fecha de aniversacio en el array AF}
var d: integer; m: string (10);
begin
		write ('dia (numero): ');
		readln (d);
		AF[i].Dia := d;
		
		write ('mes (nombre): ');
		readln (m);
		AF[i].Mes := m;
end;


procedure MostrarTodo;
var i: integer;
begin
	for i := CERO to 5 do begin
		write (AA[i].Nombre, ' ', AA[i].Apellidos, ', ', AA[i].Edad:0);
		writeln ('. Aniversario: ', AF[i].Dia:0, ' de ', AF[i].Mes);
		{ojo, despues de edad y día aparece el simbolo : y un 0.
		 es para que el numero entero se represente sin dejar espacios
		 en blanco. quita los dos puntos y el cero para ver el efecto
		 contrario.}
	end;
end;


BEGIN
	{cuerpo del programa principal.}

	writeln ('Programa Aniversarios');{sentencia}

	for i := CERO to 5 do begin {bucle}
		writeln ('introduce el nombre y el aniversario de tus amigos');
		MeterAmigo (i);
		MeterFecha (i);
		writeln;
	end;

	if 1=1							 {condicion}
	then MostrarTodo
	else writeln ('saliendo');
	{aqui la sentencia se puede sustituir por simplemente:
	MostrarTodo;
	porque la condicion 1=1 siempre será verdadera. No obstante lo pongo
	de esta forma para que se vea como usar el IF.}

END.
