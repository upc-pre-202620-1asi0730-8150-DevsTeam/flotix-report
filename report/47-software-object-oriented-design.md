## 4.7. Software Object-Oriented Design



### 4.7.1. Class Diagrams



**Bounded Context: Identity, Profiles & Security**



Gestiona la identidad y autenticación centralizada de los usuarios de la plataforma. Se basa en la clase abstracta User (con credenciales y tipo de rol) y sus especializaciones orientadas a objetos: Owner, Driver y Mechanic.



**Bounded Context: Vehicle & Fleet Management**



Administra las unidades móviles y la asignación de recursos de transporte. La entidad principal es Vehicle, que almacena información de placa, tipo, kilometraje actual y estado, vinculándose directamente con los dueños y conductores autorizados.



**Bounded Context: Fuel Control**



Controla el consumo y rendimiento del combustible por cada unidad. Se centra en la entidad FuelRecord, la cual registra litros cargados, costos asociados y kilometraje actual para calcular la eficiencia operativa.



**Bounded Context: Maintenance Management**



Coordina el ciclo de vida de las revisiones preventivas y correctivas. Incluye la entidad MaintenanceRequest, que permite gestionar solicitudes de servicio, presupuestos del taller y estados de reparación entre dueños y mecánicos.



**Bounded Context: Incident Management**



Registra las incidencias y anomalías mecánicas o operativas presentadas durante la jornada laboral. Utiliza la entidad Incident para reportar, describir y dar seguimiento a las fallas imprevistas de los vehículos en ruta.



**Bounded Context: Real-Time Monitoring / Fleet Tracking**



Monitorea la ubicación GPS y la telemetría en tiempo real de la flota. Gestiona los dispositivos físicos mediante IoTDevice y sus flujos de datos históricos a través de TelemetryData.



**Bounded Context: Alerts & Notifications**



Gestiona el sistema de avisos automáticos y advertencias del sistema. Incluye la entidad Alert, encargada de evaluar umbrales críticos, y Notification, que procesa los mensajes dirigidos a los usuarios según eventos clave de la operación.



**Bounded Context: Digital Experience / IoT Commerce**



Soporta el flujo de comercio electrónico y adquisición de hardware de la plataforma. Se estructura mediante IoTOrder, permitiendo a los dueños de flota comprar dispositivos IoT (GPS y sensores) para equipar sus vehículos.



**Bounded Context: Reporting & Analytics**



Administra la generación de informes comparativos e indicadores de rendimiento. Se basa en la entidad Report, que consolida métricas operativas, de combustible y de mantenimiento para apoyar la toma de decisiones del negocio.



> **Figura 4.7.1.** Diagrama de Clases resultante, agrupado por Bounded Context.

> ![Diagrama de Clases](../assets/images/Diagrama%20de%20Clases.png)