# Matriz de cierre — Repository 1 · Issue #6

**Corte documental:** 22 de noviembre de 2026. Esta matriz distingue controles estructurales de certificación humana. Consultar el estado actual del PR antes de afirmar que sigue en borrador.

| Obligación | Evidencia trazable | Veredicto |
|---|---|---|
| Interpretar la Proposición 2.1 (Sección 2) | [README](../README.md), [auditoría matemática](PROPOSITION_2_1_PROOF_AUDIT.md) | **DEMOSTRADO** bajo los supuestos explícitos |
| Formalizar la regla de desempate, el óptimo y la productividad bruta | [Lean](../Aouad/RatioBound.lean), [alcance](LEAN_FORMAL_SCOPE.md) | **VERIFICADO EN LEAN**, CI [#44972813354](https://github.com/alejandroventuraventurameza-tech/ai-01-aouad/actions/runs/44972813354) |
| Dependencias reproducibles | [lake-manifest.json](../lake-manifest.json), [CI #44973682156](https://github.com/alejandroventuraventurameza-tech/ai-01-aouad/actions/runs/44973682156) | **FIJADAS**, 9 dependencias |
| Presentación original de 5 minutos | [presentation.tex](../presentation.tex), [presentation.pdf](../presentation.pdf), [notas](SPEAKER_NOTES_5MIN.md) | **COMPILADA**, CI [#44970668988](https://github.com/alejandroventuraventurameza-tech/ai-01-aouad/actions/runs/44970668988) |
| Evidencia manuscrita | [PDF del iPad](../hand/Prop_2_1_notas_ipad.pdf), [páginas 4–5](../hand/), [revisión](REVIEW_IPAD_PDF.md) | **INCORPORADA** y revisada matemáticamente; aceptación docente **no certificada** |
| Prompts utilizados y respuestas relevantes, en bruto | [prompts.md](../prompts.md), [copia recibida RP3](RP3_INTERCAMBIOS_CRUDOS.md) | **INCORPORADOS**: tres pares completos del bloque que copió el estudiante, sin corregir el formato matemático de origen |
| Conversación RP4 | [registro RP4](RP4_CONVERSACION_EN_CURSO.md) | **DOCUMENTADA EN CURSO**; respuestas del asistente resumidas |
| Exportación íntegra de RP1–RP4 | [guía del curso](https://github.com/alexanderquispe/AI-Econ-Modeling/blob/main/syllabus/repository-guide.md) | **NO EXIGIDA**: el docente requiere prompts usados y respuestas relevantes en bruto; la autenticidad no la certifica el script |
| Auditoría automática | [workflow](../.github/workflows/submission-audit.yml) | Distingue presencia de archivos de liberación; un workflow verde en **draft** no avala autenticidad |
| Fusión a main / enlace al issue | [PR #1](https://github.com/alejandroventuraventurameza-tech/ai-01-aouad/pull/1), [issue #6](https://github.com/alexanderquispe/AI-Econ-Modeling/issues/6) | **POR EJECUTAR** tras auditoría del head final |

## Consideraciones de fidelidad

1. El primer tramo del historial aportado confundió `ai-project` / issue #7 con este proyecto. El estudiante aclaró esa confusión y se preservó como parte de la trazabilidad, **no** como evidencia de resultados en Repository 1.
2. El estudiante afirmó que ya había copiado todo el texto que deseaba aportar. Los tres pares relevantes que inicialmente se habían abreviado fueron incorporados en versión cruda a `prompts.md` y `docs/RP3_INTERCAMBIOS_CRUDOS.md`. Los resúmenes de RP4 son un anexo **adicional**, no una sustitución de las respuestas relevantes pedidas por el curso.
3. No atribuir al certificado Lean resultados sobre las paradojas dinámicas de las secciones 3–5; su alcance es estrictamente la Proposición 2.1 estática.
4. No sustituir autoría manuscrita ni transcripciones por material copiado de la plantilla del docente.

## Puerta de salida

El workflow de auditoría es **diagnóstico** en borrador y exige controles estructurales aprobados cuando el PR pase a «ready for review». Este control no valida automáticamente autoría ni exactitud matemática del apunte; esas son revisiones humanas y del docente.

**Siguiente acción:** revisar el diagnóstico `relevant_raw_dialogue_present_for_review`, comprobar el estado del PR, realizar el merge a `main` tras una última auditoría y publicar el enlace en el Issue #6. No presentar el registro como exportación total ni afirmar que el docente ya aceptó la evidencia.
