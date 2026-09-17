## 1.2 Solution Profile

### 1.2.1 Antecedentes y problemática

El Perú enfrenta un problema estructural de gestión vehicular manual y desarticulada. Con un parque automotor de 3.587.451 vehículos livianos y pesados en circulación al cierre de 2025 (Asociación Automotriz del Perú [AAP Perú], 2025) y una concentración estimada de alrededor del 66% en Lima y Callao —cifra que en 2013 ya alcanzaba el 63% del parque nacional según el departamento de Lima (Lima Cómo Vamos, 2014)—, la necesidad de controlar combustible, kilometraje y mantenimiento es considerable. Sin embargo, quienes deberían gestionarse —las MIPYMES, que representan entre el 99,1% y el 99,5% del tejido empresarial nacional— siguen ancladas en procesos manuales. Según el Instituto Nacional de Estadística e Informática (2025), apenas el 28% de las pymes peruanas utiliza herramientas digitales más allá del correo electrónico y las redes sociales, y de acuerdo con reportes de prensa que citan al Gremio de la Pequeña Empresa de la Cámara de Comercio de Lima, cerca del 60% de las pymes aún no ha culminado su proceso de transformación digital: muchas usan WhatsApp o redes sociales para vender, lo cual no equivale a haber digitalizado su gestión (Gestión, n.d.; RCR Perú, n.d.).

Este rezago tiene un costo económico directo y medible. El combustible representa entre el 20% y el 40% de los costos operativos del transporte de carga (Loyalty Logistics, n.d.), cifra consistente con el rango de 20%-30% reportado para empresas de autobuses urbanos por Chen et al. (2020). Tanto la literatura académica como los casos de industria coinciden en que la telemática y el monitoreo IoT permiten reducir ese gasto entre un 10% y un 25% (Fleetistics, n.d.; Zonar Systems Perú, n.d.). Una tesis peruana de la Universidad Privada del Norte documenta una reducción del 20% en el consumo de combustible tras implementar dashboards de monitoreo a partir de datos antes gestionados en Excel (Repositorio Institucional UPN, n.d.), y un estudio indexado en Transportation Research Record midió una mejora de aproximadamente 6% en la eficiencia de combustible únicamente por retroalimentación del comportamiento del conductor dentro de un programa de telemática (Pinals et al., 2025).

A esto se suma la elevada informalidad del sector transporte, que agrava la dificultad de coordinación entre los tres segmentos. Solo en Lima, el 67% del transporte sería informal (América Televisión, n.d.), y en el segmento de taxis la Autoridad de Transporte Urbano para Lima y Callao (ATU) reportó en 2023 un registro de 82.450 taxistas formalmente habilitados, tras un incremento de más del 600% en formalizaciones respecto al año anterior (Gestión, 2023) —cifra considerablemente menor a las estimaciones históricas de hasta 200.000 unidades en circulación bajo el antiguo sistema SETAME (vLex Perú, n.d.)—. En el transporte de carga interprovincial, se ha llegado a estimar que hasta el 89% de las empresas operaría de manera informal (Gestión, n.d.).

Aplicando la técnica de las 5W y 2H para delimitar el problema y sus antecedentes:

| Preguntas | Pregunta formulada para el problema | Respuestas |
|---|---|---|
| **Who?** | ¿Quiénes son los afectados? | Empresas de transporte de carga y pasajeros, operadores de taxi, conductores y los propios pasajeros que dependen de un servicio confiable. |
| **What?** | ¿Cuál es el problema? | La gestión de la flota (combustible, kilometraje, mantenimiento) se realiza de forma manual o con herramientas desarticuladas, sin visibilidad en tiempo real del estado ni la ubicación de las unidades. |
| **Where?** | ¿Dónde ocurre? | En toda la operación diaria de la flota: en ruta (viajes de pasajeros y carga), en los puntos de abastecimiento de combustible y en los talleres de mantenimiento. |
| **When?** | ¿Cuándo sucede? | Durante la asignación de unidades, el uso diario del vehículo, el registro de consumo de combustible y la planificación (o ausencia de planificación) del mantenimiento. |
| **Why?** | ¿Por qué ocurre? | Por la falta de digitalización y de dispositivos de monitoreo (GPS/IoT) que permitan capturar datos objetivos, obligando a administradores y conductores a depender de reportes manuales y estimaciones. |
| **How?** | ¿Cómo se manifiesta? | En sobrecostos de combustible, mantenimientos correctivos de emergencia, kilometraje sin control, y pasajeros sin información confiable sobre el estado de su viaje. |
| **How Much?** | ¿Cuánto impacto tiene? | Genera pérdidas económicas por combustible mal gestionado, reducción de la vida útil de las unidades, tiempos de inactividad por fallas no previstas y menor competitividad frente a empresas mejor organizadas. |

