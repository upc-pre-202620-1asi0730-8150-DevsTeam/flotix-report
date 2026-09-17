## 4.2. Information Architecture



La arquitectura de información de Flotix se diseña con el objetivo de facilitar el acceso, comprensión y uso de la plataforma por parte de los distintos tipos de usuarios: administradores o dueños de flota, conductores y talleres mecánicos.



Se prioriza una estructura clara, intuitiva y orientada a tareas, permitiendo que los usuarios encuentren rápidamente la información y funcionalidades necesarias para gestionar vehículos, controlar el consumo de combustible, programar mantenimientos y realizar el monitoreo de las unidades.



La arquitectura se encuentra alineada con la identidad visual de Flotix y con sus principios de simplicidad, consistencia y relación entre el sistema y el mundo real.



### 4.2.1. Organization Systems



En Flotix, los sistemas de organización se definen con el objetivo de estructurar la información de manera clara y coherente, facilitando que los administradores, conductores y talleres puedan realizar sus tareas de forma intuitiva y eficiente.



Para ello, se combinan diferentes enfoques de organización visual y esquemas de categorización relacionados con la gestión y operación de flotas de transporte.



**Organización visual del contenido**



Se emplean distintos tipos de organización visual según el contexto de uso dentro de la plataforma.



**Organización jerárquica (Visual Hierarch)**



Se aplica principalmente en el dashboard, los detalles de los vehículos, reportes y alertas.



La información se presenta según niveles de importancia, destacando elementos críticos como:



- Estado de los vehículos.

- Alertas de mantenimiento.

- Consumo de combustible.

- Vehículos fuera de servicio.

- Incidencias.

- Indicadores de rendimiento de la flota.

Esto permite que los administradores identifiquen rápidamente la información que requiere atención.



**Organización secuencial (Step-by-step)**



Se utiliza en los flujos operativos que requieren completar varias acciones consecutivas.



Por ejemplo:



Registro de vehículo → Asignación de conductor → Monitoreo → Registro de combustible → Mantenimiento → Historial



También se aplica en procesos como la solicitud de mantenimiento:



Reporte de incidencia → Solicitud de mantenimiento → Revisión del taller → Cotización → Aprobación → Mantenimiento → Finalización



Este enfoque guía al usuario mediante pasos definidos, reduciendo errores y facilitando la ejecución de las tareas.



**Organización matricial**



Se aplica principalmente en tablas y listados de vehículos, mantenimientos, registros de combustible e incidencias.



Permite visualizar múltiples variables simultáneamente, como:



- Vehículo.

- Conductor.

- Estado.

- Kilometraje.

- Fecha.

- Consumo.

- Tipo de mantenimiento.

- Taller asignado.

Esto facilita la comparación de información y la toma de decisiones por parte del administrador.



**Esquemas de categorización del contenido**



La plataforma utiliza diferentes esquemas de categorización para organizar la información de manera eficiente. Categorización por tópicos



Es el esquema principal de organización y se refleja en los módulos del sistema:



- Dashboard.

- Vehículos.

- Conductores.

- Combustible.

- Mantenimiento.

- Monitoreo GPS.

- Talleres.

- Reportes.

Esta estructura agrupa las funcionalidades según las principales tareas de gestión de la flota.



**Categorización según audiencia**



El contenido y las funcionalidades se adaptan de acuerdo con el tipo de usuario.



Administrador o dueño de flota:



- Dashboard.

- Gestión de vehículos.

- Conductores.

- Combustible.

- Mantenimiento.

- Monitoreo.

- Reportes.

Conductor:



- Vehículo asignado.

- Registro de combustible.

- Reporte de incidencias.

- Alertas.

- Mantenimiento.

Taller mecánico:



- Solicitudes de mantenimiento.

- Información del vehículo.

- Historial de mantenimiento.

- Cotizaciones.

- Estado de los servicios.

De esta manera, cada usuario accede principalmente a la información necesaria para cumplir con sus responsabilidades dentro del sistema.



**Categorización cronológica**



Se aplica en los historiales y registros de la plataforma, permitiendo visualizar la evolución de los eventos en el tiempo.



Se utiliza principalmente en:



- Historial de mantenimiento.

- Registro de combustible.

- Historial de incidencias.

- Historial de kilometraje.

- Historial de servicios realizados.

Los registros pueden ordenarse desde los eventos más recientes hasta los más antiguos.



