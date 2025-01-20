# Mobile Application Development  
## CSCI 4311
[![Build Status](https://cdn.prod.website-files.com/5e0f1144930a8bc8aace526c/65dd9eb5aaca434fac4f1c7c_Build-Passing-brightgreen.svg)]()

--- 
### Team Members  
- **NIK MUHAMMAD FARIS FIRDAUS BIN NORAZMAN**  
   🎓 **Matric Number**: `2213935`  
- **MUHAMAD HAZRIN FAHMI BIN ABD HALIM**  
   🎓 **Matric Number**: `2213375`  
- **MUHAMMAD ZIYAD FATHULLAH BIN MOHD YAZID**  
   🎓 **Matric Number**: `2211191`  
---

# Application Overview

## Objective  
This app is designed to empower users with three essential features that boost both networking knowledge and security:

1. **IP Geolocation**: Pinpoint the exact geographical location of any IP address, whether for cybersecurity research or pure curiosity. Get instant access to detailed location information.
2. **Port Scanning**: Scan hosts for open ports, uncover potential security vulnerabilities, or find the active services running on a system. Think of it as a digital detective providing in-depth insights into your network.
   > **Important Note**: Port scanning can only be performed within the same network. Scanning devices outside your local network is not supported by this feature.
3. **Password Generator/Encryption**: Create strong, random passwords and encrypt sensitive data securely. Ensure your accounts and data are well-protected with robust encryption, offering peace of mind.

## Summary  
This application unites three powerful tools into one seamless platform. Trace IP addresses, scan networks for vulnerabilities, and generate/encrypt passwords—all in one place. By blending networking diagnostics and encryption features, this app provides a holistic approach to cybersecurity. Whether you're an IT professional or just someone who values online security, this app is your trusted digital safeguard.

---

## Dependencies Used

To get started with the app, simply add the following dependencies to your `pubspec.yaml` file:

```sh
flutter pub add cupertino_icons
flutter pub add lottie
flutter pub add firebase_core
flutter pub add firebase_auth
flutter pub add flutter_card_swiper
flutter pub add curved_navigation_bar
flutter pub add simple_animated_button
```

| Command | Link |
| ------- | ---- |
| `flutter pub add cupertino_icons` | [cupertino_icons on pub.dev](https://pub.dev/packages/cupertino_icons/install) |
| `flutter pub add lottie` | [lottie on pub.dev](https://pub.dev/packages/lottie/install) |
| `flutter pub add firebase_core` | [firebase_core on pub.dev](https://pub.dev/packages/firebase_core/install) |
| `flutter pub add firebase_auth` | [firebase_auth on pub.dev](https://pub.dev/packages/firebase_auth/install) |
| `flutter pub add flutter_card_swiper` | [flutter_card_swiper on pub.dev](https://pub.dev/packages/flutter_card_swiper/install) |
| `flutter pub add curved_navigation_bar` | [curved_navigation_bar on pub.dev](https://pub.dev/packages/curved_navigation_bar/install) |
| `flutter pub add simple_animated_button` | [simple_animated_button on pub.dev](https://pub.dev/packages/simple_animated_button/install) |


## Video Demonstration

Watch the video below for a detailed demonstration of the app's features:

<video width="320" height="240" controls>
  <source src="Image/video.mp4" type="video/mp4">
  Your browser does not support the video tag.
</video>

# App Features  


### 1. Login and Register Screens  

The app starts with a **Login** page. New users can easily create an account via the **Register** page to access the app's features.

| **Login** | **Register** |  
| --------- | ------------ |  
| <img src="Image\login.png" alt="Login Screen" width="200"/> | <img src="Image\register.png" alt="Register Screen" width="200"/> |  

---

### 2. IP Geolocation Screen  

**Discover IP Details**  
This feature enables users to retrieve detailed information about an IP address. It's a powerful tool for gaining insights into geographical and network-specific data.  

| **IP Geolocation** |  
| ------------------- |  
| <img src="Image\ipgeo.png" alt="IP Geolocation Screen" width="200"/> |  

#### API Used  
We utilize the **IP Geolocation API** from [RapidAPI](https://rapidapi.com/xakageminato/api/ip-geolocation-ipwhois-io) for accurate and real-time information.  

| <img src="Image\Api-ip.png" alt="API Integration for IP Geolocation" width="800"/> |  

**Example Information Provided:**  

- Country, Region, City, Latitude, Longitude, ISP

### 3. Port Scanning  

**Note**: This port scanning feature only works within the same network, whether the network is physical or virtual. It does not support scanning devices outside your local network.

| **Port Scanning ** |  
| ------------------- |  
| <img src="Image\port.png" alt="IP Geolocation Screen" width="200"/> | 

This page allows users to perform a **port scan** on a given IP address. It checks common ports like SSH (22), HTTP (80), HTTPS (443), and more to identify which are open.  

- **Input an IP Address**: Type the IP address you want to scan.  
- **Scan Ports**: Press the button to start scanning.  
- **View Results**: Displays open ports and their corresponding services.  

If no open ports are found, a message will let you know.  


**this was tested on a real server with open ports**

<img src="Image\port scan.png" alt="IP Geolocation Screen" width="2000"/>


### 4. Password Encryption  

**Secure Your Passwords**  
Easily encrypt your passwords using one of two methods:  
- **ROT13**: A simple and reversible cipher   
- **SHA-1**: A cryptographic hash function for stronger, one-way encryption.  

| **Password Encryption** |  
| ------------------------ |  
| <img src="Image\password.png" alt="Password Encryption Screen" width="200"/> |  

This feature is perfect for enhancing password security and ensuring privacy.  

---

