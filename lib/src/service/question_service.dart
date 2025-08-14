import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quiz_app/src/model/question_model.dart';


class QuestionService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _collection = "questions";

  /// Fetch all questions
  Future<List<QuestionModel>> getAllQuestions() async {
    try {
      final snapshot = await _firestore.collection(_collection).get();
       print("Questions fetched: ${snapshot.docs.length}");  
      return snapshot.docs
          .map((doc) => _fromFirestore(doc))
          .toList();

       
    } catch (e) {
      print("Error fetching questions: $e");
      rethrow;
    }
  }

  /// Fetch questions filtered by category
  Future<List<QuestionModel>> getQuestionsByCategory(String category) async {
    try {
      final snapshot = await _firestore
          .collection(_collection)
          .where('category', isEqualTo: category)
          .get();

      return snapshot.docs
          .map((doc) => _fromFirestore(doc))
          .toList();
    } catch (e) {
      print("Error fetching category questions: $e");
      rethrow;
    }
  }

  /// Internal helper to map Firestore doc → QuestionModel
  QuestionModel _fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return QuestionModel(
      id: doc.id,
      questionText: data['questionText'] ?? '',
      options: List<String>.from(data['options'] ?? []),
      correctAnswerIndex: data['correctAnswerIndex'] ?? 0,
      difficulty: Difficulty.values.firstWhere(
        (d) => d.name == (data['difficulty'] ?? 'easy'),
        orElse: () => Difficulty.easy,
      ),
      category: data['category'] ?? '',
      createdBy: data['createdBy'] ?? '',
    );
  }
}
