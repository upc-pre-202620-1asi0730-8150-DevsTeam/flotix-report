## 5.1. Software Configuration Management


### 5.1.1. Software Development Environment Configuration


Con el objetivo de garantizar un desarrollo fluido, estandarizado y consistente entre todos los miembros del equipo Developers Team, se ha definido el siguiente entorno de desarrollo para el ecosistema Flotix:


| Actividad | Producto | Propósito / Uso |
|---|---|--|
| Project Management | Trello | Gestión del Product Backlog, planificación de Sprints y seguimiento de tareas mediante tableros Kanban |
| Requirements Management | UXPressia | Elaboración de artefactos de descubrimiento (User Personas, Empathy Maps, Journey Maps, Impact Maps) para Dueño, Conductor y Mecánica |
| UX/UI Design | Figma | Diseño de la guía de estilo, wireframes y mock-ups del Landing Page y la Web Application |
| User Flows & Wireflows | FigJam / LucidChart | Elaboración de Wireflows y User Flows para los distintos roles de la plataforma |
| Software Architecture (C4 Model) | Structurizr | Elaboración de los diagramas de contexto, contenedores y componentes de la arquitectura de Flotix |
| Class Diagrams & Database Design | PlantUML / LucidChart | Elaboración de diagramas de clases UML y del modelo de base de datos relacional |
| Software Development (Landing Page) | Visual Studio Code | IDE para el desarrollo del Landing Page con HTML5, CSS3 y JavaScript |
| Version Control | GitHub | Alojamiento de repositorios y gestión de versiones aplicando GitFlow y Conventional Commits |
| Documentation | Markdown | Elaboración del Informe de Proyecto (Document Report) |


### 5.1.2. Source Code Management


El código fuente del proyecto se gestiona utilizando Git como sistema de control de versiones y GitHub como plataforma de alojamiento, bajo una organización pública del equipo. Se mantienen repositorios independientes por producto, favoreciendo la modularidad y el despliegue independiente de cada componente de la solución.


**Estrategia de Ramas (GitFlow)**


Se implementa un flujo de trabajo basado en GitFlow con el objetivo de garantizar la estabilidad y trazabilidad del desarrollo en todos los repositorios:


- **main:** rama principal que contiene únicamente código estable, probado y desplegado en producción.

- **develop:** rama de integración continua donde se consolidan los avances del equipo antes de su liberación a producción.

- **feature/[nombre]:** ramas temporales creadas a partir de develop para el desarrollo de una User Story o funcionalidad específica. Al finalizar, se integran a develop mediante un Pull Request revisado por al menos un integrante del equipo.

- **release/[version]:** ramas creadas a partir de develop para preparar una nueva versión antes de fusionarla con main.

- **hotfix/[nombre]:** ramas destinadas a la corrección de errores críticos detectados en producción (main), que requieren una solución inmediata.


**Convención de Commits (Conventional Commits)**


Para mantener un historial claro y consistente, todos los commits siguen el estándar de Conventional Commits:


- **feat:** nueva funcionalidad.

- **fix:** corrección de errores.

- **docs:** cambios en documentación.

- **style:** cambios de formato que no afectan la lógica.

- **refactor:** cambios internos de código sin alterar su comportamiento.

- **test:** adición o corrección de pruebas.

- **chore:** tareas de mantenimiento.


### 5.1.3. Source Code Style Guide & Conventions


Para garantizar la legibilidad, mantenibilidad y calidad del código en todo el equipo de desarrollo de Flotix, se adoptan las siguientes convenciones:


**Para el Landing Page (HTML / CSS / JavaScript)**


- Nomenclatura de archivos: kebab-case (ej. `hero-section.css`, `navbar.js`).

- Nomenclatura de clases CSS: metodología BEM (ej. `hero__title--highlight`).

- Estructura: separación clara entre `index.html`, `assets/css`, `assets/js` e `assets/images`.

- Formateo: indentación de 2 espacios, uso de Prettier para HTML/CSS/JS.


### 5.1.4. Software Deployment Configuration


En esta sección se describe la configuración del despliegue de la solución Flotix, detallando los pasos necesarios para publicar cada producto digital a partir de sus repositorios de código fuente.


**Landing Page**


Para esta primera entrega, el despliegue del Landing Page se realiza mediante GitHub Pages, aprovechando su capacidad de publicar contenido estático directamente desde un repositorio:


1. Creación del repositorio `flotix-landing` en la organización de GitHub del equipo.

2. Organización del proyecto asegurando que `index.html` se encuentre en la raíz del repositorio.

3. Subida del código fuente mediante commits siguiendo GitFlow y Conventional Commits.

4. Activación de GitHub Pages desde la configuración (Settings > Pages) del repositorio.

5. Selección de la rama `main` y la carpeta raíz (`/root`) como fuente de publicación.

6. Generación automática de la URL pública del sitio. Cada actualización enviada a la rama `main` se refleja automáticamente en la versión publicada.


**Consideraciones**


- El despliegue está orientado a contenido estático (HTML, CSS, JavaScript).

- No se requiere infraestructura adicional ni servidores externos.

- El acceso al sitio es público mediante una URL generada por GitHub Pages.