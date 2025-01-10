import 'package:flutter/material.dart';

class SpeechTranslationScreen extends StatelessWidget {
  const SpeechTranslationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Page'),
      ),
      body: const Center(
        child: Text('Chat Page Screen'),
      ),
    );
  }
}
