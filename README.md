
Rick and Morty App
Una aplicación de Flutter que muestra personajes de Rick and Morty, permitiendo a los usuarios visualizar sus detalles y marcarlos como favoritos. La aplicación implementa una arquitectura limpia y está diseñada siguiendo los principios SOLID.

Instrucciones para ejecutar la aplicación
Clona el repositorio: 

git clone https://github.com/afyaruro/rick_and_morty.git


Instala las dependencias:
flutter pub get



Por defecto, la aplicación se inicia desde el archivo main.dart ubicado en la capa de presentación.

flutter run



Arquitectura y decisiones técnicas
El proyecto sigue una arquitectura limpia, dividiendo la aplicación en capas bien definidas:

1. Capa de Presentación
Contiene las vistas (UI) y los stores para la gestión del estado.
Utiliza MobX como manejador de estados para una interacción reactiva entre la UI y los datos.
2. Capa de Lógica de Dominio
Define las entidades centrales de la aplicación y los casos de uso.
Estos casos encapsulan las reglas de negocio.
3. Capa de Datos
Implementa las fuentes de datos, incluyendo la persistencia local con Hive.
Contiene los modelos que interactúan con la base de datos y la lógica necesaria para convertirlos en entidades de dominio.
Conexion por https a la api de rick and morty

Decisiones técnicas importantes:
Principios SOLID:

Responsabilidad única: Cada clase tiene una única responsabilidad.
Inyección de dependencias: Implementada usando el paquete get_it, que gestiona eficientemente las dependencias en todo el proyecto.
Hive para almacenamiento local:
La base de datos local permite guardar y gestionar los favoritos de los usuarios de manera rápida y eficiente.

MobX:
Simplifica la gestión del estado y asegura una actualización fluida de la UI cuando cambian los datos.

Funcionalidades implementadas
Visualización de personajes:
Muestra una lista de personajes con sus detalles principales.

Favoritos:

Permite agregar y eliminar personajes de una lista de favoritos.
Los favoritos se guardan en la base de datos local utilizando Hive.
Detalles de personajes:
Una pantalla dedicada a mostrar información detallada de cada personaje, incluyendo estado, especie, género, entre otros.

Funcionalidades extra
Diseño atractivo:

Interfaz visualmente atractiva con imágenes de fondo
Uso de Google Fonts para una tipografía moderna.
Gestión eficiente del estado:
Actualización dinámica de la UI utilizando MobX sin necesidad de recargar manualmente la pantalla.

Inyección de dependencias:
Uso de GetIt para desacoplar componentes
