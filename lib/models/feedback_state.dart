class FeedbackState {
  final String feedback;
  final bool isSubmitting;
  final bool hasSubmitted;
  FeedbackState({
    this.feedback = "",
    this.isSubmitting = false,
    this.hasSubmitted = false,
  });

  FeedbackState copyWith({
    String,
    feedback,
    bool? isSubmitting,
    bool? hasSubmitted,
  }) {
    return FeedbackState(
      feedback: feedback ?? this.feedback,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      hasSubmitted: hasSubmitted ?? this.hasSubmitted,
    );
  }
}
