import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod/riverpod.dart';
import 'package:jct/models/feedback_state.dart';

// Define the StateNotifierProvider to manage FeedbackNotifier and FeedbackState
final feedBackNotifierProvider =
    StateNotifierProvider<FeedBackNotifier, FeedbackState>(
  (ref) => FeedBackNotifier(),
);

class FeedBackNotifier extends StateNotifier<FeedbackState> {
  FeedBackNotifier() : super(FeedbackState());

  // Set feedback
  void setFeedback({required String feedback}) {
    state = state.copyWith(feedback: feedback);
  }

  Future<void> submitFeedback() async {
    if (state.feedback.isEmpty) return;
    state = state.copyWith(isSubmitting: true);

    try {
      // Simulate a network request or feedback submission
      await Future.delayed(const Duration(seconds: 2));

      // Submit feedback to Firestore
      await FirebaseFirestore.instance.collection("feedback").add({
        "feedback": state.feedback,
        "timestamp": FieldValue.serverTimestamp()
      });

      // Update the state to indicate submission is done
      state =
          state.copyWith(isSubmitting: false, hasSubmitted: true, feedback: '');
    } catch (error) {
      // Handle error here
      state = state.copyWith(isSubmitting: false);
      print("Error during submit: $error");
    }
  }
}
