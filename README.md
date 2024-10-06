# Comment Vault

## Overview

This is a Flutter application built to showcase user authentication, remote configuration, and data fetching using Firebase services. The app integrates Firebase Authentication, Firebase Remote Config, and Firestore, along with an API call to fetch and display comments from [JSONPlaceholder](https://jsonplaceholder.typicode.com/comments). It demonstrates handling of authentication, storing user details in Firestore, and dynamically modifying the display of sensitive information based on Firebase Remote Config.

---

## Features

- **Firebase Authentication (Email only)**: 
  Users can register and log in using their email. No third-party authentication is involved.
  
- **Firestore Integration**:
  After registration, the user's name and email are stored in a Firestore collection.

- **Fetch Comments**:
  The app fetches a list of comments from the [JSONPlaceholder API](https://jsonplaceholder.typicode.com/comments) and displays them in a feed.

- **Email Display with Firebase Remote Config**:
  - The email associated with each comment has the option to be masked based on a boolean value fetched from Firebase Remote Config.
  - If the boolean value is `true`, only the first three characters of the email will be shown, and the remaining will be masked. For example, `johndoe@test.com` 
    will be displayed as `joh****@test.com`.
  - If the boolean value is `false`, the full email will be displayed.

---

## Firebase Services Used

- **Firebase Authentication**: For user authentication using email.
- **Firebase Firestore**: To store user details such as name and email.
- **Firebase Remote Config**: To dynamically control the display of emails in the comments feed.

---

## App Structure

1. **Authentication Flow**:
   - Register or log in using an email.
   - User details (name and email) are collected and stored in Firestore.

2. **Comments Feed**:
   - Comments are fetched from the [JSONPlaceholder API](https://jsonplaceholder.typicode.com/comments) and displayed in a list.
   - Each comment includes an email field, which is either fully displayed or partially masked based on the Firebase Remote Config boolean.

3. **Email Masking Logic**:
   - When the remote config boolean is `true`, emails in the comments are masked to show only the first three characters.
   - If `false`, emails are shown in full.

---

## How to Run the Project

1. Clone this repository.
2. Run `flutter pub get` to fetch the necessary packages.
3. Start the app using `flutter run`.

---

## Libraries Used

- **firebase_auth**: For handling Firebase authentication.
- **cloud_firestore**: For storing user data in Firestore.
- **firebase_remote_config**: For fetching the boolean flag to decide email masking.
- **http**: To make API requests and fetch comments.
- **BLOC**: For state management.
- **flutter_masked_text**: For email masking logic.

---

## Screenshots
![login](https://github.com/user-attachments/assets/f7451333-7c99-41b3-87fb-1f2af52b5872)
![signup](https://github.com/user-attachments/assets/ef4c6d4d-a317-499c-ad76-62fbec2ca15d)
![comment_list_without_masked_mail](https://github.com/user-attachments/assets/0811b6e0-5a77-4103-a186-a26aaf077060)
![comment_list_with_masked_mail](https://github.com/user-attachments/assets/1abe7dec-c230-437a-b042-da11132b1434)

---



