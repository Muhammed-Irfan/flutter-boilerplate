# Flutter Boilerplate

A Flutter project using Clean Architecture with BLoC pattern, dependency injection, and environment-specific configurations.

## Prerequisites

- Flutter SDK (3.19.0 or higher)
- Dart SDK (3.3.0 or higher)
- Android Studio / VS Code
- Git

## Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/your-username/flutter_boilerplate.git
cd flutter_boilerplate
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Set Up Environment Files

Create the following environment files in the root directory:

```bash
# .dev.env
API_BASE_URL=https://dev-api.example.com
API_KEY=your_dev_api_key
ENABLE_LOGGING=true
```

### 4. Generate Required Files

Run the build runner to generate necessary files:

```bash
dart run build_runner build --delete-conflicting-outputs
```

### 5. Running the App

#### Development Environment
```bash
flutter run --flavor dev -t lib/main_dev.dart --dart-define-from-file=.dev.env
```

#### Staging Environment
```bash
flutter run --flavor staging -t lib/main_staging.dart --dart-define-from-file=.staging.env
```

#### Production Environment
```bash
flutter run --flavor prod -t lib/main.dart --dart-define-from-file=.prod.env
```

### 6. Building the App

#### Android
```bash
# Development
flutter build apk --flavor dev -t lib/main_dev.dart --dart-define-from-file=.dev.env

# Staging
flutter build apk --flavor staging -t lib/main_staging.dart --dart-define-from-file=.staging.env

# Production
flutter build apk --flavor prod -t lib/main.dart --dart-define-from-file=.prod.env
```

#### iOS
```bash
# Development
flutter build ios --flavor dev -t lib/main_dev.dart --dart-define-from-file=.dev.env

# Staging
flutter build ios --flavor staging -t lib/main_staging.dart --dart-define-from-file=.staging.env

# Production
flutter build ios  -t lib/main.dart --dart-define-from-file=.prod.env
```

## Project Structure

```
lib/
├── app.dart
├── main.dart
├── main_dev.dart
├── main_staging.dart
├── core/
│   ├── cache/
│   ├── config/
│   ├── constants/
│   ├── di/
│   ├── error/
│   ├── network/
│   ├── router/
│   └── services/
├── features/
│   └── some_feature/
│       ├── data/
│       ├── domain/
│       └── presentation/
└── shared/
    └── presentation/
```

## Architecture

This project follows Clean Architecture principles with the following layers:

- **Domain**: Business logic and entities
- **Data**: Data sources, repositories, and models
- **Presentation**: UI components and BLoC state management

## Key Features

- Clean Architecture
- BLoC Pattern for State Management
- Dependency Injection using get_it and injectable
- Environment-specific Configurations
- Secure Storage and SharedPreferences
- HTTP Client with Dio
- Route Management with go_router
- Error Handling
- Code Generation with freezed

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details