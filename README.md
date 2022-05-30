# Actividad_Integradora5.5

Proyecto paralelo (evidencia de competencia) de clase "Implementación de métodos computacionales"

## Instrucciones

En equipos de 2-3 personas:

1. Genera un programa en earlang en forma secuencial que contenga una función principal llamada runSequencial, para que dado un grupo de cuatro archivos de entrada cuyos nombres se darán en una variable de entrada como parámetro y se completarán con 1 2 3 y 4 con extensión in, esto es se dará como entrada el string "caso" y eso significa que se tendrán los archivos "caso1.in", "caso2.in", "caso3.in" y "caso4.in", cada uno de los archivos contendrán operaciones aritméticas simples bien formadas, una por cada renglón, para que posteriormente realice el cálculo de la operación y el resultado sea puesto en un archivo con el mismo nombre del de entrada pero con extensión .out (ejemplo de entrada, ejemplo de salida). Las operaciones que vendrán son:
   Suma +
   Resta -
   Multiplicación \*
   División entera /
   Residuo %
2. Desarrolla una nueva versión de tu programa para que realice el proceso del punto 1 de manera paralela con el fin de aprovechar los múltiples núcleos disponibles en los CPUs modernos. Para este paso se te pide que agregues una función llamada runParallel teniendo el mismo parámetro que el secuencial.
3. Asegúrate de utilizar en tu código fuente las convenciones de codificación del lenguaje en el que está implementado tu programa.
4. Mide los tiempos de varias ejecuciones de las dos versiones de tu programa.
5. Calcula el speedup obtenido. Reflexiona sobre las soluciones planteadas, los algoritmos implementados y sobre el tiempo de ejecución de estos.
6. Calcula la complejidad de tu algoritmo basada en el número de iteraciones y contrástala con el tiempo obtenido en el punto 4.
7. Plasma en un breve reporte de una página las conclusiones de tu reflexión en los puntos 5 y 6. Agrega además una breve reflexión sobre las implicaciones éticas que el tipo de tecnología que desarrollaste pudiera tener en la sociedad.
