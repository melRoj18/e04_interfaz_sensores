# E04 – Interfaz Adaptativa y Sensores

App Flutter que muestra layouts adaptativos (NavigationBar ⇄ NavigationRail), lectura de sensores (acelerómetro, giroscopio), batería, información del dispositivo y gestión de permisos.

## Estructura

- `lib/models/` – Entidades de datos
- `lib/services/` – Acceso a plugins (sensores, batería, etc.)
- `lib/providers/` – Estado con ChangeNotifier
- `lib/ui/` – Pantallas y widgets
- `lib/utils/` – Utilidades (breakpoints)

## Ejecución

1. `flutter pub get`
2. `flutter run`

> **Nota:** Los sensores requieren un dispositivo físico.

## Video demostrativo
