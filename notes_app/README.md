# Notes App

A Flutter application for creating, editing, and managing notes with Firebase Firestore integration.

## Features

- **Create Notes**: Add new notes with title and content
- **Edit Notes**: Modify existing notes
- **Delete Notes**: Remove notes with confirmation dialog
- **Real-time Sync**: All notes are stored in Firebase Firestore and sync in real-time
- **Modern UI**: Clean and intuitive Material Design interface

## Firebase Configuration

This app is configured with Firebase project:
- **Project ID**: notesapp-693db
- **App ID**: 1:40398803417:android:6994048274a901cdd609c8
- **Package Name**: com.example.notes_app

## Setup Instructions

1. **Prerequisites**:
   - Flutter SDK installed
   - Firebase project created
   - Firestore Database enabled in test mode

2. **Installation**:
   ```bash
   flutter pub get
   ```

3. **Run the app**:
   ```bash
   flutter run -d windows    # For Windows
   flutter run -d chrome     # For Web
   flutter run               # For mobile (if connected)
   ```

## Project Structure

```
lib/
├── models/
│   └── note_model.dart          # Note data model
├── screens/
│   ├── home_screen.dart         # Main screen showing notes list
│   └── note_edit_screen.dart    # Screen for creating/editing notes
├── services/
│   └── firebase_service.dart    # Firebase Firestore operations
└── main.dart                    # App entry point
```

## Dependencies

- `firebase_core`: Firebase SDK core
- `cloud_firestore`: Firestore database
- `firebase_auth`: Authentication (for future use)
- `provider`: State management
- `intl`: Date formatting
- `uuid`: Unique ID generation
- `flutter_slidable`: Swipe actions (for future use)

## Usage

1. **Creating a Note**: Tap the '+' button to create a new note
2. **Editing a Note**: Tap on any note in the list to edit it
3. **Deleting a Note**: Tap the delete icon on a note or use the delete button in edit mode
4. **Auto-save**: Notes are automatically saved when you tap the Save button

## Firebase Security Rules

Make sure your Firestore security rules allow read/write access:

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /{document=**} {
      allow read, write: if true;
    }
  }
}
```

## Troubleshooting

- Ensure Firebase configuration is correct in `lib/main.dart`
- Check that Firestore is enabled in your Firebase console
- Verify internet connection for Firebase operations
