# moverse sobre el archivo
* h izquierda
* j abajo
* k arriba
* l derecha
* w avanza al principio de la siguiente palabra
* b avanza al principio de la palabara anterior
* e avanza al final de la siguiente palabra
* gg ir al inicio del archivo
* G ir al final del archivo
* :5 ir a la linea 5
* % moverse al hermano de '(','{' o '[' correspondiente
* 0 ir al comienzo de la linea
* $ ir al final de la linea

## modo insert
* i modo insert antes del cursor
* a modo insert despues del cursor
* A modo insert al final de la linea
* o modo insert en una nueva linea abajo
* O modo insert en una nueva linea arriba

## eliminar
* x eliminar el caracter donde estas posicionado
* dw eliminar toda la palabra
* d$ eliminar desde la posicion del cursor hasta el final de la linea
* dd elimina la linea completamente

### combinacion de teclas

* dw eliminar hasta principio de la siguiente palabra
* d6w dw * 6
* de eliminar hasta final de la siguiente palabra
* db eliminar hasta principio de la palabra anterior
* u undo
* <Ctrl-r> redo

## copiar
* yy copiar toda la linea

## pegar
* p pegar una linea abajo
* P pegar una linea arriba

## Visual
* v modo visual

## reemplazar
* r reemplazar
* R modo reemplzar
* :s/word1/word2 reemplaza la primer ocurrencia de 'word1' por 'word2'
* :s/word1/word2/g reemplaza todas las ocurrencias de 'word1' de la linea por 'word2'
* :%s/word1/word2/g reemplaza todas las ocurrencias de 'word1' en el archivo por 'word2'
* :%s/word1/word2/gc lo mismo, pero te pregunta si deseas remplazarla, una por una.

## operador de cambio
* ciw (change inner word) elimina la palabra en el que esta el cursor

## buscar
* gd resalta la palabra en la que estoy posicionado
* /edad busca la palabra "edad" desde el cursor, hacia adelante
* ?edad busca la palabra "edad" desde el cursor, hacia atras
	* n para avanzar sobre las ocurrencias
	* N para regresar sobre las ocurrencias

## buffer
* <Ctrl-o> regresar ultima posicion guardada en el buffer
* <Ctrl-i> siguiente posicion guardada en el buffer

