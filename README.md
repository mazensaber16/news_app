<div align="center">

# 📰 News App  
### A modern Flutter application for browsing the latest news with smooth UI, offline mode, and clean architecture.

![Flutter](https://img.shields.io/badge/Flutter-3.0+-blue?logo=flutter)
![Architecture](https://img.shields.io/badge/Clean%20Architecture-%F0%9F%94%8A-brightgreen)
![Cubit](https://img.shields.io/badge/State%20Management-Cubit-red)
![Hive](https://img.shields.io/badge/Local%20Storage-Hive-yellow)
![License](https://img.shields.io/badge/License-MIT-purple)

</div>

---

## 🌟 **Overview**

The **News App** is a fast, simple, and beautifully designed Flutter application  
that allows users to browse the latest news articles from multiple categories.

This project uses:

- 🧱 **Clean Architecture**  
- 🧠 **Cubit (Flutter Bloc)**  
- 📦 **Hive for local caching**  
- 📡 **HTTP for API requests**  
- 🧩 **GetIt + Injectable** for Dependency Injection  
- 📶 **Connectivity check** (online/offline mode)

The goal is to deliver a smooth news-reading experience with optimized performance and clean, scalable code.

---

## ✨ **Features**

### 📰 News & Categories  
- View top headlines  
- Browse news by categories  
- Search functionality  
- Pull-to-refresh  

### ⚡ Performance & Storage  
- Local caching using **Hive**  
- Fast image loading using `cached_network_image`  
- Detect offline mode with `connectivity_plus`  

### 🎨 UI & Experience  
- Custom fonts (Google Fonts)  
- Smooth UI with responsive design  
- Toggle for theme switching (Light/Dark mode)  

### 🔧 Architecture & Logic  
- Clean Architecture: (Data → Domain → Presentation)  
- Dependency Injection using GetIt + Injectable  
- State Management: **Cubit**  
- Separation of concerns & testable structure  

---

## 🛠️ **Tech Stack**

| Category | Packages |
|---------|----------|
| 🎯 **Core** | flutter_bloc (Cubit), http, dartz |
| 🎨 **UI/UX** | google_fonts, cached_network_image, toggle_switch |
| 💾 **Storage** | hive, hive_generator, path_provider |
| 🔧 **Utilities** | connectivity_plus, injectable, get_it |
| 🛠️ **Build Tools** | build_runner |

---

## 📁 ***Clean Architecture**

