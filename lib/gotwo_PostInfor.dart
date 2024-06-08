import 'package:flutter/material.dart';

class GotwoPostinfor extends StatefulWidget {
  const GotwoPostinfor({super.key});

  @override
  State<GotwoPostinfor> createState() => _GotwoPostinforState();
}

class _GotwoPostinforState extends State<GotwoPostinfor> {
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController commentController1 = TextEditingController();
  TextEditingController commentController2 = TextEditingController();
  static const List<String> list = <String>[
    'Select Location',
    'Mae Fah Luang(D1)',
    'Lotus Fah Thai',
  ];
  String dropdownPickup = list.first;
  String dropdownDrop = list.first;

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xff1a1c43),
            Color(0xff1a1c43),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: _page(),
      ),
    );
  }

  Widget _page() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 20,
                ),
                _backButton(),
                const SizedBox(
                  width: 70,
                ),
                _aText(),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            _inputBox(),
          ],
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
        color: Colors.white,
      ),
    );
  }

  Widget _aText() {
    return const Text(
      "Book Ride",
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
    );
  }

  Widget _inputBox() {
    return Container(
      width: double.infinity,
      height: 565,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50.0), topRight: Radius.circular(50.0)),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          _bText(),
          const SizedBox(
            height: 10,
          ),
          _locationBox(),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "date",
                        style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff1a1c43),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    _inputField("00/00/0000", dateController),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "time",
                        style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff1a1c43),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    _inputField("00:00", timeController),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          _priceField("Set Price", priceController),
          const SizedBox(
            height: 5,
          ),
          _checkbox(),
          const SizedBox(
            height: 5,
          ),
          _postBtn(),
        ],
      ),
    );
  }

  Widget _bText() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 8, left: 40),
          child: Text(
            "Book Your Ride",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 24,
              color: Color(0xff1a1c43),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _locationBox() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 300,
          height: 220,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xff1a1c43))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 40),
                child: Text(
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Color(0xff1a1c43),
                    ),
                    "Pickup"),
              ),
              _dropdownPickup(),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: _inputField2("Comment Pickup", commentController1),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 40),
                child: Text(
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Color(0xff1a1c43),
                    ),
                    "Drop"),
              ),
              _dropdownDrop(),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: _inputField2("Comment Drop", commentController2),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _inputField2(
    String hintText,
    TextEditingController controller,
  ) {
    return SizedBox(
      height: 20,
      width: 200,
      child: TextField(
        textAlign: TextAlign.start,
        style: const TextStyle(color: Color(0xff1a1c43), fontSize: 12),
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
        ),
      ),
    );
  }

  Widget _inputField(
    String hintText,
    TextEditingController controller,
  ) {
    var border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(color: Color(0xff1a1c43)));

    return SizedBox(
      height: 60,
      width: 140,
      child: TextField(
        textAlign: TextAlign.center,
        style: const TextStyle(color: Color(0xff1a1c43), fontSize: 16),
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Color(0xff1a1c43)),
          enabledBorder: border,
          focusedBorder: border,
        ),
      ),
    );
  }

  Widget _priceField(
    String hintText,
    TextEditingController controller,
  ) {
    var border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(color: Color(0xff1a1c43)));

    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: SizedBox(
        child: TextField(
          style: const TextStyle(
            color: Color(0xff1a1c43),
          ),
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Color(0xff1a1c43)),
            enabledBorder: border,
            focusedBorder: border,
            prefixIcon:
                const Icon(Icons.price_change, color: Color(0xff17C8B1)),
          ),
        ),
      ),
    );
  }

  Widget _checkbox() {
    return Padding(
      padding: const EdgeInsets.only(left: 35),
      child: CheckboxListTile(
        title: const Text(
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Color(0xff1a1c43),
            ),
            "Bring your own a helmet"),
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
      ),
    );
  }

  Widget _dropdownPickup() {
    var border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(color: Color(0xff1a1c43)));

    return Container(
      padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          enabledBorder: border,
          focusedBorder: border,
          prefixIcon: const Icon(
            Icons.my_location,
            color: Color(0xff30E483),
          ),
        ),
        value: dropdownPickup,
        elevation: 16,
        style: const TextStyle(
          color: Color(0xff1a1c43),
          fontWeight: FontWeight.bold,
        ),
        borderRadius: BorderRadius.circular(18),
        onChanged: (String? value) {
          // This is called when the user selects an item.
          setState(() {
            dropdownPickup = value!;
          });
        },
        items: list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }

  Widget _dropdownDrop() {
    var border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(color: Color(0xff1a1c43)));
    return Container(
      padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          enabledBorder: border,
          focusedBorder: border,
          prefixIcon: const Icon(Icons.location_on, color: Color(0xffE51A1A)),
        ),
        value: dropdownDrop,
        elevation: 16,
        style: const TextStyle(
          color: Color(0xff1a1c43),
          fontWeight: FontWeight.bold,
        ),
        borderRadius: BorderRadius.circular(18),
        onChanged: (String? value) {
          // This is called when the user selects an item.
          setState(() {
            dropdownDrop = value!;
          });
        },
        items: list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }

  Widget _postBtn() {
    return ElevatedButton(
      onPressed: () {
        debugPrint("Pickup : $dropdownPickup");
        debugPrint("commentPickup : ${commentController1.text}");
        debugPrint("Drop : $dropdownDrop");
        debugPrint("commentDrop : ${commentController2.text}");
        debugPrint("Date : ${dateController.text}");
        debugPrint("Time : ${timeController.text}");
        debugPrint("Price : ${priceController.text}");
        debugPrint("Checkbox : $isChecked");
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
            "Post",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.white),
          )),
    );
  }
}
