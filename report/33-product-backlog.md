## 3.3. Product Backlog

| Orden | User Story ID | Título | Descripción | Story Points |
|---|---|---|---|---|
| 1 | TS01 | Configurar entorno de desarrollo | Como Developer, Quiero configurar mi entorno de desarrollo local, Para comenzar a trabajar correctamente en el proyecto. | 3 |
| 2 | TS02 | Implementar autenticación de usuarios | Como Developer, Quiero implementar el mecanismo de autenticación y autorización basado en roles (Dueño, Conductor, Mecánica), Para permitir acceso seguro y diferenciado a la plataforma. | 5 |
| 3 | US46 | Visualizar sección de inicio | Como visitante, Quiero visualizar la propuesta de valor de Flotix al ingresar al sitio web, Para entender rápidamente qué ofrece la plataforma. | 2 |
| 4 | US47 | Navegar entre secciones | Como visitante, Quiero desplazarme entre las secciones del Landing Page desde el menú de navegación, Para explorar la información de forma ordenada. | 1 |
| 5 | US48 | Visualizar el Landing Page en dispositivos móviles | Como visitante, Quiero visualizar el Landing Page correctamente desde mi smartphone, Para consultar la información sin problemas de legibilidad. | 3 |
| 6 | US49 | Consultar beneficios | Como visitante, Quiero conocer los beneficios principales de Flotix, Para evaluar cómo la plataforma resuelve las necesidades de mi operación. | 2 |
| 7 | US50 | Consultar planes y precios | Como visitante, Quiero consultar los planes de suscripción con sus precios y alcance, Para elegir el que se ajusta al tamaño de mi flota. | 3 |
| 8 | US51 | Acceder a la Web Application desde el Landing Page | Como visitante, Quiero acceder a la Web Application desde los call-to-action del Landing Page, Para empezar a usar Flotix con el plan o la funcionalidad que me interesa. | 2 |
| 9 | US52 | Ver video About the Product | Como visitante, Quiero ver el video que muestra el funcionamiento de Flotix, Para entender rápidamente el valor del producto. | 2 |
| 10 | US53 | Conocer al equipo | Como visitante, Quiero conocer a los integrantes del equipo que desarrolla Flotix, Para generar confianza en el producto. | 2 |
| 11 | US54 | Ver video About the Team | Como visitante, Quiero ver el video que resume el trabajo del equipo, Para conocer cómo se construye Flotix. | 2 |
| 12 | US55 | Consultar términos y condiciones | Como visitante, Quiero consultar los términos y condiciones del servicio, Para conocer las políticas de uso de Flotix. | 1 |
| 13 | US38 | Mantener sesión y proteger accesos | Como Conductor, Mecánica o Dueño, Quiero que mi sesión se mantenga activa y que las secciones privadas estén protegidas, Para no autenticarme en cada visita y evitar accesos no autorizados. | 3 |
| 14 | US39 | Actualizar perfil | Como Conductor, Mecánica o Dueño, Quiero actualizar mis datos personales y los de mi empresa o taller, Para mantener mi información vigente. | 2 |
| 15 | US40 | Cerrar sesión | Como Conductor, Mecánica o Dueño, Quiero cerrar mi sesión, Para proteger mi cuenta cuando dejo de usar la plataforma. | 1 |
| 16 | TS03 | Implementar registro y consulta de vehículos vía API | Como Developer, Quiero implementar los endpoints de creación y consulta de vehículos, Para que el Frontend pueda gestionar la flota. | 3 |
| 17 | US01 | Registrar vehículo | Como Dueño, Quiero registrar un vehículo con su placa, tipo y kilometraje, Para incorporarlo a la gestión de mi flota. | 3 |
| 18 | US02 | Editar vehículo | Como Dueño, Quiero modificar los datos de un vehículo registrado, Para mantener actualizada su información. | 2 |
| 19 | US03 | Eliminar vehículo | Como Dueño, Quiero eliminar un vehículo de mi flota, Para retirar unidades que ya no forman parte de mi operación. | 2 |
| 20 | US04 | Consultar flota de vehículos | Como Dueño, Quiero visualizar todos mis vehículos con su estado y kilometraje, Para tener una vista general de mi flota. | 2 |
| 21 | US05 | Asignar conductor a vehículo | Como Dueño, Quiero asignar un conductor registrado a un vehículo, Para habilitar la operación de esa unidad. | 3 |
| 22 | US06 | Consultar conductores | Como Dueño, Quiero visualizar la lista de conductores registrados con su licencia y vehículo asignado, Para conocer la disponibilidad de mi personal. | 2 |
| 23 | US07 | Buscar conductores | Como Dueño, Quiero buscar conductores por nombre, correo o licencia, Para encontrar rápidamente a un conductor específico. | 2 |
| 24 | US08 | Registrar recarga de combustible | Como Conductor, Quiero registrar cada recarga de combustible con litros, costo y kilometraje, Para que el Dueño tenga visibilidad del consumo real de la unidad. | 3 |
| 25 | US09 | Consultar historial y rendimiento de combustible | Como Dueño, Quiero visualizar el historial de recargas con el rendimiento en km/L, Para analizar el consumo de cada unidad. | 3 |
| 26 | US10 | Detectar consumo anómalo | Como Dueño, Quiero que el sistema identifique las recargas con rendimiento inusualmente bajo, Para investigar posibles fugas, fallas o malas prácticas. | 5 |
| 27 | US11 | Consultar resumen de combustible | Como Dueño, Quiero ver el total de litros cargados, el gasto total y la cantidad de consumos anómalos, Para evaluar rápidamente el costo de combustible de mi flota. | 2 |
| 28 | US12 | Eliminar registro de combustible | Como Dueño, Quiero eliminar un registro de combustible incorrecto, Para mantener la exactitud del historial de consumo. | 2 |
| 29 | TS05 | Implementar flujo de solicitud de mantenimiento entre Dueño y Mecánica | Como Developer, Quiero implementar los endpoints que gestionan el ciclo de vida de una solicitud de mantenimiento (creación, diagnóstico, presupuesto, aprobación y cierre), Para que Dueños y talleres puedan coordinar un servicio de principio a fin desde la plataforma. | 5 |
| 30 | US13 | Enviar solicitud de mantenimiento | Como Dueño, Quiero enviar una solicitud de mantenimiento describiendo la falla de un vehículo, Para iniciar la atención por parte de un taller. | 3 |
| 31 | US14 | Registrar diagnóstico y cotización | Como Mecánica, Quiero registrar el diagnóstico y el costo estimado de una solicitud, Para que el Dueño evalúe el presupuesto. | 3 |
| 32 | US15 | Aprobar o rechazar presupuesto | Como Dueño, Quiero aprobar o rechazar el presupuesto propuesto por el taller, Para decidir si se realiza la reparación. | 3 |
| 33 | US16 | Iniciar reparación | Como Mecánica, Quiero registrar el inicio de la reparación aprobada, Para informar al Dueño que el vehículo está siendo atendido. | 2 |
| 34 | US17 | Completar mantenimiento | Como Mecánica, Quiero registrar la finalización de la reparación, Para que el vehículo vuelva a estar disponible para la operación. | 2 |
| 35 | US18 | Consultar solicitudes de mantenimiento | Como Dueño, Quiero visualizar todas las solicitudes de mantenimiento con su estado y presupuesto, Para hacer seguimiento a cada servicio. | 2 |
| 36 | US19 | Eliminar solicitud de mantenimiento | Como Dueño, Quiero eliminar una solicitud de mantenimiento, Para retirar solicitudes registradas por error. | 2 |
| 37 | US20 | Consultar talleres afiliados | Como Dueño, Quiero conocer los talleres afiliados con su ubicación, contacto, calificación y especialidades, Para elegir el más adecuado para mi vehículo. | 2 |
| 38 | US21 | Buscar talleres | Como Dueño, Quiero buscar talleres por nombre o ciudad, Para encontrar rápidamente un taller cercano. | 2 |
| 39 | US22 | Solicitar servicio a un taller | Como Dueño, Quiero enviar una solicitud de mantenimiento directamente a un taller elegido, Para que ese taller atienda mi vehículo. | 3 |
| 40 | US23 | Reportar incidencia | Como Conductor, Quiero reportar una falla o anomalía de mi vehículo durante la operación, Para que el Dueño esté informado y la atienda. | 3 |
| 41 | US24 | Revisar incidencia | Como Dueño, Quiero marcar una incidencia como en revisión, Para indicar que está siendo atendida. | 2 |
| 42 | US25 | Resolver incidencia | Como Dueño, Quiero marcar una incidencia como resuelta, Para cerrar su seguimiento. | 2 |
| 43 | US26 | Consultar incidencias | Como Dueño, Quiero visualizar las incidencias reportadas con su estado, Para dar seguimiento a los problemas de mi flota. | 2 |
| 44 | US27 | Eliminar incidencia | Como Dueño, Quiero eliminar una incidencia, Para retirar reportes duplicados o registrados por error. | 2 |
| 45 | TS04 | Implementar ingesta de datos IoT en tiempo real | Como Developer, Quiero implementar el servicio que recibe y procesa la telemetría enviada por los dispositivos IoT (GPS, odómetro, combustible), Para alimentar el monitoreo en tiempo real de la plataforma. | 8 |
| 46 | US28 | Ver ubicación de la flota en tiempo real | Como Dueño, Quiero visualizar la posición actual de cada vehículo con dispositivo IoT, Para supervisar dónde se encuentra mi flota. | 8 |
| 47 | US29 | Consultar indicadores de monitoreo | Como Dueño, Quiero conocer la velocidad de cada vehículo y los indicadores del monitoreo, Para evaluar el comportamiento de mi flota en ruta. | 5 |
| 48 | US30 | Recibir alerta de exceso de velocidad | Como Dueño, Quiero recibir una alerta cuando un vehículo supere el límite de velocidad, Para corregir conductas de riesgo. | 5 |
| 49 | US31 | Recibir notificación de incidencia | Como Dueño, Quiero ser notificado cuando un conductor reporta una incidencia, Para atenderla sin demora. | 3 |
| 50 | US32 | Consultar alertas y notificaciones | Como Dueño, Quiero visualizar las alertas generadas y mis notificaciones, Para revisar los eventos críticos de mi flota. | 3 |
| 51 | US33 | Marcar notificación como leída | Como Dueño, Quiero marcar una notificación como leída, Para distinguir las notificaciones que ya revisé. | 1 |
| 52 | US34 | Consultar catálogo de dispositivos IoT | Como Dueño, Quiero conocer los dispositivos IoT disponibles y sus precios, Para elegir el equipamiento adecuado para mi flota. | 2 |
| 53 | US35 | Comprar dispositivo IoT | Como Dueño, Quiero comprar una cantidad determinada de dispositivos IoT, Para equipar mis vehículos con monitoreo. | 5 |
| 54 | US36 | Consultar historial de pedidos | Como Dueño, Quiero visualizar mis pedidos de dispositivos IoT, Para hacer seguimiento a mis compras. | 2 |
| 55 | US37 | Actualizar estado de pedido | Como Dueño, Quiero registrar el avance de mi pedido hasta su entrega, Para mantener actualizado su seguimiento. | 2 |
| 56 | US41 | Consultar panel general | Como Dueño, Quiero ver un resumen del estado de mi operación al ingresar a la plataforma, Para identificar de inmediato lo que requiere mi atención. | 5 |
| 57 | TS06 | Implementar generación de reportes | Como Developer, Quiero implementar los endpoints de generación de reportes de combustible y mantenimiento, Para que Dueños y talleres puedan analizar su operación desde la plataforma. | 5 |
| 58 | US42 | Consultar resumen consolidado de la flota | Como Dueño, Quiero ver los datos consolidados de vehículos, combustible y mantenimiento, Para conocer el costo total de mi operación. | 3 |
| 59 | US43 | Comparar rendimiento por vehículo | Como Dueño, Quiero comparar el gasto de combustible y el rendimiento promedio de cada vehículo, Para identificar las unidades menos eficientes. | 5 |
| 60 | US44 | Exportar reporte de rendimiento | Como Dueño, Quiero exportar el reporte de rendimiento de mi flota, Para compartirlo o archivarlo. | 3 |
| 61 | US45 | Consultar historial de reportes | Como Dueño, Quiero visualizar los reportes que exporté anteriormente, Para llevar control de los reportes generados. | 2 |## 3.3. Product Backlog

