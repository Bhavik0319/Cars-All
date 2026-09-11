# Copilot Instructions for Cars & All

## Build, Test, and Lint Commands

### Flutter Setup
```bash
flutter pub get              # Install dependencies
flutter pub upgrade          # Update dependencies
flutter pub outdated         # Check for updates
```

### Running the App
```bash
flutter run                  # Run on connected device/emulator
flutter run -d <device-id>  # Run on specific device
flutter run --release       # Build release version
```

### Code Quality
```bash
flutter analyze              # Lint code (uses analysis_options.yaml)
flutter analyze --fatal-infos  # Treat infos as fatal (stricter)
flutter format lib          # Format code in lib directory
```

### Testing
```bash
flutter test                 # Run all tests in /test directory
flutter test test/widget_test.dart  # Run specific test file
```

### Build Artifacts
```bash
flutter build apk           # Build Android APK
flutter build ios           # Build iOS app
flutter build web           # Build web version
flutter build windows       # Build Windows executable
```

## High-Level Architecture

### Overall Structure
- **Feature-based structure**: Each major feature (auth, home, chat, payment, insurance, etc.) has its own directory under `/lib/app/screens/`
- **Shared code**: Common utilities, theme, widgets in `/lib/shared/`
- **State management**: **GetX** framework for all state management, routing, and dependency injection
- **Navigation**: GetX routing via `AppRouter` and `AppRoutes` (primary navigation system)

### Core Layers
1. **API Layer** (`/lib/app/data/api/`)
   - `ApiClient`: GetConnect-based HTTP client with interceptors for logging and auth headers
   - `ApiRoutes`: Centralized API endpoint definitions
   - Automatic request/response logging via interceptors

2. **Repository Layer** (`/lib/app/repository/`)
   - Abstracts API calls (auth_repo.dart, user_repo.dart, etc.)
   - Converts API responses to models
   - Single source of truth for data operations

3. **Service Layer** (`/lib/app/services/`)
   - `StorageService`: SharedPreferences wrapper for local storage
   - `AuthServices`: Authentication business logic
   - `UserStore`: User state holder

4. **Models** (`/lib/app/models/`)
   - Data classes with fromJson/toJson for serialization
   - Nested models support (e.g., UserModel contains OtherProfileDetails)
   - Category, Vehicle, Chat, Rating, Review models for major features

5. **Controllers** (`/lib/app/controller/`)
   - GetX controllers extending GetxController
   - Handle state via .obs (observable) properties
   - Use `update()` or `.obs` for reactivity

6. **UI Layer** (`/lib/app/screens/`)
   - Feature folders: auth, home, car_details, chat, payment, insurance, etc.
   - Each feature folder typically has: views/, widgets/, bindings/
   - Screens use `GetMaterialApp` with stateless/stateful widgets

### Dependency Injection & Service Locator
- **Primary**: GetX's Get.put() and Get.find() pattern
- Location: `main.dart` and `app_data.dart` setup
- Services registered at app startup: StorageService, ApiClient, AuthServices, BottomNavController

### Routing Architecture
- **Routes defined** in `AppRoutes` class (constants for all screens)
- **Navigation** via `Get.toNamed(AppRoutes.routeName)` or `Get.to(ScreenWidget())`
- **Bindings** for dependency injection per route (in bindings/ folders)
- GoRouter imported but not primary—GetX routing is the main navigation system

### Localization
- **Easy Localization** package for multi-language support
- Supported locales: en, hi, gu, te, ta, bn, as, kn, ml, mr, ur
- Language JSON files in `/assets/language/`
- Fallback locale: English

### Theme System
- Centralized theme in `/lib/shared/theme/`
- Single theme 'lightCode' (Light Code Colors)
- Material Design with custom color scheme
- No dark mode implemented

