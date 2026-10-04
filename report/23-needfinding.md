## 2.3. Needfinding



### 2.3.1. User Personas

Las User Personas de FLOTIX son arquetipos ideales que sintetizan lo observado en las entrevistas y en el contexto del mercado. No son retratos de los entrevistados: cada una representa a un usuario típico de su segmento, con su día a día, sus herramientas actuales y lo que espera de una solución.


#### User Persona del 1er segmento objetivo – Dueños de vehículos

![foto](../assets/images/user-persona-1.png)


Juan Quispe representa al segmento de dueños de vehículos, construido a partir de las entrevistas realizadas a Karen Forcelledo. Es un hombre de 42 años que vive en San Juan de Lurigancho, en Lima, y dirige una pequeña empresa de transporte de carga con cuatro camiones y una camioneta. Empezó con una sola unidad y fue ampliando su flota con los años, por lo que hoy administra todo él mismo con el apoyo de su esposa, que lleva las cuentas. Tiene formación técnica en administración y utiliza un smartphone Android y una laptop. Participa directamente en las decisiones sobre combustible, mantenimiento y asignación de choferes, y cuando una unidad falla pierde el servicio y el ingreso de ese día. Sus objetivos son conocer el estado de cada vehículo sin tener que llamar a los conductores, reducir el gasto de combustible, que es su mayor costo operativo, prevenir fallas mecánicas en lugar de pagar reparaciones de emergencia y reunir en un solo lugar el historial de gastos y mantenimientos. Sus frustraciones se relacionan con el uso de hojas de cálculo, cuadernos y mensajes de WhatsApp, donde la información se pierde o llega tarde, con la duda constante sobre si el consumo de combustible que le reportan es real, y con la necesidad de coordinar los mantenimientos mediante llamadas y mensajes con los talleres. Los mantenimientos correctivos inesperados le generan gastos que no tenía previstos. Sus canales actuales son WhatsApp, las llamadas, Excel y la laptop, que usa para revisar la información al final de la semana. Sus principales influencias son otros dueños de flotas, los talleres de confianza y los proveedores de monitoreo vehicular que conoce por recomendación. No tiene conocimientos técnicos avanzados, por lo que espera un panel simple, accesible desde el celular o la computadora, que le muestre el estado de sus unidades y le avise antes de que algo falle.

#### User Persona del 2do segmento objetivo – Conductores

![foto](../assets/images/user-persona-2.png)


Jorge Samudio representa al segmento de conductores, construido a partir de la entrevista realizada a Ronald Enrique Ramirez. Es un hombre de 51 años que vive en Lima, tiene secundaria completa y más de veinte años de experiencia como chofer de transporte de carga. Maneja jornadas largas y está en contacto directo con el vehículo: carga combustible, anota el kilometraje y es el primero en notar cuando algo suena distinto. Usa un smartphone Android con un plan de datos limitado, principalmente para llamadas y WhatsApp, y no es aficionado a aprender aplicaciones nuevas. Si una herramienta le quita tiempo o lo distrae mientras maneja, simplemente no la usa. Sus objetivos son terminar su jornada sin contratiempos, mantener el vehículo en buenas condiciones para evitar fallas en ruta, avisar rápidamente al dueño cuando algo anda mal y evitar que le atribuyan un gasto o una falla que no fue su responsabilidad. Sus frustraciones están relacionadas con los procesos manuales: reportar una falla implica llamar o escribir al dueño, que no siempre contesta de inmediato, y anotar combustible y kilometraje en papel le resulta tedioso y a veces se olvida de hacerlo. Las herramientas con muchos pasos o menús lo abruman y no cuenta con un registro propio que respalde lo que reporta. Sus canales actuales son WhatsApp y las llamadas, junto con anotaciones en papel o de memoria. Como necesita concentrarse en la conducción, valora las soluciones rápidas y sencillas desde el smartphone, y espera poder reportar combustible o una incidencia en pocos toques, con botones grandes y textos claros.


#### User Persona del 3er segmento objetivo – Mecánicas

