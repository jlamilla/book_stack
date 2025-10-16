<!-- 🌄 Header -->
<p align="center">
  <img src="https://capsule-render.vercel.app/api?type=waving&color=0:FF6B6B,100:E63946&height=160&section=header&text=📖%20Book%20Stack%20App&fontColor=FFFFFF&fontSize=36&fontAlignY=35&animation=fadeIn" alt="Book Stack App banner" />
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-02569B?logo=flutter&logoColor=white&style=flat-square" alt="Flutter" />
  <img src="https://img.shields.io/badge/Version-1.0.0+1-E63946?style=flat-square" alt="version" />
  <img src="https://img.shields.io/badge/State-Riverpood 3.0-v3?style=flat-square" alt="state" />
  <img src="https://img.shields.io/badge/Architecture-Clean%20%7C%20Atomic-6C63FF?style=flat-square" alt="architecture" />
</p>

<p align="center">
  Flutter application to explore and search for books, with support for light and dark modes.<br>
  Built using <strong>Clean Architecture</strong> and <strong>Atomic Design</strong> principles.
</p>

---

## 🌗 Preview

| Light Mode Home | Light Mode Book Detail | Light Mode Search |
|-----------------|-----------------------|-------------------|
| ![Light Home](assets/screenshots/light_home.jpg) | ![Light Detail](assets/screenshots/light_detail.jpg) | ![Light Search](assets/screenshots/light_search.jpg) |

| Dark Mode Home | Dark Mode Book Detail | Dark Mode Search |
|----------------|----------------------|------------------|
| ![Dark Home](assets/screenshots/dark_home.jpg) | ![Dark Detail](assets/screenshots/dark_detail.jpg) | ![Dark Search](assets/screenshots/dark_search.jpg) |

---

## 📘 Description

**Book Stack** is a mobile application built with **Flutter** that allows users to search, explore, and view detailed book information using the [IT Book Store public API](https://api.itbook.store/#api-search).  

Users can mark favorites, explore new releases, and enjoy a smooth interface with **light/dark themes** powered by the [`book_stack_design_system`](https://github.com/jlamilla/book_stack_design_system) package.

---

## 🌐 API Used

The app consumes the [IT Book Store REST API](https://api.itbook.store/#api-search), which provides:

- 🔍 Search books — `https://api.itbook.store/1.0/search/{query}/{page}`
- 🆕 New releases — `https://api.itbook.store/1.0/new`
- 📖 Book details — `https://api.itbook.store/1.0/books/{isbn13}`

---

## 🧩 Project Structure

```

lib/
├── config/           # Configuration, services, and routes
├── domain/           # Entities, repositories, and use cases (Clean Architecture)
├── infraestructure/  # Implementations, models, and data sources
├── presentation/     # Screens, providers, and widgets
└── assets/           # Images, icons, and static resources

````

✅ **Clean Architecture:** Clear separation between domain, data, and presentation layers  
🎨 **Atomic Design:** Reusable and scalable UI via `book_stack_design_system`  
🧠 **Best Practices:** Riverpod for state management, centralized errors, and linting  

---

## ⚙️ Installation & Setup

### Prerequisites
- Flutter **3.35.2**
- Dart **3.9.0**
- Android SDK **>= 36.0.0**
- [Android Studio](https://developer.android.com/studio) or [VS Code](https://code.visualstudio.com/)
- Local dependency: [`book_stack_design_system`](https://github.com/jlamilla/book_stack_design_system)

### Steps

```bash
# 1️⃣ Clone repository
git clone https://github.com/your_user/book_stack.git
cd book_stack

# 2️⃣ Install dependencies
flutter pub get

# 3️⃣ Link local design system
# Make sure path is correct in pubspec.yaml:
book_stack_design_system:
  path: ../book_stack_design_system

# 4️⃣ Check environment
flutter doctor -v

# 5️⃣ Run the app
flutter run
````

💡 **Troubleshooting**

* `Some Android licenses not accepted`:
  → Run `flutter doctor --android-licenses`
* Design system errors:
  → Check relative path and dependency versions.

---

## 🧭 Best Practices & Clean Code

* Consistent naming and folder conventions
* Reactive state management with **Riverpod**
* Centralized **Failure/Exception** handling
* Fully **componentized UI** with Atomic Design
* Static analysis and **strict linting** enabled

---

## 🔗 Resources

* [Flutter Documentation](https://docs.flutter.dev/)
* [IT Book Store API](https://api.itbook.store/)
* [book_stack_design_system](https://github.com/jlamilla/book_stack_design_system)

---

## 🧑‍💻 Author

**José David Lamilla Acevedo**
Software Engineer | Flutter Semi-Senior
[🌐 GitHub Profile](https://github.com/jlamilla) • [📄 CV (PDF)](https://github.com/jlamilla/jlamilla/blob/main/assets/cv_jose_david_lamilla.pdf)

---

<p align="center">
  <img src="https://capsule-render.vercel.app/api?type=waving&color=0:E63946,100:FF6B6B&height=120&section=footer" />
</p>
```
