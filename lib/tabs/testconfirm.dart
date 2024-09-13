import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class TabRequest extends StatefulWidget {
  @override
  State<TabRequest> createState() => _TabRequestState();
}

class _TabRequestState extends State<TabRequest> {
  List<dynamic> listData = [];

  List<dynamic> filteredList = [];

  // ฟังก์ชันดึงข้อมูลจาก API
  Future<void> fetchData() async {
    final String url =
        "http://192.168.160.1:80/gotwo/status.php"; // URL ของ API
    try {
      final response = await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json;charset=utf-8',
      });

      if (response.statusCode == 200) {
        setState(() {
          listData = json.decode(response.body); // แปลง JSON เป็น List
          filteredList =
              listData; // เริ่มต้นให้ filteredList มีค่าเท่ากับ listData ทั้งหมด
        });
      } else {
        print("Failed to load data");
      }
    } catch (e) {
      print("Error be Fix: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData(); // ดึงข้อมูลเมื่อเริ่มแอป
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        tab_Confirm(),
      ],
    );
  }

  Widget tab_Confirm() {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: SizedBox(
        width: 320,
        height: 500,
        child: ListView.builder(
          itemCount: testDate.length,
          itemBuilder: (context, index) {
            if (testDate[index]['status'] == "Paid") {
              return Padding(
                padding:
                    const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 8),
                child: SizedBox(
                  width: 300,
                  height: 100,
                  child: ElevatedButton(
                    onPressed: () {
                      debugPrint("CardConfirm");
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            const WidgetStatePropertyAll(Color(0xfffbf8ff)),
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: const BorderSide(
                                    color: Color(0xff1a1c43))))),
                    child: SizedBox(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on,
                                    color: Color(0xff1a1c43),
                                    size: 20.0,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    "From: ${testDate[index]['from']}",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontSize: 12, color: Color(0xff1a1c43)),
                                  ),
                                ],
                              ),
                              Text(
                                "Date: ${testDate[index]['date']} ",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 12, color: Color(0xff1a1c43)),
                              ),
                              Text(
                                "Time: ${testDate[index]['time']}",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 12, color: Color(0xff1a1c43)),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Icon(Icons.arrow_forward,
                              color: Color(0xff1a1c43)),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.tour,
                                    color: Color(0xff1a1c43),
                                    size: 20.0,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    "To: ${testDate[index]['to']}",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontSize: 12, color: Color(0xff1a1c43)),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: Row(
                                  children: [
                                    Text(
                                      "${testDate[index]['price']} ",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 15,
                                          color: Color(0xff1a1c43)),
                                    ),
                                    Text(
                                      "${testDate[index]['status']}",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 10,
                                          color: Color(0xff1a1c43)),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  "${testDate[index]['status']}",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 10, color: Color(0xff06D258)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }
            if (testDate[index]['status'] == "Unpaid") {
              return Padding(
                padding:
                    const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 8),
                child: SizedBox(
                  width: 300,
                  height: 100,
                  child: ElevatedButton(
                    onPressed: () {
                      debugPrint("CardConfirm2");
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            const WidgetStatePropertyAll(Color(0xfffbf8ff)),
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: const BorderSide(
                                    color: Color(0xff1a1c43))))),
                    child: SizedBox(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on,
                                    color: Color(0xff1a1c43),
                                    size: 20.0,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    "From: ${testDate[index]['from']}",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontSize: 12, color: Color(0xff1a1c43)),
                                  ),
                                ],
                              ),
                              Text(
                                "Date: ${testDate[index]['date']} ",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 12, color: Color(0xff1a1c43)),
                              ),
                              Text(
                                "Time: ${testDate[index]['time']}",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 12, color: Color(0xff1a1c43)),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Icon(Icons.arrow_forward,
                              color: Color(0xff1a1c43)),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.tour,
                                    color: Color(0xff1a1c43),
                                    size: 20.0,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    "To: ${testDate[index]['to']}",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontSize: 12, color: Color(0xff1a1c43)),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: Row(
                                  children: [
                                    Text(
                                      "${testDate[index]['price']} ",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 15,
                                          color: Color(0xff1a1c43)),
                                    ),
                                    const Text(
                                      "THB",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: Color(0xff1a1c43)),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  "${testDate[index]['status']}",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 10, color: Color(0xffE51A1A)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }
            return null;
          },
        ),
      ),
    );
  }
}