![foto](../assets/images/user-persona-3.png)


Matías Zavala representa al segmento de mecánicas, construido a partir de la entrevista realizada a Jorge Zambudio Alcántara. Es un hombre de 27 años que vive en Lima, es técnico en mecánica automotriz y tiene seis años de experiencia en el rubro. Trabaja en un taller pequeño junto con otros dos mecánicos y atiende vehículos particulares y de empresas. Utiliza un smartphone y una computadora en el taller. Recibe las solicitudes de mantenimiento por llamadas y WhatsApp, y organiza su trabajo con calendarios y documentos de Word. Cuando la demanda aumenta, el taller se satura y resulta difícil ordenar quién atiende cada vehículo. Sus objetivos son organizar mejor las solicitudes y los trabajos pendientes, reducir el tiempo que pierde coordinando por teléfono, conocer el historial del vehículo antes de recibirlo y fidelizar a sus clientes con un servicio ordenado y confiable. Sus frustraciones aparecen porque el historial de los vehículos existe, pero está disperso y es difícil de consultar, y a menudo no incluye información sobre reparaciones o accidentes anteriores. Con alta demanda y pocos mecánicos, los trabajos se acumulan y se desordenan, y los clientes llegan sin información sobre lo que le ocurrió al vehículo. Sus canales actuales son WhatsApp, las llamadas, Word y los calendarios. Espera contar con las solicitudes ordenadas y con el historial del vehículo antes de recibirlo, aunque tiene claro que el diagnóstico debe ser realizado por el equipo de mecánicos y no mediante un procesamiento automático, de modo que la información previa le sirva como apoyo y no como reemplazo.


### 2.3.2. User Task Matrix

Para diseñar una solución que permita optimizar la gestión y operación de flotas de transporte, se identificaron tres tipos de usuarios clave: los dueños de vehículos, responsables de supervisar las unidades y tomar decisiones relacionadas con combustible, mantenimiento y operación; los conductores, encargados de operar diariamente los vehículos y reportar información e incidencias; y las mecánicas, responsables de realizar los servicios de mantenimiento preventivo y correctivo. El diseño de **FLOTIX** busca facilitar la interacción entre estos tres actores mediante una plataforma centralizada que permita mejorar el control de las unidades, reducir costos operativos, anticipar fallas y organizar los procesos de mantenimiento.

**Tareas vs. Personas de usuario**

| Tareas                               | Dueños (Frecuencia) | Dueños (Importancia) | Conductores (Frecuencia) | Conductores (Importancia) | Mecánicas (Frecuencia) | Mecánicas (Importancia) |
| :----------------------------------- | :------------------ | :------------------- | :----------------------- | :------------------------ | :--------------------- | :---------------------- |
| Gestionar vehículos / flota          | Muy frecuente       | Alta                 | Frecuente                | Alta                      | Frecuente              | Alta                    |
| Controlar combustible                | Frecuente           | Alta                 | Muy frecuente            | Alta                      | Ocasional              | Media                   |
| Registrar kilometraje                | Frecuente           | Alta                 | Muy frecuente            | Alta                      | Frecuente              | Alta                    |
| Reportar fallas o incidencias        | Frecuente           | Alta                 | Muy frecuente            | Alta                      | Frecuente              | Alta                    |
| Supervisar el estado del vehículo    | Muy frecuente       | Alta                 | Frecuente                | Alta                      | Muy frecuente          | Alta                    |
| Programar mantenimiento              | Frecuente           | Alta                 | Ocasional                | Alta                      | Frecuente              | Alta                    |
| Realizar mantenimiento preventivo    | Ocasional           | Alta                 | Ocasional                | Alta                      | Muy frecuente          | Alta                    |
| Atender mantenimientos correctivos   | Ocasional           | Alta                 | Ocasional                | Alta                      | Muy frecuente          | Alta                    |
| Coordinar servicios de mantenimiento | Frecuente           | Alta                 | Frecuente                | Alta                      | Muy frecuente          | Alta                    |
| Consultar historial del vehículo     | Frecuente           | Alta                 | Ocasional                | Media                     | Muy frecuente          | Alta                    |
| Registrar trabajos realizados        | Ocasional           | Media                | Ocasional                | Media                     | Muy frecuente          | Alta                    |
| Comunicar incidencias                | Frecuente           | Alta                 | Muy frecuente            | Alta                      | Frecuente              | Alta                    |
| Monitorear ubicación del vehículo    | Muy frecuente       | Alta                 | Ocasional                | Media                     | Ocasional              | Media                   |
| Analizar gastos operativos           | Frecuente           | Alta                 | Ocasional                | Media                     | Frecuente              | Alta                    |
| Recibir alertas de mantenimiento     | Frecuente           | Alta                 | Frecuente                | Alta                      | Frecuente              | Alta                    |
| Coordinar con otros actores          | Muy frecuente       | Alta                 | Muy frecuente            | Alta                      | Muy frecuente          | Alta                    |

