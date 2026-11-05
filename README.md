# 📰 News App

A modern, responsive Flutter application for browsing real-time news headlines, exploring categories, and searching articles powered by the [NewsAPI](https://newsapi.org/).

---

## ✨ Features

- 📑 **Category Browsing**: Explore news across multiple categories: *General, Business, Sports, Technology, Entertainment, Health, and Science*.
- 🌐 **News Sources**: Dynamically fetch and switch between various news sources per category.
- 🔍 **Real-Time Live Search**: Instant search filtering by *Article Title, Description, and Author*.
- 📱 **Floating Article BottomSheet**: Preview news details in a floating, animated bottom sheet card.
- 🔗 **In-App WebView**: Read full news articles directly within the app using `webview_flutter`.
- 🌓 **Theme Mode Support**: Toggle between **Light Mode** and **Dark Mode** seamlessly via `Provider`.
- 📐 **Responsive Design**: Scaled layout adapting across all screen sizes using `flutter_screenutil`.
- 🔒 **Secure API Key Setup**: Excludes secret API keys from version control via `.gitignore`.

---

## 🛠️ Tech Stack & Dependencies

- **Framework**: [Flutter](https://flutter.dev/) (Dart)
- **Networking**: [Dio](https://pub.dev/packages/dio)
- **State Management**: [Provider](https://pub.dev/packages/provider)
- **Screen Responsiveness**: [flutter_screenutil](https://pub.dev/packages/flutter_screenutil)
- **In-App Browsing**: [webview_flutter](https://pub.dev/packages/webview_flutter)
- **SVG Support**: [flutter_svg](https://pub.dev/packages/flutter_svg)

---

## 📁 Project Architecture

```text
lib/
├── core/
│   ├── providers/        # ThemeProvider for dark/light mode
│   ├── remote/network/   # ApiManager and Dio configuration
│   ├── theme/            # AppTheme, AppColors
│   └── utils/            # AppAssets, AppStrings, AppRoutes, ApiKeys
└── feature/
    ├── home/
    │   ├── models/       # ItemModel, NewsResponse, SourcesResponse
    │   ├── services/     # ApiServices (NewsAPI calls)
    │   ├── screen/       # HomeScreen
    │   └── widgets/      # Categories, NewsView, HomeAppBar, ArticleItem,
    │                     # ArticleBottomSheet, ArticleWebViewScreen, BuildDrawer
    └── splash/
        └── splash_screen.dart
```

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (v3.13.7+)
- Android Studio / VS Code
- A free API Key from [NewsAPI.org](https://newsapi.org/register)

### Installation & Setup

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/YOUR_USERNAME/news.git
   cd news
   ```

2. **Install Dependencies**:
   ```bash
   flutter pub get
   ```

3. **Configure API Key**:
   Create a file at `lib/core/utils/api_keys.dart`:
   ```dart
   class ApiKeys {
     static const String apiKey = 'YOUR_NEWS_API_KEY_HERE';
   }
   ```

4. **Run the App**:
   ```bash
   flutter run
   ```

---

## 📄 License

This project is open-source and available under the [MIT License](LICENSE).
