# preferencias_usuario_app

Manejo de preferencias compartidas almacenadas de baja persistencia (NSUserDefaults on iOS and macOS, SharedPreferences on Android) con la librería shared_preferences

## Manejo de Preferen. Global 
Se tuvo  que invocar al metodo "**WidgetsFlutterBinding.ensureInitialized()**"  en la clase **MAIN** debido a las capas de la arquitectura Flutter, WidgetFlutterBinding se usa para interactuar con el motor Flutter. Shared_preferences necesita llamar al código nativo para inicializar Shared_preferences globalmente, y dado que el complemento necesita usar canales de plataforma para llamar al código nativo, que se hace de forma asincrónica, por lo tanto, debe llamar a secureInitialized () para asegurarse de que tenga una instancia de WidgetsBinding.
> Algunas rutas de referencia de problemas similares:
- https://flutter.dev/docs/resources/architectural-overview#architectural-layers
- https://stackoverflow.com/questions/63873338/what-does-widgetsflutterbinding-ensureinitialized-do/63873689
- https://stackoverflow.com/questions/59346248/flutter-update-widgetsflutterbinding
- https://api.flutter.dev/flutter/widgets/WidgetsFlutterBinding/ensureInitialized.html

## Datos Adicionales 

- Version de Flutter: ">=2.12.0 <3.0.0"
- Shared Preferences: ^2.0.6