La tabla muestra que los tres segmentos comparten tareas relacionadas con el seguimiento del estado de los vehículos, el reporte de incidencias y la coordinación del mantenimiento, aunque la frecuencia varía de acuerdo con sus responsabilidades dentro de la operación. Los dueños realizan con mayor frecuencia actividades de supervisión, control de combustible, análisis de gastos y planificación del mantenimiento, debido a que son responsables de administrar sus vehículos y controlar los costos operativos. Por su parte, los conductores tienen una participación más frecuente en el registro de combustible y kilometraje, así como en el reporte de fallas e incidencias durante la jornada, ya que mantienen contacto directo con el vehículo. Finalmente, las mecánicas concentran sus actividades en el diagnóstico, mantenimiento preventivo y correctivo, consulta del historial y registro de los trabajos realizados. Estas diferencias reflejan los roles de cada usuario dentro del sistema: el dueño busca controlar y optimizar la operación, el conductor proporciona información directa sobre el uso y estado del vehículo, y la mecánica utiliza dicha información para organizar y ejecutar los servicios de mantenimiento de manera más eficiente.




### 2.3.3. User Journey Mapping



El User Journey Mapping es una herramienta que permite visualizar de forma estructurada la experiencia del usuario a lo largo de su interacción con un producto o servicio. En el caso de FLOTIX, se elaboraron los User Journey Maps en su versión As-Is para los tres segmentos objetivos: dueños de vehículos, conductores y mecánicas. Estos mapas permiten identificar las principales etapas, necesidades, dificultades y puntos de frustración presentes en la gestión actual de los vehículos y servicios de mantenimiento.



#### User Journey Map del 1er segmento objetivo – Dueños de vehículos

![foto](../assets/images/journey-map-1.png)


El User Journey Map de Juan Quispe representa la experiencia actual del segmento de dueños de vehículos a lo largo de las cinco etapas: Aware, Join, Use, Develop y Leave. En **Aware**, Juan identifica la necesidad de mejorar el control de sus vehículos debido a los gastos de combustible, problemas de mantenimiento y dificultad para conocer el estado real de sus unidades, pero no cuenta con una herramienta que centralice toda esta información. En **Join**, continúa utilizando herramientas tradicionales como hojas de cálculo, cuadernos, llamadas y WhatsApp para coordinar con conductores y talleres, generando información dispersa y poca trazabilidad. Durante el **Use**, supervisa el combustible, kilometraje y mantenimiento de sus vehículos mediante registros manuales y depende de los reportes proporcionados por los conductores, lo que dificulta detectar oportunamente consumos anómalos o posibles fallas. En **Develop**, intenta mejorar el control mediante registros y coordinaciones adicionales, pero la información continúa fragmentada y el seguimiento depende de la comunicación constante con los conductores y talleres. Finalmente, en **Leave**, la acumulación de gastos de combustible, mantenimientos correctivos inesperados y falta de información centralizada genera la necesidad de buscar una solución digital que permita gestionar sus vehículos desde un solo lugar, representando una oportunidad de entrada para FLOTIX.



#### User Journey Map del 2do segmento objetivo – Conductores

![foto](../assets/images/journey-map-2.png)


