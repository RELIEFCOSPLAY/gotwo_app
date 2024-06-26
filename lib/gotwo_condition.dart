import 'package:flutter/material.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';

class GotwoCondition extends StatefulWidget {
  const GotwoCondition({super.key});

  @override
  State<GotwoCondition> createState() => _GotwoConditionState();
}

class _GotwoConditionState extends State<GotwoCondition> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Colors.white,
          Colors.white,
        ],
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: const Color(0xffffffff),
          title: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: _backButton(),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        "Term and Condition",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 26,
                            color: Color(0xff1a1c43),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: _page(),
      ),
    );
  }

  Widget _page() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _condition(),
              const SizedBox(height: 20),
              _checkbox(),
              const SizedBox(height: 20),
              _confirmBtn(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _backButton() {
    return GestureDetector(
      onTap: () {
        debugPrint("back");
      },
      child: const Icon(
        Icons.arrow_back_ios,
        size: 30,
        color: Color(0xff1a1c43),
      ),
    );
  }

  Widget _condition() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Text(loremIpsum(words: 100, paragraphs: 5, initWithLorem: true)),
          // Text test
        ],
      ),
    );
  }

  Widget _checkbox() {
    return CheckboxListTile(
      title: const Text(
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 10,
            color: Color(0xff1a1c43),
          ),
          "I accept and agree to the Terms of Use."),
      checkColor: Colors.white,
      activeColor: const Color(0xff1a1c43),
      value: isChecked,
      controlAffinity: ListTileControlAffinity.leading,
      onChanged: (bool? value) {
        setState(
          () {
            isChecked = value!;
          },
        );
      },
    );
  }

  Widget _confirmBtn() {
    return ElevatedButton(
      onPressed: () {
        debugPrint("checkbox $isChecked");
      },
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(120, 24),
        foregroundColor: Colors.blue,
        backgroundColor: const Color(0xff1a1c43),
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(vertical: 2),
      ),
      child: const SizedBox(
          width: double.infinity,
          child: Text(
            "Confirm",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.white),
          )),
    );
  }
}
