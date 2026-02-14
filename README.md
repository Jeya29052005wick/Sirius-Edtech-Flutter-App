# Sirius 🎓

**Stop Learning. Start Understanding.**

Sirius is a modern Flutter-based learning platform that provides:
- 🎥 Online math courses
- 📚 Course library management
- 🔐 Firebase Authentication
- 🌍 Multi-language support
- 🤖 Sirius AI (Demo Mode in public version)
- 💳 Razorpay payment integration (private backend)

---

## 🚀 Features

### 🔐 Authentication
- Email & Password login
- Google Sign-In
- Password reset
- Firebase Authentication integration

### 📚 Courses
- Browse all courses
- Free & Paid course support
- Razorpay payment integration
- Purchase history
- Recently viewed courses
- Library management

### 🤖 Sirius AI
- Chat-style interface
- Markdown + LaTeX rendering
- Multiple modes (Math, Programming, Aptitude)
- Demo mode in public repository

### 🔔 Notifications
- Firebase Cloud Messaging (FCM)
- User-specific notifications (requires backend)

### 🌍 Localization
- Supports:
    - English
    - Tamil
    - Hindi
    - Telugu
    - Malayalam
    - Gujarati
    - Kannada
    - Spanish
    - French
    - Portuguese

---

## 🏗 Tech Stack

- **Frontend:** Flutter (Material 3)
- **State Management:** Provider
- **Backend:** Node.js (Private – Not Included)
- **Database:** MongoDB (Private)
- **Authentication:** Firebase Auth
- **Storage:** Firebase Storage
- **Notifications:** Firebase Messaging
- **Payments:** Razorpay (Private Keys Removed)
- **Video:** Chewie + Video Player
- **Localization:** Flutter Intl

---

## ⚠️ Important (Public Version Notice)

This repository is a **public-safe version**.

The following have been removed or replaced:

- ❌ Firebase production keys
- ❌ Backend URLs
- ❌ Razorpay live keys
- ❌ FCM production endpoints
- ❌ Private MongoDB APIs
- ❌ SheetDB production endpoint

You must configure your own:

- Firebase project
- Backend API
- Razorpay keys
- FCM server

---

## 🛠 Setup Instructions

### 1️⃣ Clone the Repository

```bash
git clone https://github.com/yourusername/sirius.git
cd sirius