### 1.2.2 Lean UX Process

#### 1.2.2.1. Lean UX Problem Statements

El estado actual de la gestión de flotas de transporte de pasajeros y carga en el Perú (incluyendo taxis) se centra principalmente en procesos manuales —hojas de cálculo, cuadernos físicos, llamadas telefónicas— entre administradores, conductores y las empresas o pasajeros que contratan el servicio, lo que genera desconocimiento del estado real de la flota, sobrecostos de combustible y mantenimientos correctivos de emergencia en lugar de preventivos.

Lo que los productos y servicios existentes fallan en resolver es una solución accesible y especializada que integre, mediante tecnología IoT y GPS, el monitoreo en tiempo real de combustible, kilometraje y mantenimiento en una sola plataforma para estos actores.

¿Cómo podríamos reducir el gasto de combustible y los mantenimientos correctivos de emergencia en la gestión de esta flota, enfocándonos inicialmente en empresas de transporte de pasajeros y carga, así como operadores de taxi, de mediana escala con operaciones activas en Lima Metropolitana, medido por una reducción del 20% en el gasto de combustible por unidad y una disminución del 30% en mantenimientos correctivos de emergencia en los primeros 6 meses?

#### 1.2.2.2. Lean UX Assumptions

**Business Assumptions**

Asumimos que:
- Operamos en un dominio donde la digitalización de la gestión y el mantenimiento de vehículos en el Perú aún es limitada, predominando la coordinación manual mediante hojas de cálculo, cuadernos y llamadas telefónicas.
- Los dueños de vehículos y pequeñas flotas enfrentan sobrecostos de combustible y mantenimiento reactivo que justifican la adopción de una plataforma digital especializada.
- Actualmente no existe en el mercado peruano una solución accesible que integre en un mismo ecosistema el monitoreo del vehículo (software y hardware IoT) con la coordinación directa con talleres mecánicos.
- Un modelo de negocio basado en suscripción mensual por vehículo gestionado, complementado con la venta del dispositivo IoT y una comisión por mantenimiento coordinado a través de la plataforma, resulta económicamente viable.
- La integración de monitoreo en tiempo real, control de combustible y coordinación de mantenimiento con talleres en una sola plataforma constituye una ventaja competitiva diferenciadora frente a soluciones parciales existentes.
- Los dueños de vehículos particulares y de pequeñas flotas, junto con talleres mecánicos independientes de Lima Metropolitana, representan el segmento más adecuado para validar el producto antes de escalar a otras ciudades.

**Business Outcome Assumptions**

Asumimos que:
- Reduciremos en un 20% el gasto en combustible por unidad durante los primeros seis meses de uso, gracias al control y monitoreo continuo del consumo.
- Reduciremos en un 30% el tiempo de coordinación de un mantenimiento (desde la solicitud del dueño hasta la aprobación del taller) frente al proceso actual por teléfono.
- Incrementaremos la retención mensual de dueños y talleres suscritos a la plataforma en al menos un 70% durante el primer semestre.
- Incrementaremos en un 40% el número de mantenimientos preventivos (frente a correctivos de emergencia) realizados a través de la plataforma.

**User Assumptions**

Asumimos que:
- El conductor utiliza principalmente un smartphone durante su jornada y necesita una interfaz simple para reportar combustible e incidencias sin distraerse de la conducción.
- El dueño gestiona uno o varios vehículos, ya sea desde una computadora o su smartphone, y necesita visibilidad centralizada del estado de sus unidades junto con alertas automáticas de mantenimiento.
- La mecánica (taller mecánico) recibe solicitudes de mantenimiento de múltiples clientes de forma desorganizada (llamadas, mensajes de texto) y necesita un canal digital que le permita diagnosticar, cotizar y dar seguimiento a cada trabajo de forma ordenada.

**User Outcome and Benefit Assumptions**

