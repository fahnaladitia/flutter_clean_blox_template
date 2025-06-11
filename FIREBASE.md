# Firebase Setup

Follow these steps to configure Firebase for your Flutter project with staging and production flavors.
## 1. Create Firebase Projects
Create two Firebase projects: one for staging and one for production. You can do this in the [Firebase Console](https://console.firebase.google.com/).
## 2. Add Firebase Apps
For each Firebase project, add an Android and iOS app:
- **Android**: Use the package name `com.example.staging` for staging and `com.example.production` for production.
- **iOS**: Use the bundle identifier `com.example.staging` for staging and `com.example.production` for production.
## 3. Download Configuration Files
Download the `google-services.json` for Android and `GoogleService-Info.plist` for iOS from each Firebase project.
## 4. Place Configuration Files
- Place `google-services.json` in `android/app/src/staging/` for staging and `android/app/src/production/` for production.
- Place `GoogleService-Info.plist` in `ios/config/` for both staging and production.
- For iOS, ensure you have the correct bundle identifiers set in your Xcode project settings.
- For Android, ensure you have the correct package names set in your `build.gradle` files.
- 