**Categorización alfabética**



Se utiliza de manera complementaria en listas donde el nombre facilita la búsqueda de información.



Por ejemplo:



- Conductores.

- Talleres.

- Vehículos por placa.

- Empresas registradas.

**Organización estructural del sistema**



La plataforma se organiza en módulos principales que representan las actividades necesarias para la gestión de una flota.



- Dashboard: presenta una vista general del estado de la flota, indicadores, alertas y métricas.

- Vehículos: permite registrar, consultar y administrar las unidades de la flota.

- Conductores: permite gestionar la información y asignación de conductores.

- Combustible: permite registrar y analizar el consumo de combustible.

- Mantenimiento: permite programar, consultar y realizar seguimiento de los mantenimientos.

- Monitoreo GPS: permite visualizar la ubicación y estado de las unidades en tiempo real.

- Talleres: permite gestionar talleres y solicitudes de mantenimiento.

- Reportes: presenta métricas e información histórica para apoyar la toma de decisiones.

Esta estructura permite que los usuarios naveguen de forma lógica dentro del sistema, alineando la organización de la información con las actividades reales de la gestión de flotas.



### 4.2.2. Labeling Systems



El sistema de etiquetado de Flotix está diseñado para representar la información de manera clara, breve y consistente, facilitando la comprensión por parte de los usuarios y reduciendo la ambigüedad durante la interacción con la plataforma.



Se prioriza el uso de etiquetas cortas, directas y relacionadas con el lenguaje utilizado en la gestión de flotas, considerando que los usuarios pueden tener diferentes niveles de experiencia tecnológica.



**Principios de etiquetado**



**Simplicidad**



Se utilizan etiquetas con el menor número de palabras posible, evitando términos técnicos o complejos. Esto permite que los usuarios identifiquen rápidamente la funcionalidad de cada elemento.



**Claridad**



Las etiquetas representan directamente la acción o contenido al que hacen referencia, evitando términos ambiguos.



**Consistencia**



Se mantiene un uso uniforme de términos en toda la plataforma.



Por ejemplo, siempre se utiliza “Vehículos” en lugar de alternar entre términos como “Unidades”, “Autos” o “Carros” cuando se hace referencia al mismo elemento dentro de la interfaz.



**Lenguaje del dominio**



Se emplean términos familiares para los usuarios del sector transporte y mantenimiento vehicular, como:



- Vehículo.

- Conductor.

- Combustible.

- Kilometraje.

- Mantenimiento.

- Taller.

- Incidencia.

- Ruta.

- GPS.

Esto permite relacionar fácilmente la plataforma con los procesos que los usuarios realizan actualmente de manera manual.



**Etiquetas principales del sistema**



Las siguientes etiquetas representan los módulos principales:



- Dashboard.

- Vehículos.

- Conductores.

- Combustible.

- Mantenimiento.

- Monitoreo GPS.

- Talleres.

- Reportes.

Estas etiquetas corresponden a las funcionalidades principales del sistema y permiten una navegación clara y directa.



**Etiquetas de acciones**



Para las acciones principales se utilizan verbos claros y directos:



- Registrar vehículo.

- Editar vehículo.

- Eliminar vehículo.

- Asignar conductor.

- Registrar combustible.

- Reportar incidencia.

- Programar mantenimiento.

- Solicitar mantenimiento.

- Ver ubicación.

- Generar reporte.

- Aprobar cotización.

- Finalizar mantenimiento.

Estas etiquetas permiten que el usuario comprenda rápidamente la acción que realizará.



**Etiquetas de asociaciones**



Las relaciones entre los elementos del sistema se representan mediante etiquetas claras:



- Vehículo asignado.

- Conductor asignado.

- Taller asignado.

- Mantenimiento programado.

- Solicitud de mantenimiento.

- Historial del vehículo.

- Registro de combustible.

- Incidencia asociada.

Estas etiquetas permiten comprender cómo se relacionan los diferentes elementos dentro de la plataforma.



### 4.2.3. SEO Tags and Meta Tags



En Flotix, las SEO Tags y Meta Tags se definen con el objetivo de mejorar la visibilidad de la página web en motores de búsqueda y comunicar claramente el propósito de la plataforma.



Estas etiquetas permiten optimizar la indexación del contenido y facilitar que empresas, propietarios de vehículos y operadores de transporte interesados en soluciones de gestión de flotas puedan encontrar la plataforma.



