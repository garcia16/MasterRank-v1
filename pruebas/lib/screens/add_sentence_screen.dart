import 'package:flutter/material.dart';
import '../widgets/add_rules.dart';
import '../widgets/add_sentence.dart';

class AddSentenceScreen extends StatefulWidget {

  @override
  State<AddSentenceScreen> createState() => _AddSentenceScreenState();
}


class _AddSentenceScreenState extends State<AddSentenceScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            AddSentences()
          ],
        ),
      ),
   );
  }
}