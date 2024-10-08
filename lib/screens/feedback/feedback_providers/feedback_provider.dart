import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jct/models/feedback_state.dart';
import "package:riverpod_annotation/riverpod_annotation.dart";
import 'package:riverpod/riverpod.dart';

part 'feedback_provider.g.dart';

@riverpod
class FeedBackNotifier extends _$FeedBackNotifier {
  @override
  FeedbackState build() {
    return FeedbackState();
  }

  // set feedback
  void setFeedback({required String feedback}) {
    state = state.copyWith(feedback: feedback);
  }

  Future<void> submitFeedback() async {
    if (state.feedback.isEmpty) return;
    state = state.copyWith(isSubmitting: true);
    // await Future.delayed(Duration(seconds: 2));
    // state.copyWith(isSubmitting: false,hasSubmitted: true);
    try {
      // Simulate a network request or feedback submission
      await Future.delayed(const Duration(seconds: 2));

      // You can also include your actual submission logic here (e.g., API call)
      await FirebaseFirestore.instance.collection("feedback").add({
        "feedback": state.feedback,
        "timestamp": FieldValue.serverTimestamp()
      });
      // Update the state to indicate submission is done
      state =
          state.copyWith(isSubmitting: false, hasSubmitted: true, feedback: '');

      // Reset feedback after submission (optional)
      // state = state.copyWith(feedback: "");
    } catch (error) {
      // Handle error here (optional)
      state = state.copyWith(isSubmitting: false);
      print("Error during submit: ${error}");
      // You might want to show an error message in your UI
    }
  }
}
