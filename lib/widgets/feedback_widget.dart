import 'package:flutter/material.dart';
import 'package:jct/language/helpers/app_localization_context_extenstion.dart';
import 'package:jct/models/feedback_state.dart';
import 'package:jct/screens/feedback/feedback_providers/feedback_provider.dart';
import 'package:jct/theme/app_theme/app_theme.dart';

class FeedbackWidget extends StatelessWidget {
  const FeedbackWidget({
    super.key,
    required this.feedbackController,
    required this.feedbackNotifier,
    required this.feedbackState,
  });

  final TextEditingController feedbackController;
  final FeedBackNotifier feedbackNotifier;
  final FeedbackState feedbackState;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0, right: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "assets/images/feedback.png",
              height: 280,
            ),
            TextFormField(
              controller: feedbackController,
              onChanged: (value) {
                feedbackNotifier.setFeedback(feedback: value);
              },
              maxLines: 7,
              autofocus: true,
              onTapOutside: (event) {
                FocusScope.of(context).unfocus();
              },
              style: TextStyle(
                  color: context.theme.appColors.background,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                filled: true,
                fillColor: context.theme.appColors.onPrimary,
                hintText: context.localizedString.feedback_hint_text,
                hintStyle: TextStyle(
                    fontSize: 19, color: context.theme.appColors.surface),
                errorText: feedbackState.feedback.isEmpty
                    ? context.localizedString.feedback_error
                    : null,
                errorStyle: TextStyle(
                  fontSize: 16,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            feedbackState.isSubmitting
                ? const CircularProgressIndicator()
                : SizedBox(
                    width: 250,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        // Call submit feedback with the current text in the controller
                        feedbackNotifier.setFeedback(
                            feedback: feedbackController.text);
                        feedbackNotifier.submitFeedback();
                        // feedbackController.clear();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: context.theme.appColors.onBackground,
                          foregroundColor: context.theme.appColors.background),
                      child: RichText(
                        text: TextSpan(
                            text: context.localizedString.feedback_button,
                            style: TextStyle(
                                color: context.theme.appColors.background,
                                fontWeight: FontWeight.bold,
                                fontSize: 20)),
                      ),
                    ),
                  ),
            if (feedbackState.hasSubmitted) ...[
              const SizedBox(height: 16),
              Text(context.localizedString.feedback_greet_to_user,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.green[900]))
            ],
          ],
        ),
      ),
    );
  }
}
