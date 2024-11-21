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
git clone https://github.com/Muhammed-Irfan/flutter_boilerplate.git
cd flutter_boilerplate
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Set Up Environment Files

Create the following environment files in the root directory:

```bash
# .dev.env .prod.env .staging.env
API_BASE_URL=https://dev-api.example.com
```

### 4. Generate Required Files

Run the build runner to generate necessary files:

```bash
dart run build_runner build --delete-conflicting-outputs
```

### 5. Running the App

#### Development Environment
```bash
flutter run --flavor dev -t lib/main_dev.dart
```

#### Staging Environment
```bash
flutter run --flavor staging -t lib/main_staging.dart
```

#### Production Environment
```bash
flutter run --flavor prod -t lib/main_prod.dart
```

### 6. Building the App

#### Android
```bash
# Development
flutter build apk --flavor dev -t lib/main_dev.dart

# Staging
flutter build apk --flavor staging -t lib/main_staging.dart

# Production
flutter build apk --flavor prod -t lib/main_prod.dart
```

#### iOS
```bash
# Development
flutter build ipa --flavor dev -t lib/main_dev.dart

# Staging
flutter build ipa --flavor staging -t lib/main_staging.dart

# Production
flutter build ipa --flavor prod -t lib/main_prod.dart
```

## Project Structure

```

lib/
├── app.dart
├── main.dart
├── main_dev.dart
├── main_staging.dart
├── main_prod.dart
├── core/
│ ├── cache/
│ ├── config/
│ ├── constants/
│ ├── di/
│ ├── error/
│ ├── events/
│ ├── network/
│ │ ├── api_endpoints.dart
│ │ ├── dio_client.dart
│ │ └── interceptors/
│ ├── router/
│ ├── services/
│ │ ├── auth/
│ │ ├── logging/
│ │ └── storage/
│ ├── types/
│ └── utils/
├── features/
│ ├── auth/
│ │ ├── data/
│ │ ├── domain/
│ │ └── presentation/
│ └── posts/
│ ├── data/
│ ├── domain/
│ └── presentation/
└── shared/
└── presentation/
```

## Architecture

This project follows Clean Architecture principles with three main layers:

- **Domain**: Business logic and entities
- **Data**: Data sources, repositories, and models
- **Presentation**: UI components and BLoC state management

## Key Features

- Clean Architecture with Feature-First Organization
- BLoC Pattern for State Management
- Dependency Injection using get_it and injectable
- Environment-specific Configurations
- Secure Storage and SharedPreferences
- HTTP Client with Dio and Interceptors
  - Token Refresh Handling
  - Error Interceptor
  - Logging Interceptor (non-production)
- Route Management with go_router
- Comprehensive Error Handling
- Code Generation with freezed
- Multi-flavor support (dev, staging, prod)
- Event Bus for Cross-Feature Communication
- Talker for Advanced Logging
- Retrofit for Type-safe API Clients

## Security Features

- Secure Token Storage using flutter_secure_storage
- Automatic Token Refresh
- Session Management
- ProGuard Rules for Android

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details