El User Journey Map de Jorge Samudio representa la experiencia actual del segmento de conductores durante las cinco etapas definidas. En **Aware**, Jorge reconoce la importancia de mantener el vehículo en buenas condiciones y comunicar oportunamente cualquier problema, pero actualmente no dispone de una herramienta especializada que facilite estas tareas durante su jornada. En **Join**, utiliza principalmente llamadas y WhatsApp para comunicarse con el dueño o administrador, además de realizar registros manuales relacionados con combustible, kilometraje o incidencias. Durante el **Use**, conduce diariamente el vehículo, realiza el abastecimiento de combustible y debe informar cualquier falla o incidencia que se presente, pero estos reportes dependen de la comunicación directa y pueden generar retrasos o pérdida de información. En **Develop**, intenta mantener una comunicación constante con el propietario para informar sobre el estado del vehículo y coordinar mantenimientos, aunque el proceso continúa siendo manual y requiere varios intercambios de mensajes o llamadas. Finalmente, en **Leave**, las dificultades para reportar incidencias, registrar información del vehículo y recibir indicaciones oportunas generan la necesidad de contar con una herramienta sencilla desde el smartphone que permita registrar combustible, kilometraje y fallas de manera rápida, representando una oportunidad para FLOTIX.



#### User Journey Map del 3er segmento objetivo – Mecánicas

![foto](../assets/images/journey-map-3.png)


El User Journey Map de Matias Zavala representa la experiencia actual del segmento de mecánicas a lo largo de las cinco etapas: Aware, Join, Use, Develop y Leave. En **Aware**, Matias identifica la necesidad de organizar mejor la atención de los vehículos y mantener un historial accesible de los servicios realizados, especialmente cuando aumenta la cantidad de clientes y trabajos pendientes. En **Join**, comienza a recibir solicitudes de mantenimiento principalmente mediante llamadas, WhatsApp y otros medios de comunicación, mientras utiliza herramientas como Word o calendarios para organizar sus actividades. Durante el **Use**, coordina los servicios, recibe los vehículos, realiza diagnósticos y registra los trabajos efectuados; sin embargo, el historial de cada unidad puede encontrarse incompleto o ser difícil de consultar. En **Develop**, busca mejorar la organización de sus servicios y atender una mayor cantidad de vehículos, pero la alta demanda y la disponibilidad limitada de mecánicos pueden generar saturación y dificultades para coordinar las atenciones. Finalmente, en **Leave**, la dificultad para organizar solicitudes, consultar rápidamente el historial de los vehículos y coordinar los trabajos con los propietarios genera la necesidad de una plataforma que centralice la información y facilite la gestión de los servicios de mantenimiento, representando una oportunidad para FLOTIX.



### 2.3.4. Empathy Mapping



El Empathy Mapping es una herramienta que permite profundizar en la experiencia emocional y cognitiva de los usuarios. A través de categorías como lo que el usuario piensa, siente, dice y hace, se busca comprender mejor su contexto, así como identificar sus principales preocupaciones, frustraciones y motivaciones.



Para FLOTIX, elaborar un Mapeo de Empatía para cada segmento objetivo fue importante para comprender cómo los dueños, conductores y mecánicas gestionan actualmente las actividades relacionadas con los vehículos. Esta herramienta permitió identificar las dificultades presentes en el control del combustible, kilometraje, mantenimiento y comunicación entre los diferentes actores. Esta comprensión facilita el diseño de una solución que responda a las necesidades reales de los usuarios y reduzca los problemas presentes en la gestión manual de los vehículos.



#### Mapeo de Empatía del 1er segmento objetivo – Dueños de vehículos

![foto](../assets/images/emphaty-map-1.png)


El Mapa de Empatía de Juan Quispe refleja la experiencia de un propietario que necesita mantener el control de uno o varios vehículos y administrar los gastos relacionados con combustible y mantenimiento.



- **Think and Feel:** Reconoce que contar con información centralizada podría ayudarlo a controlar mejor sus vehículos y anticiparse a posibles problemas, pero se siente preocupado cuando no conoce con exactitud el estado de una unidad y frustrado cuando una falla inesperada genera gastos adicionales.

