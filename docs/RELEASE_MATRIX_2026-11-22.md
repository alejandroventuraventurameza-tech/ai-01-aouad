# Matriz de cierre — Repository 1 · Issue #6

**Corte documental:** 22 de noviembre de 2026. Esta matriz distingue comprobaciones técnicas de autenticidad académica. El PR #1 permanece en borrador.

| Obligación | Evidencia trazable | Veredicto |
|---|---|---|
| Interpretar la Proposición 2.1 (Sección 2) | [README](../README.md), [auditoría matemática](PROPOSITION_2_1_PROOF_AUDIT.md) | **DEMOSTRADO** bajo los supuestos explícitos |
| Formalizar la regla de desempate, el óptimo y la productividad bruta | [Lean](../Aouad/RatioBound.lean), [alcance](LEAN_FORMAL_SCOPE.md) | **VERIFICADO EN LEAN**, CI [#44972813354](https://github.com/alejandroventuraventurameza-tech/ai-01-aouad/actions/runs/44972813354) |
| Dependencias reproducibles | [lake-manifest.json](../lake-manifest.json), [CI #44973682156](https://github.com/alejandroventuraventurameza-tech/ai-01-aouad/actions/runs/44973682156) | **FIJADAS**, 9 dependencias |
| Presentación original de 5 minutos | [presentation.tex](../presentation.tex), [presentation.pdf](../presentation.pdf), [notas](SPEAKER_NOTES_5MIN.md) | **COMPILADA**, CI [#44970668988](https://github.com/alejandroventuraventurameza-tech/ai-01-aouad/actions/runs/44970668988) |
| Evidencia manuscrita | [PDF del iPad](../hand/Prop_2_1_notas_ipad.pdf), [páginas 4–5](../hand/), [revisión](REVIEW_IPAD_PDF.md) | **INCORPORADA** y revisada matemáticamente; aceptación docente **no certificada** |
| Conversaciones auténticas aportadas | [prompts.md](../prompts.md), [extractos RP3](EXTRACTOS_RP3_APORTADOS.md) | **MATERIAL RECIBIDO**; el registro contiene transcripciones y abreviaciones explícitas |
| Conversación RP4 | [registro RP4](RP4_CONVERSACION_EN_CURSO.md) | **DOCUMENTADA EN CURSO**; respuestas del asistente resumidas |
| Diálogo completo y sin editar | [diagnóstico automatizado](../scripts/audit_submission.py) | **PENDIENTE:** no puede afirmarse integridad textual de ambas partes |
| Auditoría automática | [workflow](../.github/workflows/submission-audit.yml) | Distingue presencia de archivos de liberación; un workflow verde en **draft** no avala autenticidad |
| Fusión a main / enlace al issue | [PR #1](https://github.com/alejandroventuraventurameza-tech/ai-01-aouad/pull/1), [issue #6](https://github.com/alexanderquispe/AI-Econ-Modeling/issues/6) | **SIN REALIZAR** |

## Consideraciones de fidelidad

1. El primer tramo del historial aportado confundió `ai-project` / issue #7 con este proyecto. El estudiante aclaró esa confusión y se preservó como parte de la trazabilidad, **no** como evidencia de resultados en Repository 1.
2. El estudiante afirmó que ya había copiado todo el texto que deseaba aportar. Las abreviaciones presentes en `prompts.md` y los resúmenes de RP4 son **decisiones de incorporación del asistente**, no motivo para pedirle que repita el material.
3. No atribuir al certificado Lean resultados sobre las paradojas dinámicas de las secciones 3–5; su alcance es estrictamente la Proposición 2.1 estática.
4. No sustituir autoría manuscrita ni transcripciones por material copiado de la plantilla del docente.

## Puerta de salida

El workflow de auditoría es intencionalmente **diagnóstico** cuando el PR está en borrador. Ante un PR marcado «ready for review», exige que los controles estructurales no reporten pendientes; sigue requiriéndose revisión humana del original y de la conversación.

**Siguiente acción:** completar y cotejar el registro literal usando el material ya entregado y lo visible de RP4, registrar cualquier limitación restante y revisar la compuerta antes de fusionar. No declarar la entrega completa mientras aparezca `full_unedited_dialogue_release_gate: MISSING`.
