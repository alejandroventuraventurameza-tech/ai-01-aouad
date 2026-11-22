# Revisión de las notas de iPad para la Proposición 2.1

**Documento examinado:** `Prop_2_1_notas.pdf` (6 páginas), suministrado por el estudiante en el chat el 22 de noviembre de 2026.  
**SHA-256 del archivo recibido:** `009d66d6eafe40047bc2da4113375c478628d650fbc76331739bbb0668168ffd`.  
**Disponibilidad:** PDF revisado en el chat; **no está incorporado a este repositorio** en este commit.

## Resultado matemático

La reconstrucción de la Proposición 2.1 es sustancialmente correcta:
- Páginas 1–2: problema del agente, regularidad de cola, existencia y selección del mayor maximizador;
- Página 3: equivalencia entre elegir esfuerzo y maximizar la función neta de insumo total sobre `x >= b`;
- Página 4: prueba correcta de la solución de esquina mediante concavidad y desempate por el mayor maximizador;
- Página 5: regla de esfuerzo positivo-parte y producción bruta;
- Página 6: alcance y funciones de cada hipótesis.

## Dos ajustes antes de distribuir las notas

1. **Página 3:** el caso `b <= x*` no siempre es «interior»: cuando `b = x*`, la selección óptima tiene esfuerzo `e* = 0`. Recomiendo llamarlo **«Caso 1: x* es factible»**.
2. **Página 6:** la frase «no está verificada en Lean» está desactualizada. La proposición está formalizada, con sus hipótesis explícitas, en `Aouad/RatioBound.lean`. Véase [CI #44972813354](https://github.com/alejandroventuraventurameza-tech/ai-01-aouad/actions/runs/44972813354) y [CI de dependencias #44973682156](https://github.com/alejandroventuraventurameza-tech/ai-01-aouad/actions/runs/44973682156).

## Alcance de la evidencia manuscrita

Aunque el archivo fue preparado en iPad según el estudiante, su PDF contiene **texto componible con tipografías de aspecto manuscrito** (Caveat y Playpen Sans), no una fotografía o imagen raster de trazos manuscritos. Esta observación describe la **estructura técnica del archivo**, no cuestiona quién escribió las ideas.

La [guía oficial del curso](https://github.com/alexanderquispe/AI-Econ-Modeling/blob/main/syllabus/repository-guide.md) pide **al menos una foto de una comprobación hecha a mano**, y expresamente indica que no basta una transcripción mecanografiada. Por tanto, este PDF sirve como apunte digital de estudio, **pero no se contabiliza automáticamente como la foto manuscrita exigida**.

Para satisfacer ese requisito, el estudiante puede escribir de su puño y letra **solo la página del caso de esquina** y aportar una fotografía JPG/PNG de los trazos auténticos en `hand/`. Una imagen exportada directamente desde una aplicación de escritura con lápiz sobre trazos propios también puede ser revisada, pero la aceptación de la evidencia corresponde al profesor.

Este informe no reemplaza el PDF original ni altera su contenido. La publicación de la conversación auténtica en `prompts.md` es una obligación separada.