- **See:** Observa información distribuida entre hojas de cálculo, cuadernos, llamadas y conversaciones por WhatsApp, además de depender constantemente de los reportes de los conductores.

- **Hear:** Recibe información sobre problemas mecánicos, consumo de combustible, mantenimientos pendientes y situaciones que pueden afectar la operación de sus vehículos.

- **Say and Do:** Coordina constantemente con conductores y talleres, revisa gastos de combustible y mantenimiento y utiliza diferentes medios para registrar o consultar información de sus vehículos.

- **Pains:** Falta de información centralizada, gastos elevados de combustible, fallas inesperadas y tiempo empleado en realizar seguimiento manual.

- **Gains:** Disponer de mayor control, recibir alertas oportunas, conocer el estado de sus vehículos y contar con información organizada para tomar mejores decisiones.



#### Mapa de Empatía del 2do segmento objetivo – Conductores

![foto](../assets/images/emphaty-map-2.png)


El Mapa de Empatía de Jorge Samudio representa la experiencia de un conductor que utiliza diariamente un vehículo y debe encargarse de actividades como registrar el kilometraje, abastecer combustible y comunicar cualquier incidencia.



- **Think and Feel:** Considera importante mantener el vehículo en buenas condiciones y comunicar rápidamente cualquier problema, pero puede sentirse preocupado cuando una falla aparece durante su jornada y frustrado cuando debe realizar varios pasos para informar una incidencia.

- **See:** Observa que el registro de combustible, kilometraje y fallas se realiza mediante anotaciones, llamadas o mensajes al propietario o administrador, sin contar necesariamente con un sistema especializado.

- **Hear:** Recibe indicaciones del dueño o administrador sobre mantenimientos, uso del vehículo y atención de posibles problemas, además de escuchar comentarios relacionados con gastos o fallas de la unidad.

- **Say and Do:** Informa incidencias mediante llamadas o WhatsApp, registra información del vehículo cuando es necesario, realiza sus actividades diarias de conducción y comunica cualquier anomalía que pueda afectar el funcionamiento de la unidad.

- **Pains:** Dificultad para reportar rápidamente una falla, comunicación dispersa, registros manuales y problemas mecánicos que pueden aparecer durante la jornada.

- **Gains:** Contar con una herramienta sencilla desde el celular, recibir alertas oportunas, reportar incidencias rápidamente y facilitar la comunicación con el propietario.



#### Mapa de Empatía del 3er segmento objetivo – Mecánicas

![foto](../assets/images/emphaty-map-3.png)


El Mapa de Empatía de Matias Zavala profundiza en la experiencia de un mecánico encargado de atender diferentes vehículos y organizar sus servicios de mantenimiento.



- **Think and Feel:** Reconoce que disponer del historial de cada vehículo facilitaría la atención y permitiría organizar mejor los trabajos, pero se siente presionado cuando recibe muchas solicitudes al mismo tiempo y frustrado cuando la información del vehículo está incompleta o resulta difícil de consultar.

- **See:** Observa solicitudes de mantenimiento gestionadas principalmente mediante llamadas, WhatsApp, documentos y calendarios, además de historiales que pueden encontrarse dispersos o incompletos.

- **Hear:** Recibe solicitudes de propietarios y conductores relacionadas con fallas, mantenimientos y reparaciones, muchas veces con información limitada sobre el problema presentado.

- **Say and Do:** Coordina servicios con los clientes, revisa el estado del vehículo, realiza diagnósticos, organiza los trabajos pendientes y registra información utilizando herramientas tradicionales.

- **Pains:** Saturación de solicitudes, dificultad para consultar el historial de los vehículos, información incompleta y tiempo empleado en coordinar los servicios.

- **Gains:** Contar con solicitudes organizadas, acceso rápido al historial de mantenimiento, una mejor coordinación con propietarios y conductores y una herramienta que permita administrar de manera más eficiente los trabajos del taller.