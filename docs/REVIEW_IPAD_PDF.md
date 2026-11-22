# Revisión de `Prop_2_1_notas(3).pdf` (7 páginas)

**Fuente:** PDF nuevo aportado por el usuario el **22 de noviembre de 2026**, distinto de la versión anterior de 6 páginas.  
**SHA-256 del original recibido:** `bbcbd5d77f29b0befba8bdc9f151b3cb5abe96bf325bffa2bbb63b522258ba86`.

**Original incorporado sin alteraciones:** [hand/Prop_2_1_notas_ipad.pdf](../hand/Prop_2_1_notas_ipad.pdf), siete páginas, identificador de blob Git `203e242e516022b63bd857f743b01542af918022`. Las imágenes separadas de las páginas 4 y 5 siguen disponibles para inspección directa.

## Hallazgo principal

**Páginas 4 y 5:** se observan trazos manuscritos incrustados como imágenes en el PDF, correspondientes al desarrollo del **caso de esquina** de la Proposición 2.1. Se han incorporado copias de esas dos páginas en `hand/`, derivadas de imágenes auténticas aportadas por el usuario (no manuscritos inventados). Las páginas restantes son apuntes mecanografiados con tipografía de apariencia manuscrita.

## Comprobación matemática

La demostración escrita es **correcta**. Define `b=s+a` y `f(x)=p(x)-γx`; para `y>b>x*`, establece
```text
t=(b-x*)/(y-x*) ∈ (0,1),   b=(1-t)x*+ty.
```
Por concavidad, `f(b) ≥ (1-t)f(x*)+t f(y)`. Como `x*` es el **mayor** maximizador global y `b>x*`, se deduce `f(x*)>f(b)`. Dado que `1-t>0`,
```text
f(b) > (1-t) f(b) + t f(y)  ⟹  f(b)>f(y).
```
Así, `b` es el único maximizador restringido para `x≥b`, lo que determina `e*=0`.

**Matiz conceptual:** sin la regla de desempate no se deduce la **desigualdad estricta** en general, pero la concavidad puede seguir dando que `b` sea *un* maximizador factible. Esto no contradice el apunte en rojo de la página 5.

## Pequeños ajustes editoriales pendientes en el PDF original

1. **Páginas 1 y 3:** la etiqueta «interior» para `b≤x*` incluye la igualdad `b=x*`, en la que `e*=0`. Es preferible decir **«caso en que x* es factible»**.
2. **Página 7:** la frase «no está verificada en Lean» está desactualizada para el proyecto. La versión formal con hipótesis explícitas está verificada en [CI #44972813354](https://github.com/alejandroventuraventurameza-tech/ai-01-aouad/actions/runs/44972813354), y [CI #44973682156](https://github.com/alejandroventuraventurameza-tech/ai-01-aouad/actions/runs/44973682156) fijó las dependencias.

Estas observaciones no invalidan la prueba manuscrita. No se ha modificado el documento original; las imágenes `hand/` son conversiones comprimidas para registrar los trazos aportados.

**Alcance:** el requisito de `prompts.md` sigue pendiente y se audita por separado. La aceptación final de escritura manual mediante iPad compete al profesor.
