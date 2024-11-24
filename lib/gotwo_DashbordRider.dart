import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gotwo_app/Page_n/gotwo_profileRider.dart';
import 'package:gotwo_app/global_ip.dart';
import 'package:gotwo_app/gotwo_PostPage.dart';
import 'package:gotwo_app/gotwo_SatusRider.dart';
import 'package:http/http.dart' as http;

class GotwoDashbordrider extends StatefulWidget {
  const GotwoDashbordrider({super.key});

  @override
  State<GotwoDashbordrider> createState() => _GotwoDashbordriderState();
}

class _GotwoDashbordriderState extends State<GotwoDashbordrider> {
  final storage = const FlutterSecureStorage();

  String? userId;
  String? imgUrl;
  String? emails;

  Future<void> loadLoginInfo() async {
    String? savedEmail = await storage.read(key: 'email');
    setState(() {
      emails = savedEmail;
    });
    if (emails != null) {
      fetchUserId(emails!); // เรียกใช้ API เพื่อตรวจสอบ user id
    }
  }

  Future<void> fetchUserId(String email) async {
    final String url =
        'http://${Global.ip_8080}/gotwo/getUserId_rider.php'; // URL API
    try {
      final response = await http.post(Uri.parse(url), body: {
        'email': email, // ส่ง email เพื่อค้นหา user id
      });

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['success']) {
          setState(() {
            userId = data['user_id']; // เก็บ user id ที่ได้มา
            imgUrl = data['imgUrl'];
          });
        } else {
          print('Error: ${data['message']}');
        }
      } else {
        print("Failed to fetch user id");
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    loadLoginInfo(); // ดึงข้อมูลเมื่อหน้าเริ่มต้น
  }

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
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: _page(),
      ),
    );
  }

  Widget _page() {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [_inforAvaterBox()],
            ),
            _dashbordBox(),
          ],
        ),
      ),
    );
  }

  Widget _inforAvaterBox() {
    return GestureDetector(
      onTap: () {
        debugPrint("CircleAvatar");
      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            CircleAvatar(
              minRadius: 25,
              maxRadius: 40,
              backgroundColor: Colors.white,
              child: imgUrl != null
                  ? ClipOval(
                      // ใช้ ClipOval เพื่อครอบภาพให้เป็นวงกลม
                      child: Image.network(
                        imgUrl!,
                        fit: BoxFit.cover, // ปรับให้รูปภาพเติมเต็มพื้นที่
                        width: 80, // กำหนดขนาดความกว้าง
                        height: 80, // กำหนดขนาดความสูง
                      ),
                    )
                  : const Icon(Icons.person),
            ),
            const SizedBox(height: 10),
            Text(
              '$emails',
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              " Enjoy the journey ",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _dashbordBox() {
    return Container(
      width: double.infinity,
      height: 440,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50.0), topRight: Radius.circular(50.0)),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 8, left: 40),
                child: Text(
                  "Dashboard",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xff1a1c43),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  debugPrint("1");
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GotwoSatusrider(),
                    ),
                    (Route<dynamic> route) => false,
                  );
                },
                child: Container(
                  width: 300,
                  height: 80,
                  decoration: BoxDecoration(
                    color: const Color(0xffF55168),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "4",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Request",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  debugPrint("2");
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GotwoSatusrider(),
                    ),
                    (Route<dynamic> route) => false,
                  );
                },
                child: Container(
                  width: 300,
                  height: 80,
                  decoration: BoxDecoration(
                    color: const Color(0xff17C8B1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "2",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Confirm",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  debugPrint("3");
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GotwoPostPage(),
                    ),
                    (Route<dynamic> route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff00D6D5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  fixedSize: const Size(300, 80),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "8",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Post    ",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: const Color(0xff1a1c43),
                  backgroundColor: Colors.white,
                  shadowColor: Colors.transparent,
                ),
                onPressed: () {
                  debugPrint("Dashboard");
                },
                child: const Column(
                  children: [
                    Icon(
                      Icons.home,
                      size: 50.0,
                    ),
                    Text("Dashboard")
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: const Color(0xff1a1c43),
                  backgroundColor: Colors.white,
                  shadowColor: Colors.transparent,
                ),
                onPressed: () {
                  debugPrint("Status");
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const GotwoSatusrider(),
                    ),
                    (Route<dynamic> route) => false,
                  );
                },
                child: const Column(
                  children: [
                    Icon(
                      Icons.grading,
                      size: 50.0,
                    ),
                    Text("Status")
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: const Color(0xff1a1c43),
                  backgroundColor: Colors.white,
                  shadowColor: Colors.transparent,
                ),
                onPressed: () {
                  debugPrint("Profile");
                  // Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => const GotwoProfileRider()),
                  // );
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const GotwoProfileRider()),
                  );
                },
                child: const Column(
                  children: [
                    Icon(
                      Icons.account_circle,
                      size: 50.0,
                    ),
                    Text("Profile")
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
