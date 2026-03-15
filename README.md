# 📇 Contact App

A sleek and modern Flutter application designed to manage your contacts efficiently. Users can save contact details including name, email, phone number, and a profile picture, all presented in a beautiful grid layout.

<p align="center">
  <img src="https://github.com/user-attachments/assets/a0c35360-4624-43be-bc56-1eb920174b8d" height="350"/>
  <img src="https://github.com/user-attachments/assets/fcf1a9d6-ebbe-4470-9af9-994ef0f9b90f" height="350"/>
  <img src="https://github.com/user-attachments/assets/40ccb2f7-7a1d-410a-8861-d93256d31516" height="350"/>
  <img src="https://github.com/user-attachments/assets/feba95d7-1817-40c3-bafc-55f950f4b54e" height="350"/>
</p>

---

## ✨ Features

*   **Add Contacts:** Easily add new contacts with their Name, Email, and Phone Number.
*   **Profile Pictures:** Select profile images from your gallery using `image_picker`.
*   **Persistent Storage:** Contacts are saved locally using `shared_preferences`, so they remain even after closing the app.
*   **Modern UI:** A clean "Dark Mode" inspired design with a grid-based contact list.
*   **Interactive Animations:** Integrated `Lottie` animations for empty states and transitions.
*   **Manage Contacts:** Delete contacts individually or clear the list.
*   **Professional Splash Screen:** Custom branded splash screen using `flutter_native_splash`.

---

## 🛠 Tech Stack

*   **Framework:** [Flutter](https://flutter.dev/)
*   **Language:** [Dart](https://dart.dev/)
*   **Key Packages:**
    *   `shared_preferences`: For local data persistence.
    *   `lottie`: For high-quality animations.
    *   `image_picker`: For selecting images from the device.
    *   `flutter_svg`: For rendering vector graphics.
    *   `flutter_native_splash`: For a seamless app launch experience.

---

## 📂 Project Structure

```text
lib/
├── core/
│   ├── models/           # Data models (Contact class)
│   ├── remote/local/     # Local storage management (PrefsManager)
│   ├── utils/            # App constants (Colors, Assets, Validators)
│   └── widgets/          # Reusable UI components (Cards, Sheets, FormFields)
├── screens/
│   └── home_screen.dart  # Main application screen
└── main.dart             # Application entry point
assets/
├── images/               # App icons and static images
└── lottie/               # Lottie animation JSON files
```

---

## 🚀 Getting Started

### Prerequisites
*   Flutter SDK installed.
*   Android Studio / VS Code with Flutter extension.

### Installation

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/your-username/contact-app.git
    ```
2.  **Navigate to the project directory:**
    ```bash
    cd contact-app
    ```
3.  **Install dependencies:**
    ```bash
    flutter pub get
    ```
4.  **Run the app:**
    ```bash
    flutter run
    ```

---

## 🎨 UI & Design
The app uses a sophisticated color palette featuring deep blues (`#29384D`) and warm accents (`#FFF1D4`), ensuring a premium feel and great readability.

---

**Developed with ❤️ by [Mohamed Shaban](https://github.com/77MohamedShaban)
