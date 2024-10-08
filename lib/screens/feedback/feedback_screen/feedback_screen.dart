import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:jct/models/feedback_state.dart';
import 'package:jct/screens/feedback/feedback_providers/feedback_provider.dart';
import 'package:jct/widgets/feedback_widget.dart';

// class FeedbackScreen extends ConsumerWidget {
//   const FeedbackScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {

//     return
//   }
// }

class FeedbackScreen extends ConsumerStatefulWidget {
  const FeedbackScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FeedBackSCreenState();
}

class _FeedBackSCreenState extends ConsumerState<FeedbackScreen> {
  final feedbackController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    feedbackController;
    // Set initial feedback value from provider state, if any
    final feedbackState = ref.read(feedBackNotifierProvider);
    feedbackController.text = feedbackState.feedback;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    feedbackController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final feedbackState = ref.watch(feedBackNotifierProvider);
    final feedbackNotifier = ref.read(feedBackNotifierProvider.notifier);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.indigo[100],
      appBar: AppBar(
        backgroundColor: Colors.indigo[100],
        title: const Text("Feedback"),
      ),
      body: FeedbackWidget(
          feedbackController: feedbackController,
          feedbackNotifier: feedbackNotifier,
          feedbackState: feedbackState),
    );
  }
}
