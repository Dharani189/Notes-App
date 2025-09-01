import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notes_app/models/note_model.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _collectionName = 'notes';

  // Create a new note
  Future<void> createNote(Note note) async {
    try {
      await _firestore
          .collection(_collectionName)
          .doc(note.id)
          .set(note.toMap());
    } catch (e) {
      throw Exception('Failed to create note: $e');
    }
  }

  // Get all notes
  Stream<List<Note>> getNotes() {
    return _firestore
        .collection(_collectionName)
        .orderBy('updatedAt', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => Note.fromMap(doc.data()))
          .toList();
    });
  }

  // Update an existing note
  Future<void> updateNote(Note note) async {
    try {
      await _firestore
          .collection(_collectionName)
          .doc(note.id)
          .update(note.toMap());
    } catch (e) {
      throw Exception('Failed to update note: $e');
    }
  }

  // Delete a note
  Future<void> deleteNote(String id) async {
    try {
      await _firestore.collection(_collectionName).doc(id).delete();
    } catch (e) {
      throw Exception('Failed to delete note: $e');
    }
  }

  // Get a single note by ID
  Future<Note?> getNoteById(String id) async {
    try {
      final doc = await _firestore.collection(_collectionName).doc(id).get();
      if (doc.exists && doc.data() != null) {
        return Note.fromMap(doc.data()!);
      }
      return null;
    } catch (e) {
      throw Exception('Failed to get note: $e');
    }
  }
}
