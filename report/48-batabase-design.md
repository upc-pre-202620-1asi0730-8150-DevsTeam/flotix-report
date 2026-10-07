## 4.8. Database Design



### 4.8.1. Database Diagrams



> **Figura 4.8.1.** Diagrama de Base de Datos — modelo relacional en PostgreSQL.

> ![Diagrama de Base de Datos](../assets/images/Diseño%20de%20Base%20de%20Datos.png)



El diagrama de base de datos traduce a nivel de persistencia los nueve Bounded Contexts identificados en la arquitectura de software, estableciendo las tablas, atributos, llaves primarias, llaves foráneas y relaciones necesarias para soportar la operación de Flotix sobre un modelo relacional en PostgreSQL.



**Bounded Context: Identity, Profiles & Security**



Administra la identidad y los accesos diferenciados de los actores del sistema. Incluye:



- users: Identificador único (UUID), nombre, correo electrónico, hash de contraseña, tipo de rol, número de licencia, fecha de expiración de licencia, nombre de empresa y nombre de taller.

**Bounded Context: Vehicle & Fleet Management**



Controla el registro y disponibilidad del parque automotor de la flota. Incluye:



- vehicles: Identificador, ID del propietario (FK a users), ID del conductor asignado (FK a users, opcional), placa, tipo de vehículo, kilometraje actual y estado operativo.

**Bounded Context: Fuel Control**



Registra el abastecimiento y los gastos de combustible en las unidades. Incluye:



- fuel_records: Identificador, ID de vehículo (FK), ID de conductor (FK), cantidad de litros, costo total, kilometraje al reabastecer y fecha de registro.

**Bounded Context: Maintenance Management**



Soporta la coordinación de servicios mecánicos y presupuestos. Incluye:



- maintenance_requests: Identificador, ID de vehículo (FK), ID de mecánico o taller (FK), descripción de la falla, costo estimado, estado de la solicitud y fecha de creación.

**Bounded Context: Incident Management**



Almacena el registro de las fallas imprevistas reportadas en campo. Incluye:



- incidents: Identificador, ID de vehículo (FK), ID de conductor (FK), descripción del problema, estado de la incidencia y fecha de reporte.

**Bounded Context: Real-Time Monitoring / Fleet Tracking**



Gestiona la información de hardware y rastreo satelital. Incluye:



- **iot_devices:** Dispositivos asociados al vehículo con identificador, ID de vehículo (FK), número de serie y estado de conexión.

- **telemetry_data:** Registros periódicos con ID de dispositivo (FK), latitud, longitud, velocidad y marca de tiempo.

**Bounded Context: Alerts & Notifications**



Administra las alertas preventivas y la mensajería interna para los usuarios. Incluye:



- alerts: Identificador, ID de vehículo (FK), tipo de alerta y fecha de activación.

- notifications: Identificador, ID de usuario destinatario (FK), ID de alerta asociada (FK, opcional), contenido del mensaje, indicador de lectura y fecha de envío.

**Bounded Context: Digital Experience / IoT Commerce**



Registra las transacciones de compra de equipos telemáticos. Incluye:



- iot_orders: Identificador, ID del propietario (FK), cantidad de dispositivos solicitados, monto total, estado del pedido y fecha de orden.

**Bounded Context: Reporting & Analytics**



Agrupa los metadatos de los reportes generados por la plataforma. Incluye:



- reports: Identificador, ID del propietario (FK), tipo de reporte, fecha de generación y parámetros de filtrado aplicados.

**Relaciones entre contextos**



Aunque cada Bounded Context mantiene su propio conjunto de tablas lógicas, se conectan mediante llaves foráneas para mantener la integridad referencial y el flujo operativo:



- Vehicle & Fleet ↔ Identity: vehicles referencia a los usuarios mediante owner_id y driver_id.

- Módulos Operativos (Fuel, Maintenance, Incidents, Monitoring, Alerts) ↔ Vehicle & Fleet: Todas las tablas transaccionales y de telemetría referencian a vehicles mediante vehicle_id.

- Alerts ↔ Notifications: La tabla notifications vincula las alertas generadas con los usuarios afectados.

- IoT Commerce & Reporting ↔ Identity: iot_orders y reports se vinculan directamente al propietario (owner_id) registrado en el módulo de seguridad.

Estas relaciones permiten la trazabilidad de extremo a extremo del negocio, respaldando directamente los Business Outcomes planteados en el Lean UX Canvas (sección 1.2.2.4), orientados a reducir el gasto de combustible y disminuir los mantenimientos correctivos de emergencia.