| Orden | User Story ID | Título | Descripción | Story Points |
|---|---|---|---|---|
| 1 | TS01 | Configurar entorno de desarrollo | Como Developer, Quiero configurar mi entorno de desarrollo local, Para comenzar a trabajar correctamente en el proyecto. | 3 |
| 2 | TS02 | Implementar autenticación de usuarios | Como Developer, Quiero implementar el mecanismo de autenticación y autorización basado en roles (Dueño, Conductor, Mecánica), Para permitir acceso seguro y diferenciado a la plataforma. | 5 |
| 3 | US46 | Visualizar sección de inicio | Como visitante, Quiero visualizar la propuesta de valor de Flotix al ingresar al sitio web, Para entender rápidamente qué ofrece la plataforma. | 2 |
| 4 | US47 | Navegar entre secciones | Como visitante, Quiero desplazarme entre las secciones del Landing Page desde el menú de navegación, Para explorar la información de forma ordenada. | 1 |
| 5 | US48 | Visualizar el Landing Page en dispositivos móviles | Como visitante, Quiero visualizar el Landing Page correctamente desde mi smartphone, Para consultar la información sin problemas de legibilidad. | 3 |
| 6 | US49 | Consultar beneficios | Como visitante, Quiero conocer los beneficios principales de Flotix, Para evaluar cómo la plataforma resuelve las necesidades de mi operación. | 2 |
| 7 | US50 | Consultar planes y precios | Como visitante, Quiero consultar los planes de suscripción con sus precios y alcance, Para elegir el que se ajusta al tamaño de mi flota. | 3 |
| 8 | US51 | Acceder a la Web Application desde el Landing Page | Como visitante, Quiero acceder a la Web Application desde los call-to-action del Landing Page, Para empezar a usar Flotix con el plan o la funcionalidad que me interesa. | 2 |
| 9 | US52 | Ver video About the Product | Como visitante, Quiero ver el video que muestra el funcionamiento de Flotix, Para entender rápidamente el valor del producto. | 2 |
| 10 | US53 | Conocer al equipo | Como visitante, Quiero conocer a los integrantes del equipo que desarrolla Flotix, Para generar confianza en el producto. | 2 |
| 11 | US54 | Ver video About the Team | Como visitante, Quiero ver el video que resume el trabajo del equipo, Para conocer cómo se construye Flotix. | 2 |
| 12 | US55 | Consultar términos y condiciones | Como visitante, Quiero consultar los términos y condiciones del servicio, Para conocer las políticas de uso de Flotix. | 1 |
| 13 | US38 | Mantener sesión y proteger accesos | Como Conductor, Mecánica o Dueño, Quiero que mi sesión se mantenga activa y que las secciones privadas estén protegidas, Para no autenticarme en cada visita y evitar accesos no autorizados. | 3 |
| 14 | US39 | Actualizar perfil | Como Conductor, Mecánica o Dueño, Quiero actualizar mis datos personales y los de mi empresa o taller, Para mantener mi información vigente. | 2 |
| 15 | US40 | Cerrar sesión | Como Conductor, Mecánica o Dueño, Quiero cerrar mi sesión, Para proteger mi cuenta cuando dejo de usar la plataforma. | 1 |
| 16 | TS03 | Implementar registro y consulta de vehículos vía API | Como Developer, Quiero implementar los endpoints de creación y consulta de vehículos, Para que el Frontend pueda gestionar la flota. | 3 |
| 17 | US01 | Registrar vehículo | Como Dueño, Quiero registrar un vehículo con su placa, tipo y kilometraje, Para incorporarlo a la gestión de mi flota. | 3 |
| 18 | US02 | Editar vehículo | Como Dueño, Quiero modificar los datos de un vehículo registrado, Para mantener actualizada su información. | 2 |
| 19 | US03 | Eliminar vehículo | Como Dueño, Quiero eliminar un vehículo de mi flota, Para retirar unidades que ya no forman parte de mi operación. | 2 |
| 20 | US04 | Consultar flota de vehículos | Como Dueño, Quiero visualizar todos mis vehículos con su estado y kilometraje, Para tener una vista general de mi flota. | 2 |
| 21 | US05 | Asignar conductor a vehículo | Como Dueño, Quiero asignar un conductor registrado a un vehículo, Para habilitar la operación de esa unidad. | 3 |
| 22 | US06 | Consultar conductores | Como Dueño, Quiero visualizar la lista de conductores registrados con su licencia y vehículo asignado, Para conocer la disponibilidad de mi personal. | 2 |
| 23 | US07 | Buscar conductores | Como Dueño, Quiero buscar conductores por nombre, correo o licencia, Para encontrar rápidamente a un conductor específico. | 2 |
| 24 | US08 | Registrar recarga de combustible | Como Conductor, Quiero registrar cada recarga de combustible con litros, costo y kilometraje, Para que el Dueño tenga visibilidad del consumo real de la unidad. | 3 |
| 25 | US09 | Consultar historial y rendimiento de combustible | Como Dueño, Quiero visualizar el historial de recargas con el rendimiento en km/L, Para analizar el consumo de cada unidad. | 3 |
| 26 | US10 | Detectar consumo anómalo | Como Dueño, Quiero que el sistema identifique las recargas con rendimiento inusualmente bajo, Para investigar posibles fugas, fallas o malas prácticas. | 5 |
| 27 | US11 | Consultar resumen de combustible | Como Dueño, Quiero ver el total de litros cargados, el gasto total y la cantidad de consumos anómalos, Para evaluar rápidamente el costo de combustible de mi flota. | 2 |
| 28 | US12 | Eliminar registro de combustible | Como Dueño, Quiero eliminar un registro de combustible incorrecto, Para mantener la exactitud del historial de consumo. | 2 |
| 29 | TS05 | Implementar flujo de solicitud de mantenimiento entre Dueño y Mecánica | Como Developer, Quiero implementar los endpoints que gestionan el ciclo de vida de una solicitud de mantenimiento (creación, diagnóstico, presupuesto, aprobación y cierre), Para que Dueños y talleres puedan coordinar un servicio de principio a fin desde la plataforma. | 5 |
| 30 | US13 | Enviar solicitud de mantenimiento | Como Dueño, Quiero enviar una solicitud de mantenimiento describiendo la falla de un vehículo, Para iniciar la atención por parte de un taller. | 3 |
| 31 | US14 | Registrar diagnóstico y cotización | Como Mecánica, Quiero registrar el diagnóstico y el costo estimado de una solicitud, Para que el Dueño evalúe el presupuesto. | 3 |
| 32 | US15 | Aprobar o rechazar presupuesto | Como Dueño, Quiero aprobar o rechazar el presupuesto propuesto por el taller, Para decidir si se realiza la reparación. | 3 |
| 33 | US16 | Iniciar reparación | Como Mecánica, Quiero registrar el inicio de la reparación aprobada, Para informar al Dueño que el vehículo está siendo atendido. | 2 |
| 34 | US17 | Completar mantenimiento | Como Mecánica, Quiero registrar la finalización de la reparación, Para que el vehículo vuelva a estar disponible para la operación. | 2 |
| 35 | US18 | Consultar solicitudes de mantenimiento | Como Dueño, Quiero visualizar todas las solicitudes de mantenimiento con su estado y presupuesto, Para hacer seguimiento a cada servicio. | 2 |
| 36 | US19 | Eliminar solicitud de mantenimiento | Como Dueño, Quiero eliminar una solicitud de mantenimiento, Para retirar solicitudes registradas por error. | 2 |
| 37 | US20 | Consultar talleres afiliados | Como Dueño, Quiero conocer los talleres afiliados con su ubicación, contacto, calificación y especialidades, Para elegir el más adecuado para mi vehículo. | 2 |
| 38 | US21 | Buscar talleres | Como Dueño, Quiero buscar talleres por nombre o ciudad, Para encontrar rápidamente un taller cercano. | 2 |
| 39 | US22 | Solicitar servicio a un taller | Como Dueño, Quiero enviar una solicitud de mantenimiento directamente a un taller elegido, Para que ese taller atienda mi vehículo. | 3 |
| 40 | US23 | Reportar incidencia | Como Conductor, Quiero reportar una falla o anomalía de mi vehículo durante la operación, Para que el Dueño esté informado y la atienda. | 3 |
| 41 | US24 | Revisar incidencia | Como Dueño, Quiero marcar una incidencia como en revisión, Para indicar que está siendo atendida. | 2 |
| 42 | US25 | Resolver incidencia | Como Dueño, Quiero marcar una incidencia como resuelta, Para cerrar su seguimiento. | 2 |
| 43 | US26 | Consultar incidencias | Como Dueño, Quiero visualizar las incidencias reportadas con su estado, Para dar seguimiento a los problemas de mi flota. | 2 |
| 44 | US27 | Eliminar incidencia | Como Dueño, Quiero eliminar una incidencia, Para retirar reportes duplicados o registrados por error. | 2 |
| 45 | TS04 | Implementar ingesta de datos IoT en tiempo real | Como Developer, Quiero implementar el servicio que recibe y procesa la telemetría enviada por los dispositivos IoT (GPS, odómetro, combustible), Para alimentar el monitoreo en tiempo real de la plataforma. | 8 |
| 46 | US28 | Ver ubicación de la flota en tiempo real | Como Dueño, Quiero visualizar la posición actual de cada vehículo con dispositivo IoT, Para supervisar dónde se encuentra mi flota. | 8 |
| 47 | US29 | Consultar indicadores de monitoreo | Como Dueño, Quiero conocer la velocidad de cada vehículo y los indicadores del monitoreo, Para evaluar el comportamiento de mi flota en ruta. | 5 |
| 48 | US30 | Recibir alerta de exceso de velocidad | Como Dueño, Quiero recibir una alerta cuando un vehículo supere el límite de velocidad, Para corregir conductas de riesgo. | 5 |
| 49 | US31 | Recibir notificación de incidencia | Como Dueño, Quiero ser notificado cuando un conductor reporta una incidencia, Para atenderla sin demora. | 3 |
| 50 | US32 | Consultar alertas y notificaciones | Como Dueño, Quiero visualizar las alertas generadas y mis notificaciones, Para revisar los eventos críticos de mi flota. | 3 |
| 51 | US33 | Marcar notificación como leída | Como Dueño, Quiero marcar una notificación como leída, Para distinguir las notificaciones que ya revisé. | 1 |
| 52 | US34 | Consultar catálogo de dispositivos IoT | Como Dueño, Quiero conocer los dispositivos IoT disponibles y sus precios, Para elegir el equipamiento adecuado para mi flota. | 2 |
| 53 | US35 | Comprar dispositivo IoT | Como Dueño, Quiero comprar una cantidad determinada de dispositivos IoT, Para equipar mis vehículos con monitoreo. | 5 |
| 54 | US36 | Consultar historial de pedidos | Como Dueño, Quiero visualizar mis pedidos de dispositivos IoT, Para hacer seguimiento a mis compras. | 2 |
| 55 | US37 | Actualizar estado de pedido | Como Dueño, Quiero registrar el avance de mi pedido hasta su entrega, Para mantener actualizado su seguimiento. | 2 |
| 56 | US41 | Consultar panel general | Como Dueño, Quiero ver un resumen del estado de mi operación al ingresar a la plataforma, Para identificar de inmediato lo que requiere mi atención. | 5 |
| 57 | TS06 | Implementar generación de reportes | Como Developer, Quiero implementar los endpoints de generación de reportes de combustible y mantenimiento, Para que Dueños y talleres puedan analizar su operación desde la plataforma. | 5 |
| 58 | US42 | Consultar resumen consolidado de la flota | Como Dueño, Quiero ver los datos consolidados de vehículos, combustible y mantenimiento, Para conocer el costo total de mi operación. | 3 |
| 59 | US43 | Comparar rendimiento por vehículo | Como Dueño, Quiero comparar el gasto de combustible y el rendimiento promedio de cada vehículo, Para identificar las unidades menos eficientes. | 5 |
| 60 | US44 | Exportar reporte de rendimiento | Como Dueño, Quiero exportar el reporte de rendimiento de mi flota, Para compartirlo o archivarlo. | 3 |
| 61 | US45 | Consultar historial de reportes | Como Dueño, Quiero visualizar los reportes que exporté anteriormente, Para llevar control de los reportes generados. | 2 |