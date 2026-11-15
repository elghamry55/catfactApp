# Cat Facts App

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter" />
  <img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white" alt="Dart" />
  <img src="https://img.shields.io/badge/Dio-00A98F?style=for-the-badge" alt="Dio" />
</p>

A simple Flutter application that retrieves interesting cat facts from the [Cat Facts API](https://catfact.ninja/). Users can read a fact and request another one with a button.

## Features

- Fetch a random cat fact from the API.
- Display the returned fact and its character length.
- Request another fact on demand.
- Show a loading indicator while fetching data.
- Handle request errors with an in-app message.

## Technology Stack

| Technology | Usage |
| --- | --- |
| Flutter & Dart | Mobile application UI and logic |
| Dio | HTTP request handling |
| Cat Facts API | Random cat fact data source |

## Getting Started

### Requirements

- Flutter SDK
- Dart SDK compatible with the project's `pubspec.yaml`
- Android Studio, VS Code, or another Flutter-supported IDE

### Run locally

```bash
git clone https://github.com/elghamry55/catfactApp.git
cd catfactApp
flutter pub get
flutter run
```

## API

The app requests facts from:

```
https://catfact.ninja/fact
```

## Developer

**Mahmoud Elghamry** · Flutter Developer
