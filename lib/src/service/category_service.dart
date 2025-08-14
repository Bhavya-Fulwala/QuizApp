import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryService {




Future<List<String>> fetchUniqueCategories() async {
  try{
  final firestore = FirebaseFirestore.instance;
  final snapshot = await firestore.collection('questions').get();
  print("Documents fetched: ${snapshot.docs.length}");

  for (var doc in snapshot.docs) {
 
  }

  final categories = snapshot.docs
      .map((doc) => doc.data()['category'] as String?)
      .where((cat) => cat != null && cat.isNotEmpty)
      .cast<String>()
      .toSet()
      .toList();

  print("Unique categories: $categories");

  return categories;
  }
  catch(e){
    print("Error fetching categories: $e");
    rethrow;
  }
}


}