### Key External Packages
- **get**: Service locator, state management, and routing
- **dio**: HTTP client for API calls
- **socket_io_client**: Real-time chat via Socket.IO
- **syncfusion_flutter_charts & syncfusion_flutter_gauges**: Charts and gauge widgets for analytics
- **image_picker, video_player**: Media handling
- **geolocator, geocoding**: Location services
- **permission_handler**: Platform permissions
- **google_fonts**: Custom fonts
- **intl_phone_field**: Phone number input with validation
- **pull_to_refresh**: Refresh mechanism for lists

## Key Conventions

### File Naming
- **Models**: PascalCase (e.g., `UserModel.dart`, `VehicleModel.dart`)
- **Controllers**: PascalCase with Controller suffix (e.g., `BottomNavController.dart`)
- **Services**: PascalCase with Service suffix (e.g., `AuthServices.dart`)
- **Screens/Widgets**: camelCase with descriptive names (e.g., `reels_screen.dart`, `vehicle_list_view_tile.dart`)
- **Utilities**: camelCase (e.g., `date_converter.dart`, `scale_utility.dart`)

### Code Style
- Models use standard Dart class with private backing fields (e.g., `_id`)
- fromJson/toJson implementations for all models (serialization requirement)
- Controllers: Observable properties marked with `.obs`
- Widgets: Prefer StatelessWidget; use StatefulWidget only when necessary (e.g., ReelVideoItem)
- Logger usage: `Logger("Component 🔥")` for debug logging throughout the app

### State Management Patterns
- **GetX approach**: Use `RxInt`, `RxString`, `Rx<Model>` for reactive properties
- **Update trigger**: Call `.update()` on controllers or use `GetBuilder` widget for UI binding
- **GetBuilder**: For widget rebuilds tied to controller updates
- **Observable pattern**: Property changes automatically notify listeners
- **No mixed frameworks**: Use only GetX for state management throughout the app

### API Client Usage
- Always use `ApiClient.to.methodName()` (static accessor pattern)
- Callbacks pattern: `onSuccess: (res) {}`, `onError: (res) {}`
- Response body accessed via `res.body`, status via `res.statusCode`
- Token stored in SharedPreferences under `ConstantData.userBearerToken` key
- Interceptors log all requests/responses (disable in production if needed)

### Custom Widgets
- Use `CustomImageView` for cached image rendering
- Use `customSnackBar` for toast-like notifications
- Custom input widgets for phone, payment, etc. (check `flutter_typeahead`, `dropdown_button2`, `pin_code_fields`)
- Super tooltip for contextual help tooltips

### Constants & Data
- Text constants: `/lib/app/constants/text_data.dart`
- Asset constants: `/lib/app/constants/assetConstant.dart` (logo, images paths)
- Store app-wide constants here, not hardcoded in UI

### Utility Functions
- **Scale utility**: `scale_utility.dart` for responsive sizing (likely uses MediaQuery)
- **Date converter**: `date_converter.dart` for date formatting and parsing
- **Number format**: `numberFormat.dart` for currency/number formatting
- **Network info**: `network_info.dart` for connectivity checks
- **Logger**: Custom logger for structured debug output

### Model Serialization
- Always implement `fromJson` factory constructor
- Always implement `toJson()` method
- Handle nullable fields explicitly (use `??` and optional parameters)
- Use jsonEncode/jsonDecode from dart:convert when needed

### Localization Pattern
- Access strings via `context.tr('key')` or `'key'.tr()` after importing easy_localization
- Add new translations to all language JSON files simultaneously
- Test all locales by switching in app (if locale switcher exists)

### Asset Structure
- **Logos**: `/assets/logo/`
- **Images**: `/assets/images/`
- **Animations**: `/assets/no_data.json` (Lottie animations)
- **Language files**: `/assets/language/{locale}.json`
- All assets must be registered in pubspec.yaml flutter section

### Common Mistakes to Avoid
- Don't use multiple state management frameworks—use GetX exclusively
- Don't use print() directly—use Logger instead
- Don't hardcode API base URLs—check ApiRoutes for base URL
- Don't initialize services outside main.dart setup flow
- Don't forget to handle token expiration in ApiClient interceptors
- Don't add new dependencies without updating pubspec.yaml properly
