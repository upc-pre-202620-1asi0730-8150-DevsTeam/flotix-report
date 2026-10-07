## Conclusiones y recomendaciones

### Conclusiones

#### AV1 – Sprint 1

Para la primera entrega (AV1), el equipo Developers Team completó la definición inicial del problema, la propuesta de valor y el primer incremento de producto de Flotix, sentando las bases del ciclo de vida del proyecto conforme al proceso Lean UX.

Respecto al Problem Statement planteado en el Capítulo I, el análisis documental y competitivo confirma que la gestión de vehículos y flotas en el Perú sigue apoyada mayoritariamente en procesos manuales —hojas de cálculo, cuadernos, llamadas y mensajería instantánea—, tanto para el control de combustible y mantenimiento como para la coordinación entre dueños y talleres mecánicos.

Asimismo, dado que el alcance técnico de esta entrega se limitó a la primera versión del Landing Page, los criterios de éxito definidos en el proceso Lean UX —como la reducción del 20% en el gasto de combustible por unidad o la disminución del 30% en el tiempo de coordinación de un mantenimiento— aún no pueden contrastarse contra resultados reales de uso.

En cuanto al trabajo técnico realizado durante el Sprint 1, se logró implementar y desplegar exitosamente la primera versión del Landing Page de Flotix mediante GitHub Pages, cumpliendo las cuatro User Stories planificadas y validando la viabilidad del flujo de trabajo GitFlow con Conventional Commits definido en el Capítulo V. Esto permite al equipo contar con una base técnica y de proceso ordenada para escalar el desarrollo en los siguientes sprints.

#### TB1 – Sprint 2

Para la entrega TB1, el equipo corrigió y mejoró los artefactos presentados en AV1 a partir de la retroalimentación recibida. Se actualizaron los wireframes y mock-ups del Landing Page y de la Web Application. Además, se reorganizó la especificación de requisitos: las User Stories se agruparon en Epics alineadas con los bounded contexts de la solución, se reordenó el Product Backlog según el valor para el negocio y se elaboró el Impact Mapping para los tres segmentos objetivo (Dueño, Conductor y Mecánica).

El problema identificado en el Problem Statement se mantiene vigente. La primera versión de la Web Application concreta la estrategia propuesta, pues reúne en una sola plataforma el control de combustible, el ciclo completo de mantenimiento entre Dueño y Mecánica y el reporte de incidencias desde el Conductor.

En cuanto al trabajo técnico del Sprint 2, se publicó una nueva versión del Landing Page. Esta versión incorpora el cambio de idioma entre inglés y español, la sección del equipo, los espacios para los videos About the Product y About the Team, y los términos y condiciones en el footer. Asimismo, se implementó la primera versión de la Web Application con Vue 3, Vue Router y Pinia, organizada por bounded contexts siguiendo Domain-Driven Design, con capas de dominio, aplicación, infraestructura y presentación. Esta versión cubre gestión de flota y conductores, control de combustible con detección de consumo anómalo, gestión de mantenimiento con talleres afiliados, gestión de incidencias, monitoreo simulado en tiempo real, alertas y notificaciones, compra de dispositivos IoT, y reportes. La persistencia se resolvió de forma provisional en el almacenamiento local del navegador, a la espera del RESTful API previsto para el siguiente sprint.

Los Hypothesis Statements y los criterios de éxito definidos en el proceso Lean UX aún no pueden contrastarse con resultados reales, ya que la solución todavía no ha sido utilizada por usuarios de los segmentos objetivo. Esa comprobación se realizará mediante las entrevistas de validación programadas para AV2.

### Recomendaciones

- Implementar el RESTful API con ASP.NET Core, Entity Framework Core y MySQL, y reemplazar la persistencia local de la Web Application por la integración con dicho API.
- Migrar la interfaz de la Web Application a PrimeVue con el lenguaje de diseño Material Design, conforme a las restricciones tecnológicas del proyecto.
- Incorporar en la Web Application la internacionalización en inglés (en_US) y español latinoamericano (es_419), así como los atributos ARIA, tal como ya se aplicó en el Landing Page.
- Integrar al menos un servicio externo de terceros; por ejemplo, un servicio de mapas para el monitoreo de la flota.
- Vincular los call-to-action del Landing Page con las vistas correspondientes de la Web Application.
- Publicar los videos About the Product y About the Team, y ejecutar las entrevistas de validación con usuarios de los tres segmentos objetivo.

## Bibliografía

América Televisión. (n.d.). *El 67% del transporte en Lima es informal.* https://www.americatv.com.pe/noticitransporte-lima-informal-n496993

Chen, M.-C., Yeh, C.-T., & Wang, Y.-S. (2020). Eco-driving for urban bus with big data analytics. *Journal of Ambient Intelligence and Humanized Computing.* https://doi.org/10.1007/s12652-020-02287-2

Fleetistics. (n.d.). *Fleet telematics ROI calculator: Estimate your savings.* https://fleetistics.com/fleettelematics-roi-calculator/

Gestión. (2023, noviembre). *ATU: En cuatro meses aumentó en más del 600% los taxistas formales en Lima y Callao.* https://gestion.pe/peru/atu-en-cuatro-meses-aumento-en-mas-del600-los-taxistas-formales-en-lima-y-callao-noticia/

Gestión. (n.d.-a). *El 89% de empresas de transporte interprovincial sería informal.* https://gestion.pe/economia/empresas/89-empresas-transporte-interprovincial-seria-informal263053-noticia/

Gestión. (n.d.-b). *Transformación digital avanza entre las pymes, aunque seis de cada diez aún no culminan el proceso.* https://gestion.pe/economia/empresas/transformacion-digital-avanzaentre-las-pymes-aunque-seis-de-cada-diez-aun-no-culminan-el-proceso-noticia/

Instituto Nacional de Estadística e Informática. (2025). *Lima Metropolitana concentra el 42,2% de las empresas que existen en el país* [Nota de prensa]. Plataforma del Estado Peruano. https://www.gob.pe/institucion/inei/noticias/1334404-lima-metropolitana-concentra-el-42-2-de-las-empresas-que-existen-en-el-pais

Lima Cómo Vamos. (2014). *Cuarto informe de resultados sobre calidad de vida: Evaluando la gestión en Lima.* https://www.limacomovamos.org/cm/wp-content/uploads/2015/01/InformeEvaluandoLimLoya

RCR Perú. (n.d.). *Transformación digital avanza, pero aún el 60% de las pymes no completa el proceso.* https://www.rcrperu.com/transformacion-digital-avanza-pero-aun-el-60-delas-pymes-no-completa-el-proceso/