Asumimos que:
- El dueño espera reducir el tiempo dedicado al seguimiento manual de sus vehículos y anticipar fallas mecánicas antes de que ocurran.
- El conductor espera recibir alertas simples y oportunas sobre mantenimiento y consumo, sin necesidad de procesos complejos de reporte.
- La mecánica espera recibir solicitudes de mantenimiento organizadas y con el historial del vehículo disponible, reduciendo el tiempo de diagnóstico y mejorando su relación con el cliente.

**Feature Assumptions**

Asumimos que:
- Un módulo de gestión de flotas que centralice el registro, estado y asignación de cada unidad permitirá a los dueños tomar decisiones informadas.
- Un módulo de control de combustible conectado a sensores IoT permitirá detectar consumos anómalos y reducir costos.
- Un módulo de mantenimiento preventivo y coordinación con talleres que conecte directamente al dueño con la mecánica reducirá los mantenimientos correctivos de emergencia y el tiempo de coordinación de cada servicio.
- La opción de compra del dispositivo IoT (GPS, odómetro y sensor de combustible) permitirá que cualquier unidad, sin importar su antigüedad, se integre a la plataforma.

#### 1.2.2.3. Lean UX Hypothesis Statements

A continuación se presentan los Hypothesis Statements elaborados como parte del proceso Lean UX para el desarrollo del producto Flotix. Cada hipótesis establece la relación entre el resultado de negocio esperado (Achieve), el segmento de usuarios al que está dirigida (If), el beneficio o cambio esperado en los usuarios (Attain) y la funcionalidad principal de la solución que permitirá alcanzar dicho resultado (With).

Las hipótesis están ordenadas según su nivel de riesgo y valor, siguiendo la lógica de la Hypothesis Prioritization Canvas: primero se validan las funcionalidades núcleo de mayor impacto y menor complejidad técnica, dejando para etapas posteriores aquellas que dependen de una adopción ya probada o que involucran mayor complejidad de implementación (como la integración de hardware IoT).

Estas hipótesis serán validadas mediante entrevistas con usuarios, pruebas de usabilidad y el análisis de métricas de uso recopiladas durante el ciclo de vida del producto, con el fin de verificar los supuestos planteados y orientar la mejora continua de la solución.

**Statement 1**
- **Achieve:** Creemos que lograremos una reducción significativa en el tiempo dedicado a la supervisión manual de la flota, medida por una disminución del 40% en las horas semanales que los administradores dedican a tareas de seguimiento durante los primeros tres meses de uso.
- **If:** Si los administradores de empresas de transporte y operadores de taxi adoptan Flotix como su plataforma central de gestión de flota.
- **Attain:** Alcanzarán visibilidad centralizada y en tiempo real del estado y ubicación de todas sus unidades, permitiéndoles tomar decisiones operativas más rápidas y confiables.
- **With:** Con un módulo de gestión de flotas que consolide en un solo panel el estado operativo, la disponibilidad y la asignación de cada vehículo de la flota.

**Statement 2**
- **Achieve:** Creemos que lograremos una reducción de al menos el 20% en el gasto de combustible por unidad durante los primeros seis meses de uso.
- **If:** Si los administradores y conductores registran de forma constante sus cargas de combustible a través de Flotix.
- **Attain:** Alcanzarán la capacidad de identificar consumos anómalos y patrones de uso ineficiente antes de que representen una pérdida significativa.
- **With:** Con un módulo de control de combustible integrado a sensores IoT que registre el consumo en tiempo real y genere alertas automáticas de desviación.

**Statement 3**
- **Achieve:** Creemos que lograremos una reducción de al menos el 30% en mantenimientos correctivos de emergencia durante los primeros seis meses de uso.
- **If:** Si los administradores programan y dan seguimiento al mantenimiento de sus vehículos a través de Flotix.
- **Attain:** Alcanzarán la capacidad de anticipar el mantenimiento de cada unidad según su kilometraje real, evitando fallas mecánicas inesperadas.
- **With:** Con un módulo de mantenimiento preventivo que programe revisiones y notifique automáticamente antes de que ocurra una falla.

**Statement 4**
- **Achieve:** Creemos que lograremos incrementar la base de vehículos monitoreados en la plataforma, medida por una adopción del dispositivo IoT en al menos el 60% de las unidades registradas durante el primer año.
- **If:** Si las empresas de transporte y taxistas independientes que aún no cuentan con GPS acceden a un dispositivo IoT accesible y fácil de instalar.
- **Attain:** Alcanzarán la capacidad de equipar sus unidades de forma sencilla y sin depender de proveedores externos de hardware.
- **With:** Con la opción de compra directa de un dispositivo IoT (GPS, odómetro y sensor de combustible) integrado nativamente a la plataforma.

