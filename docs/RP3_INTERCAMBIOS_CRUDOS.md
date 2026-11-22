# Intercambios relevantes de RP3 — copia aportada por el estudiante

**Procedencia:** bloque de texto que el estudiante pegó directamente en RP4 el 22 de noviembre de 2026. Se transcriben tres intercambios relevantes acerca del manuscrito y la formalización de la Proposición 2.1.

**Importante:** se preserva el formato descompuesto de las expresiones matemáticas tal como apareció en el texto pegado. Esta es una copia proporcionada por el estudiante, no una exportación certificada del sistema. Los nombres de archivos designan adjuntos; este documento no incorpora sus bytes.

## Intercambio 1: primera revisión

### Usuario

~~~text
Prop_2_1_notas.pdf
PDF
Aquí está hecho desde mi ipad
~~~

### Asistente

~~~text
He revisado las seis páginas de tu archivo Prop_2_1_notas.pdf.

La demostración matemática está bien desarrollada. Incluye la existencia de 
x
⋆
x 
⋆
 , la regla de desempate, el cambio de variable, los dos casos de optimización y la fórmula de productividad. En particular, el argumento de concavidad de la página 4 justifica correctamente por qué el esfuerzo óptimo es cero cuando 
s
+
a
>
x
⋆
s+a>x 
⋆
 .

Encontré dos ajustes pequeños:

Página 3: el caso 
s
+
a
≤
x
⋆
s+a≤x 
⋆
  no siempre es una solución interior. Cuando hay igualdad, 
e
⋆
=
0
e 
⋆
 =0, así que conviene titularlo «Caso 1: 
x
⋆
x 
⋆
  es factible».

Página 6: dice que la demostración no está verificada en Lean. Esa información ya quedó desactualizada: verificamos la formalización de la Proposición 2.1 mediante GitHub Actions #44972813354.

Sobre el requisito manuscrito
Hay una distinción importante: aunque preparaste el documento desde tu iPad, el PDF utiliza tipografías digitales que imitan la escritura manual, en lugar de contener una fotografía de trazos manuscritos. Por eso no puedo dar por cumplido todavía el requisito del profesor.

La solución es sencilla: escribe con el Apple Pencil, sin conversión a tipografía, la demostración del caso de esquina de la página 4 y comparte una imagen de esa página. No necesitas volver a escribir las seis.

He registrado la revisión y las dos observaciones en docs/REVIEW_IPAD_PDF.md. El PDF original sigue disponible aquí; no lo he modificado ni subido como evidencia manuscrita.

El PR #1 continúa abierto como borrador, mientras completamos esa evidencia y prompts.md.
~~~

## Intercambio 2: corrección del manuscrito

### Usuario

~~~text
Prop_2_1_notas.pdf
PDF

Prop_2_1_notas(3).pdf
PDF
Revisión de la nueva versión
~~~

### Asistente

~~~text
Ahora sí: esta versión incorpora escritura manual en las páginas 4 y 5. He comprobado que contienen imágenes de tus trazos, a diferencia de las páginas mecanografiadas de apoyo.

La demostración del caso de esquina es correcta. En particular, utilizas la concavidad y el hecho de que 
x
⋆
x 
⋆
  es el mayor maximizador global para demostrar que

f
(
b
)
>
f
(
y
)
para todo 
y
>
b
>
x
⋆
.
f(b)>f(y)para todo y>b>x 
⋆
 .
Esto justifica que 
b
b sea el único maximizador restringido y, por tanto, que 
e
⋆
=
0
e 
⋆
 =0.

Estas dos páginas aportan la evidencia manuscrita que faltaba. El requisito del profesor admite una fotografía de una comprobación hecha a mano; no exige reescribir toda la demostración.

Ya incorporé las páginas manuscritas de esta nueva versión al repositorio, en el commit 90c1883.

Página 4

Página 4: concavidad y caso de esquina

Página 5: desigualdad estricta y conclusión

La auditoría de entrega #45067755831 terminó correctamente y ya reconoce ambas imágenes en hand/. La aceptación definitiva de escritura manual realizada en iPad corresponde al profesor.

También actualicé el PR #1 y documenté dos ajustes editoriales menores: el caso 
b
=
x
⋆
b=x 
⋆
  no es estrictamente interior, y la página 7 conserva una referencia desactualizada sobre Lean.

Ahora solo queda pendiente prompts.md: incorporar los intercambios auténticos con el modelo. Hasta entonces, el PR permanece en borrador y no se ha publicado la entrega en el Issue #6.

Conservé sin modificar tu PDF original de siete páginas.
~~~

## Intercambio 3: incorporación del PDF completo

### Usuario

~~~text
Prop_2_1_notas(3).pdf
PDF
Ok, incorporalo.
~~~

### Asistente

~~~text
He comprobado que el archivo Prop_2_1_notas(3).pdf contiene siete páginas y que la copia binaria transferida a GitHub coincide exactamente con el original. La verificación se realizó mediante su identificador Git, sin modificar el documento.

Lo incorporaré como PDF completo en hand/, junto a las dos páginas manuscritas que ya estaban registradas.

El PDF completo ya está incorporado a GitHub, en la rama de trabajo del PR #1.

 Ver las siete páginas originales

También actualicé el README.md, la revisión matemática y el registro de reproducibilidad. El archivo se conserva sin modificaciones y su integridad quedó verificada.

Auditoría de entrega #45068194106

Ejecutada
La auditoría confirma que las páginas manuscritas están presentes, junto con la presentación y el código. El único requisito documental pendiente es prompts.md, que debe contener la conversación auténtica.

El PR #1 sigue abierto como borrador. No he modificado main ni publicado todavía la entrega en el Issue #6.
~~~

## Interpretación de los intercambios

Los errores, las correcciones y las observaciones se han mantenido. La interpretación formal corregida de la proposición se encuentra en [auditoría matemática](PROPOSITION_2_1_PROOF_AUDIT.md) y el PDF original en [hand/](../hand/). El registro de los diálogos no constituye una certificación independiente de autoría ni prueba de que la conversación histórica completa esté aquí.