Las metaetiquetas se implementan dentro del documento HTML para describir el contenido de cada página mediante elementos como título, descripción, palabras clave y autor.



**Página de inicio**



- Título: Flotix | Gestión inteligente de flotas de transporte

- Meta descripción: Gestiona y monitorea tu flota en una sola plataforma. Controla vehículos, combustible, mantenimiento y ubicación en tiempo real con Flotix.

- Palabras clave: gestión de flotas, monitoreo GPS, control de combustible, mantenimiento vehicular, gestión de vehículos, telemática, transporte

- Autor: Developer Team

**Sección de funcionalidades**



- Título: Funcionalidades de Flotix | Gestión y monitoreo de flotas

- Meta descripción: Conoce las funcionalidades de Flotix para gestionar vehículos, controlar combustible, programar mantenimientos y monitorear unidades en tiempo real.

- Palabras clave: gestión de vehículos, control de combustible, mantenimiento preventivo, monitoreo GPS, gestión de flotas

- Autor: Developer Team

**Sección de contacto**



- Título: Contacto | Flotix

- Meta descripción: Contáctate con el equipo de Flotix para conocer más sobre nuestra plataforma de gestión y monitoreo de flotas.

- Palabras clave: contacto Flotix, soporte Flotix, gestión de flotas, monitoreo vehicular

- Autor: Developer Team

**Página de inicio de sesión**



- Título: Iniciar sesión | Flotix

- Meta descripción: Accede a tu cuenta de Flotix para gestionar vehículos, combustible, mantenimiento y monitoreo de tu flota.

- Palabras clave: iniciar sesión Flotix, gestión de flotas, monitoreo vehicular

- Autor: Developer Team

**Panel de control**



- Título: Dashboard | Flotix

- Meta descripción: Consulta el estado de tu flota, consumo de combustible, mantenimientos, alertas y ubicación de tus vehículos desde un solo panel.

- Palabras clave: dashboard de flotas, indicadores vehiculares, consumo de combustible, mantenimiento, monitoreo GPS

- Autor: Developer Team

**Página de gestión de vehículos**



- Título: Gestión de vehículos | Flotix

- Meta descripción: Registra, administra y consulta la información de los vehículos de tu flota desde Flotix.

- Palabras clave: gestión de vehículos, administración de flotas, registro vehicular, vehículos

- Autor: Developer Team

### 4.2.4. Searching Systems



El sistema de búsqueda de Flotix está diseñado para facilitar el acceso rápido y eficiente a la información de la plataforma, evitando que los usuarios tengan que revisar manualmente grandes cantidades de registros.



Se prioriza una experiencia de búsqueda simple, precisa y orientada a tareas, permitiendo localizar información relevante en el menor tiempo posible.



**Tipos de búsqueda**



La plataforma incorpora barras de búsqueda en los módulos donde existe una cantidad considerable de información.



El usuario puede realizar búsquedas utilizando diferentes criterios:



- Placa del vehículo.

- Nombre del conductor.

- Nombre del taller.

- Código de mantenimiento.

- Tipo de vehículo.

- Registro de incidencia.

Estas búsquedas permiten acceder rápidamente a registros específicos.



**Filtros de búsqueda**



Para complementar la búsqueda, se implementan filtros que permiten refinar los resultados.



**En el módulo de vehículos**



- Estado.

- Tipo de vehículo.

- Conductor asignado.

- Fecha de registro.

- Disponibilidad.

**En el módulo de combustible**



- Vehículo.

- Fecha.

- Rango de consumo.

- Conductor.

- Tipo de combustible.

**En el módulo de mantenimiento**



- Estado.

- Vehículo.

- Tipo de mantenimiento.

- Fecha.

- Taller.

**En el módulo de incidencias**



- Estado.

- Tipo de incidencia.

- Vehículo.

- Fecha.

- Prioridad.

El uso de filtros permite reducir el volumen de resultados y facilita la localización de información relevante.



**Presentación de resultados**



Los resultados de búsqueda se presentan de manera clara y estructurada mediante:



- Tablas organizadas.

- Cards en dispositivos móviles.

- Ordenamiento por criterios.

- Paginación.

- Información resumida del registro.

Cada resultado presenta información relevante, como vehículo, estado, fecha, conductor o taller asociado, dependiendo del módulo consultado.



**Retroalimentación al usuario**



El sistema proporciona retroalimentación clara durante la búsqueda:



