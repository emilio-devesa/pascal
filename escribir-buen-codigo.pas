{   ########################################################################## 
					    EJEMPLO DE COMO ESCRIBIR BUEN CODIGO		
		https://emiliodevesa.wordpress.com/2010/06/16/escribir-buen-codigo/
	##########################################################################	}


{	Funcion auxiliar CrearNodo para añadir un nuevo nodo a la lista dinamica	}

function CrearNodo (var nuevo: tPos): boolean;
{Objetivo:	Intenta crear una nueva variable dinamica asociada al puntero tPos
			"nuevo". Devuelve TRUE si se puede crear, FALSE en caso contrario
 PosCD:		El campo siguiente de la variable contiene el valor NULO			}
begin
	new (nuevo);
	if nuevo = nulo
	then CrearNodo := false
	else begin
			nuevo^.sig := NULO;
			CrearNodo := true;
	end;
end;


{	##########################################################################	}


function InsertarOrdenado (var L: tLista; nombre: tNombre; edad: tEdad): boolean;
{Objetivo:	Si hay memoria suficiente para crear un nuevo nodo de la lista L,
			almacena en ella los datos nombre y edad, quedando la lista	ordenada
			por edad, y devuelve TRUE. Sino, devuelve FALSE.
 PreCD:		La lista esta creada												}
var nuevo, p: tPos;
begin
	if CrearNodo (nuevo)
	then begin
			if L = NULO
			then L := nuevo
			else begin
					p := L;
					while (p <> NULO) and (p^.edad < edad) do p := p^.sig;
					{Este bucle termina si:
			 		 - Se llega al final de la lista o la lista esta vacia
			 		 - Se llega a un nodo con campo edad > edad argumento (y se
			 		   inserta en la posicion anterior a esa)}
					if p = nulo
					then Ultimo(L)^.sig := nuevo
					else begin
							nuevo^.sig := P;
							P := nuevo;
					end;
			end;
			nuevo^.nombre := nombre;
			nuevo^.edad := edad;
			InsertarOrdenado := true;
	end;
	else InsertarOrdenado := false;
end;


{	##########################################################################	}


{	Para crear la funcion InsertarOrdenado sigo los siguientes pasos:			}

{	1º Planteo la cabecera de la funcion, su objetivo, su precondicion y escribo
	   el begin y el end que contendran su código								}

function InsertarOrdenado (var L: tLista; nombre: tNombre; edad: tEdad): boolean;
{Objetivo:	Si hay memoria suficiente para crear un nuevo nodo de la lista L,
			almacena en ella los datos nombre y edad, quedando la lista	ordenada
			por edad, y devuelve TRUE. Sino, devuelve FALSE.
 PreCD:		La lista esta creada												}
begin
end;



{	2º Como la funcion devuelve TRUE o FALSE segun puede insertar o no, intento
	   distinguir cuanto antes si podre o no podre hacerlo, llamo a CrearNodo y
	   necesito crear una variable llamada "nuevo" de tipo tPos para tal efecto	}

function InsertarOrdenado (var L: tLista; nombre: tNombre; edad: tEdad): boolean;
{Objetivo:	Si hay memoria suficiente para crear un nuevo nodo de la lista L,
			almacena en ella los datos nombre y edad, quedando la lista	ordenada
			por edad, y devuelve TRUE. Sino, devuelve FALSE.
 PreCD:		La lista esta creada												}
var nuevo: tPos;
begin
	if CrearNodo (nuevo)
	then InsertarOrdenado := true
	else InsertarOrdenado := false;
end;



{	3º Con los dos casos distinguidos, ahora tengo que ampliar el caso en el que
	   puedo insertar para que realmente se guarden datos en la lista. Añado los
	   "begin-end" correspondientes a la rama "then". Dado que la variable que
	   cree antes, llamada nuevo, sera el nodo de la lista donde guarde dichos
	   datos, puedo ya asignarle estos a la misma.								}

function InsertarOrdenado (var L: tLista; nombre: tNombre; edad: tEdad): boolean;
{Objetivo:	Si hay memoria suficiente para crear un nuevo nodo de la lista L,
			almacena en ella los datos nombre y edad, quedando la lista	ordenada
			por edad, y devuelve TRUE. Sino, devuelve FALSE.
 PreCD:		La lista esta creada												}
var nuevo: tPos;
begin
	if CrearNodo (nuevo)
	then begin
			nuevo^.nombre := nombre;
			nuevo^.edad := edad;
			InsertarOrdenado := true;	
	end
	else InsertarOrdenado := false;
end;



{	4º El caso mas sencillo de insercion se da cuando la lista esta vacia		}

function InsertarOrdenado (var L: tLista; nombre: tNombre; edad: tEdad): boolean;
{Objetivo:	Si hay memoria suficiente para crear un nuevo nodo de la lista L,
			almacena en ella los datos nombre y edad, quedando la lista	ordenada
			por edad, y devuelve TRUE. Sino, devuelve FALSE.
 PreCD:		La lista esta creada												}
var nuevo: tPos;
begin
	if CrearNodo (nuevo)
	then begin
			if L = NULO
			then L := nuevo
			else begin
					{Insercion si la lista no esta vacia}
			end;
			nuevo^.nombre := nombre;
			nuevo^.edad := edad;
			InsertarOrdenado := true;	
	end
	else InsertarOrdenado := false;
end;



{	5º Utilizaré una variable p de tipo tPos para situar correctamente el nuevo
	   nodo dentro de la lista. Se hace en tres pasos:
	   		a) colocar la variable al principio de la lista
	   		b) recorrer la lista hasta que:
	   				- se llegue al final
	   				- o se encuentra una edad mayor a la que intentamos insertar
	   		c) establecer los punteros conforme a los casos anteriores, siendo
	   				- si se llega al final de la lista, el puntero al siguiente
	   				  del ultimo nodo de la lista debe apuntar al nodo recien
	   				  creado, que pasa a ser el ultimo
	   				- o bien hacer que el siguiente del nuevo sea el de la
	   				  posicion p (con edad mayor) y luego hacer que p pase por
	   				  el nuevo nodo.
	   Con estos tres pasos, dejo ya el puntero con los datos grabados y en la
	   posición de la lista en la que los datos deben estar						}


function InsertarOrdenado (var L: tLista; nombre: tNombre; edad: tEdad): boolean;
{Objetivo:	Si hay memoria suficiente para crear un nuevo nodo de la lista L,
			almacena en ella los datos nombre y edad, quedando la lista	ordenada
			por edad, y devuelve TRUE. Sino, devuelve FALSE.
 PreCD:		La lista esta creada												}
var nuevo, p: tPos;
begin
	if CrearNodo (nuevo)
	then begin
			if L = NULO
			then L := nuevo
			else begin
					p := L;
					while (p <> NULO) and (p^.edad < edad) do p := p^.sig;
					if p = nulo
					then Ultimo(L)^.sig := nuevo
					else begin
							nuevo^.sig := P;
							P := nuevo;
					end;
			end;
			nuevo^.nombre := nombre;
			nuevo^.edad := edad;
			InsertarOrdenado := true;
	end;
	else InsertarOrdenado := false;
end;
