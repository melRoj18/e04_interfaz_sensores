

## Video demostrativo

https://github.com/user-attachments/assets/c0c510d2-3580-4a55-a6dc-9e8f7b297673

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