- Mensajes cuando no se encuentran resultados.

- Indicadores de carga durante búsquedas.

- Actualización de resultados al aplicar filtros.

- Mensajes cuando se elimina o modifica un filtro.

### 4.2.5. Navigation Systems



El sistema de navegación de Flotix está diseñado para guiar a los usuarios a través de la plataforma de manera clara, eficiente y predecible, permitiéndoles cumplir sus objetivos sin dificultad.



Se prioriza una navegación intuitiva basada en las tareas principales del sistema y adaptada a los diferentes tipos de usuarios.



**Estructura de navegación principal**



La aplicación utiliza una navegación jerárquica mediante un menú lateral (sidebar) que permite acceder a los módulos principales:



- Dashboard.

- Vehículos.

- Conductores.

- Combustible.

- Mantenimiento.

- Monitoreo GPS.

- Talleres.

- Reportes.

Esta estructura permite una navegación rápida y consistente, especialmente para los administradores que necesitan supervisar diferentes aspectos de la flota.



**Navegación según el tipo de usuario**



La navegación se adapta según el rol del usuario.



Administrador o dueño de flota:



Dashboard → Vehículos → Conductores → Combustible → Mantenimiento → Monitoreo → Talleres → Reportes



Conductor:



Inicio → Vehículo asignado → Combustible → Incidencias → Mantenimiento → Alertas



Taller mecánico:



Inicio → Solicitudes → Vehículo → Historial → Cotización → Mantenimiento



Esto permite mostrar únicamente las funcionalidades relevantes para cada tipo de usuario.



**Navegación en la Landing Page**



La página de inicio utiliza una navegación superior (navbar) con acceso a las principales secciones informativas:



- Inicio.

- Beneficios.

- Funcionalidades.

- Cómo funciona.

- Contacto.

- Iniciar sesión.

- Registrarse.

Además, se incluyen llamados a la acción como:



- “Comenzar ahora”

- “Solicitar demo”

Estos elementos orientan al visitante hacia el registro o contacto con la plataforma.



**Navegación contextual**



Dentro de cada módulo, la navegación se complementa con elementos contextuales:



- Botones de acción.

- Enlaces hacia detalles.

- Tablas interactivas.

- Migas de pan.

- Enlaces hacia registros relacionados.

Por ejemplo, desde el detalle de un vehículo se puede acceder directamente a:



**Vehículo → Historial de mantenimiento → Detalle del mantenimiento**



Esto permite realizar acciones sin abandonar el contexto de trabajo.



**Flujos de navegación (recorrido del usuario)**



El sistema guía a los usuarios mediante flujos definidos según sus objetivos.



**Gestión de vehículos (Dueño)**



Dashboard → Vehículos → Registrar vehículo → Completar información → Guardar → Ver detalle



**Control de combustible (Conductor)**



Inicio → Combustible → Registrar combustible → Ingresar información → Guardar registro



**Mantenimiento preventivo (Dueño)**



Dashboard → Mantenimiento → Seleccionar vehículo → Programar mantenimiento → Confirmar → Notificación



**Solicitud de mantenimiento (Conductor)**



Inicio → Incidencias → Reportar incidencia → Solicitar mantenimiento → Enviar solicitud → Seguimiento



**Atención de mantenimiento (Taller)**



Inicio → Solicitudes → Seleccionar solicitud → Revisar vehículo → Generar cotización → Esperar aprobación → Realizar mantenimiento → Finalizar servicio



**Monitoreo de vehículo (Dueño)**



Dashboard → Monitoreo GPS → Seleccionar vehículo → Visualizar ubicación y estado



Estos flujos representan los principales procesos de operación de Flotix y permiten que las tareas se realicen de manera ordenada y predecible. Navegación responsive



En dispositivos móviles, la navegación se adapta mediante:



- Menú lateral plegable.

- Reorganización del contenido en formato vertical.

- Priorización de acciones principales.

- Cards para presentar información resumida.

- Botones adaptados para interacción táctil.

En el caso de los conductores, se priorizan las funciones que necesitan durante su jornada, como el registro de combustible, reporte de incidencias, consulta de alertas y mantenimiento del vehículo.



Justificación: La navegación responsive permite mantener la funcionalidad de Flotix en diferentes dispositivos y facilita que cada tipo de usuario pueda acceder a las funciones que necesita desde el contexto en el que trabaja.