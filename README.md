# 🎓 AI Integrated EdTech App (Flutter)

A modern **AI-powered EdTech mobile application** built using Flutter that enables students to learn through structured courses, manage their learning, and get instant help using AI.

***

## 📱 Overview

This application provides a complete learning platform where users can:

- Explore and enroll in courses  
- Manage their personal learning library  
- Get AI-based assistance for doubts  
- Receive real-time notifications  
- Access content in multiple languages  

***

## 🚀 Features

- 🎥 Video-based course learning  
- 📚 Course library management  
- 🔐 Firebase Authentication (Email & Google Sign-In)  
- 💳 Razorpay payment integration (for paid courses)  
- 🤖 AI assistant (Math, Programming, Aptitude)  
- 🔔 Real-time notifications using Firebase Cloud Messaging  
- 🌍 Multi-language support  
- 📊 Purchase history tracking  
- 🕘 Recently viewed courses  

***

## 🧠 How It Works

1. User logs in using Firebase Authentication  
2. Courses are fetched from backend (Node.js + MongoDB)  
3. User can:
   - Access free courses  
   - Purchase paid courses via Razorpay  
4. Purchased courses are added to user's library  
5. Notifications are sent using Firebase Cloud Messaging  
6. AI assistant helps users with queries  

***

## 🏗 Tech Stack

- **Frontend:** Flutter (Material 3)  
- **State Management:** Provider  
- **Backend:** Node.js (Private)  
- **Database:** MongoDB  
- **Authentication:** Firebase Auth  
- **Storage:** Firebase Storage  
- **Notifications:** Firebase Messaging (FCM)  
- **Payments:** Razorpay  
- **Video Player:** Chewie + video_player  
- **Localization:** Flutter Intl  

***

## ⚠️ Public Repository Notice

This is a **public-safe version** of the project.

The following are removed for security reasons:

- ❌ Firebase production keys  
- ❌ Backend API URLs  
- ❌ Razorpay live keys  
- ❌ MongoDB connection details  
- ❌ FCM server configuration  

You need to configure your own backend and services to run the full application.

***

## 🛠 Setup Instructions

```bash
git clone https://github.com/yourusername/sirius.git
cd sirius
flutter pub get
flutter run
```

***


## 🚀 Future Improvements

- 📊 Learning analytics dashboard  
- 🧠 Personalized recommendations  
- 🌐 Web support  
- 🔥 Full AI integration (production mode)  