**Statement 5**
- **Achieve:** Creemos que lograremos incrementar la percepción de seguridad y confiabilidad del servicio, medida por un aumento del 25% en la calificación promedio otorgada por los pasajeros al finalizar el viaje.
- **If:** Si los pasajeros pueden dar seguimiento a su viaje en tiempo real a través de Flotix.
- **Attain:** Alcanzarán mayor tranquilidad y confianza al conocer en todo momento la ubicación y el estado del vehículo que los transporta.
- **With:** Con una vista de seguimiento en tiempo real conectada a los datos de GPS de la unidad asignada.

#### 1.2.2.4. Lean UX Canvas

| 1. Business Problem | 5. Solution Ideas | 2. Business Outcomes |
|---|---|---|
| La gestión de flotas de transporte de pasajeros y carga (incluyendo taxis) se realiza de forma manual y desarticulada, sin visibilidad en tiempo real del combustible, kilometraje ni estado mecánico de las unidades. ¿Cómo podríamos reducir el gasto de combustible y los mantenimientos correctivos de emergencia en la gestión de esta flota, enfocándonos inicialmente en empresas de transporte de pasajeros y carga, así como operadores de taxi, de mediana escala con operaciones activas en Lima Metropolitana, medido por una reducción del 20% en el gasto de combustible por unidad y una disminución del 30% en mantenimientos correctivos de emergencia en los primeros 6 meses? | Aplicación web con: Gestión de flotas y vehículos (Administrador), Control de combustible (Conductor), Mantenimiento preventivo (para conductor), Monitoreo y seguimiento en tiempo real (Empresa), Notificaciones automáticas, y Dashboard de KPIs (Administrador). **Propuesta de valor:** controlar, monitorear y optimizar toda la flota desde una sola plataforma, reduciendo costos operativos y aumentando la confiabilidad del servicio. **Modelo:** suscripción mensual por vehículo gestionado. Venta del dispositivo IoT propio (GPS, odómetro y sensor de combustible); se recomienda validar primero la adopción de la plataforma de software antes de invertir en la fabricación y distribución de este dispositivo, dado su mayor riesgo y costo. | - Reducir en 20% el gasto de combustible por unidad.<br>- Reducir en 30% los mantenimientos correctivos de emergencia.<br>- Incrementar en 70% la retención mensual de empresas y conductores.<br>- Reducir en 25% las quejas por falta de información del viaje. |

| 3. Users and Customers | 4. User Benefits |
|---|---|
| - **Administrador:** Supervisa toda la flota desde un panel centralizado.<br>- **Conductor:** Reporta combustible e incidencias desde su smartphone durante la jornada.<br>- **Pasajero:** Hace seguimiento de su viaje en tiempo real.<br>- **Empresa:** Contrata el servicio de transporte y exige evidencia de cumplimiento y confiabilidad. | - Visibilidad centralizada y en tiempo real de la flota.<br>- Reducción de costos de combustible y mantenimiento.<br>- Mayor seguridad y transparencia percibida por el pasajero.<br>- Evidencia objetiva de cumplimiento para la empresa contratante. |

| 6. Hypotheses | 7. Assumptions | 8. Experiments |
|---|---|---|
| - Creemos que la gestión centralizada reducirá el tiempo de supervisión manual si los administradores acceden a un panel único.<br>- Creemos que el control de combustible reducirá el gasto en 20% si se detectan consumos anómalos vía IoT.<br>- Creemos que el mantenimiento preventivo reducirá en 30% las fallas de emergencia si se programan alertas por kilometraje. | - Los usuarios cuentan con smartphone y conectividad estable.<br>- No existe en el mercado peruano una solución que integre software y hardware IoT para este segmento.<br>- Empresas y taxistas están dispuestos a adoptar tecnología si reduce costos comprobadamente.<br>- Los pasajeros valoran la trazabilidad del viaje como factor de confianza. | - Piloto con 3 empresas de transporte y 5 taxistas independientes durante 4 semanas.<br>- Medición de consumo de combustible antes/después del piloto (línea base).<br>- Validación de adopción ≥70% de uso activo diario en el primer mes.<br>- Entrevistas post-piloto con administradores, conductores y pasajeros para evaluar usabilidad y valor percibido. |
