# Fundamentos de Inteligencia Artificial

Materia tomada con el Dr. Salvador Godoy Calderon en el Centro de Investigacion en Computacion del IPN.

### 

El contenido de este repositorio son las practicas hecho en lenguje prolog.


### Prolog

## Fundamentos

Prolog se basa en lógica clausular o lógica de cláusulas en la que todas las expresiones deben der cláusulas de Horn.

- Las constantes deben de empezar con letra minuscula.
    - juan.
    - maria.
    - ventana.
    - california.

- Las variables deben de empezar con letra mayuscula.
    - X.
    - CONTEO.
    - Lista.
    - Respuesta.
    - Ciudad.
- Las etiquetas de los predicados deben de comenzar con la letra minuscula.
    - cerrada(ventana).
    - madre_de(maria,juan).
    - edad(juan,9).
    - viaje(california,Ciudad).

Un predicado se especifica siempre, con el functor y su aridad.
    cerrada/1   madre_de/2  viaje/2

Todas las espreciones terminan con punto (.)


Se usa la coma (,) para conectar las disjuncion (AND) y el punto y coma (;) para conectar las conjunciones (OR).
Para la negación se representa con el operador <\+> o not.

Los comentarios se escriben como:

```prolog
% comentario de linea.
/*
    Comentario 
    de 
    bloque
*/

```


## Base del conocimiento

Los predicados en prolog se clasifican en:
- __Estáticos__: No pueden ser modificados en tiempo de ejecucion.
- __Dinámicos__: Si pueden ser modificados en tiempo de ejecucion.

Todos los predicados deben de ser contiguos.


- Para modificar una clausula a la vez: `assert`, `retract` y predicados relacionados.
- Para consultar: `consult`.
- Para agregar cláusulas a la base del conocimiento actual:`assert(<cláusula>)`.
    - `asserta` Para agregar como primera cláusula del predicado (siempre funciona igual que `assert`).
    - `assertz` Para agregar como última cláusula del predicado.
- Para remover cláusulas de la base del cnocimiento actual:`retract(<cláusula>)`.
    - `retract` Remueve alguna clausula segun su argumento.
- para eliminarlos del registro usar `abolish`

Lectura de la base del conocimiento con `consult('archivo.prolog')`.
Usar `.pl` se puede conjundir con perl.

Si al realizar un cambio en la base del conocimiento que ya fue cargado con `consult` se debe de volver a reconsultar la base usando `reconsult('archivo.prolog')`.

- `dynamic/1`: Listar porciones de la base de conocimiento.
- `listing/1` o `edit/1`: Editar la base del conocimiento sobre un archivo de texto.


## Listas

Las listas son posiblemente las estructuras mas usadas en programas de procesamiento no-numerico, en cualquier lenguaje de programación, se denotan como:

[a,b,c,d,e,f]

y pueden contener cualquier tipo de elemento
>?- L =[a,"abc",1234,47,12,[abc]].

Para aprovechar la naturaleza recursiva de las listas, se pueden representar de la forma abreviada:
[`head`|`tail`]

- `head` es uno o mas terminos, separados por comas.
- `tail` o resto, debe de ser siempre una lista.

Las expresiones pueden ser unificadas con tras espresiones, siguiendo las mismas reglas ya conocidad.
- Verificar si un elemento esta en una lista: `member(<elemento>,<Lista>)`.
- Agregar al final de una lista un elemento u otra lista: `append()`.
- Para meter una conjunto de objetos de una consulta en una lista: `findall(<objeto>,<consulta>,<lista>)`.
    - *Encuentra todos los `<objeto>` que son soluciones para `<consulta>` y las almacene en `<lista>`*.
- `bagof/3`, `setof/3`.
- Para desplegar una lista que se abrevia: `print_term/2(<lista>,[opciones])`.
- reconfigurar la consola y se impriman mas terminos: `max_depth(10)`, por `max_depth(0)`.

## Formas No-canonicas

Se dice que se usan variables en __forma canóbica__, en un predicado prolog, cuando se toman el lugar de la respuesta que entrega la funcion asociada.

_Funcion asociada_: __z=f(x,y)__

_Forma canonica__: __f(x,y,Z)__

***Cualquier variante diferente a las antes vistas seran No-canonica***

## Negacion en prolog

Importante recordar que la negacion en prolog, **No es negacion lógica**, es **Negacion por fracaso**. **No siempre** se cumplira la equivalencia de la doble negacion.

- `fail/0` es otro predicado preconstruido en prolog y que suele usarse en combinacion con el corte (!).
    - Evidentemente siempre fail regresara un valor falso.

## Depurador 

Existen 3 opciones:

- [Para consola]() (se requiere XPCE)
- [Grafico]()
- [Remoto]() (interfas wen de SWISH)

SWI-Prolog esta compuesta de dos entornos 

- El modo debugger (depurador): se detiene en los puntos de revision (spy points) y en los puntos de corte (break points).
- En el modo Tracer (rastreador): En un caso particular del debugger. en el modo tracer se detiene en ciertos estados pre-definidos en la ejecucion de cada predicado.

Tipicamente, los lenguajes de programacion imperativa tienen debuggers que soportan:

- Ejecucion paso a paso.
- Ingreso opcional a una invocacion.
- Detener la ejecucion al alcanzar ciertos puntos marcados (breakpoints).
- inspeccion y modificacion de valores en variables (watch).
- Inspeccion de stack y heap.
- etc.

**El codigo se ejecuta linealmente**

sim embargo, prolog no tiene ejecucion lineal sino ejecucion logica (resolucion SLD)

### Rastreador

Para activar el rastreador se debe de ingresar `trace.` en consola.
Para desactivar el rastreador se debe de ingresar `notrace.` en consola.

Cada ejecucion del predicado se detendra cada vez que llegue a alguno de los estados del modelo (Modelo a 4 puertos) y mostrara en consola la informacion de cada estado.

En ese momento contestar con `espacio` o `c`.

El predicado `leash/1` sirve para especificar en que puerto detener la ejecucion, los agumentos validos deben de comenzar con un `+` para activar y `-` para deshabilitar.

- +all
- -all
- +call
- -call
- +exit
- -exit
- +redo
- -redo
- +fail
- -fail

El predicado `visible/1` hace lo mismo y acepta los parametros de `leach/1`

