# Todo List

Welcome to the Todo List App repository! This app is designed to help you manage your Todos efficiently with a beautiful and user-friendly interface.

## Features

- **Stunning UI & Animations:** Enjoy a visually appealing design with smooth animations for a delightful user experience.

- **Secure Authentication:** Firebase authentication ensures the security of your data, with Google Sign-In for easy access.

- **Precise Scheduling:** Plan your Todos with start and end times to stay organized and on top of your commitments.

- **7-Day Planning:** Store and access data for a full week to help you plan ahead effectively.

- **Responsive Design:** The app adapts to screens of all sizes, providing an optimal user experience on any device.
  
## Installation

1. Clone this repository using `git clone https://github.com/flutterdevcodiste/flutter-todo-list.git`
2. Navigate to the project directory: `cd flutter-todo-list`
3. Install dependencies: `flutter pub get`
4. **Add `google-services.json`:** For Firebase setup, each developer needs to add their own `google-services.json` file obtained from their Firebase project. Place this file in the `android/app` directory.

5. **Set Up Firebase Authentication:**
   - Go to the Firebase Console and create a project.
   - Enable the Email/Password sign-in method.
   - Add your Android app to the project and download the `google-services.json` file.
   - Add your iOS app if needed and download the `GoogleService-Info.plist` file.

6. **Set Up Firebase Realtime Database:**
   - In the Firebase Console, create a Realtime Database.
   - Set up security rules as per your requirements.
   - Update the Firebase configuration in your Flutter app code.

7. Run the app: `flutter run`


## Contributions

Contributions are welcome! If you find a bug or want to add new features, feel free to open an issue or submit a pull request.

## License

This project is licensed under the [MIT License](/LICENSE).

---

### Designed and developed with ❤️ Flutter.
