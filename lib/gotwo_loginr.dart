import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gotwo_app/global_ip.dart';
import 'package:gotwo_app/gotwo_DashbordRider.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart'; // Import secure storage

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final formKey = GlobalKey<FormState>();
  final storage = const FlutterSecureStorage();

  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  bool rememberMe = true; // Remember Me option

  // ฟังก์ชันสำหรับบันทึกข้อมูลเข้าสู่ระบบ
  Future<void> saveLoginInfo() async {
    if (rememberMe) {
      await storage.write(key: 'email', value: email.text);
      await storage.write(key: 'password', value: pass.text);
      await storage.write(
          key: 'isLoggedIn', value: 'true'); // บันทึกสถานะการเข้าสู่ระบบ
    } else {
      await storage.deleteAll(); // ลบข้อมูลการเข้าสู่ระบบ
    }
  }

  // ฟังก์ชันสำหรับโหลดข้อมูลเข้าสู่ระบบ
  Future<void> loadLoginInfo() async {
    String? savedEmail = await storage.read(key: 'email');
    String? savedPassword = await storage.read(key: 'password');
    String? isLoggedIn = await storage.read(key: 'isLoggedIn');

    // ถ้ามีข้อมูลบันทึกไว้ และผู้ใช้เคย login ให้ข้ามไปหน้า Join
    if (isLoggedIn == 'true' && savedEmail != null && savedPassword != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const GotwoDashbordrider()),
      );
    }
  }

  // ฟังก์ชันสำหรับเข้าสู่ระบบ
  Future<void> signIn() async {
  String url = "http://${Global.ip_8080}/gotwo/login_rider.php";
  try {
    final response = await http.post(Uri.parse(url), body: {
      'email': email.text,
      'password': pass.text,
    });

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      if (data == "Error") {
        // ไม่พบผู้ใช้
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please enter a correct email or password.')),
        );
      } else {
        await saveLoginInfo(); // บันทึกข้อมูลการเข้าสู่ระบบ
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const GotwoDashbordrider()),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Server error. Please try again later.')),
      );
    }
  } catch (e) {
    // ถ้าพอร์ต 8080 ใช้ไม่ได้ จะลองใช้พอร์ต 80 แทน
    try {
      String fallbackUrl = "http://${Global.ip_80}/gotwo/login_rider.php";
      final fallbackResponse = await http.post(Uri.parse(fallbackUrl), body: {
        'email': email.text,
        'password': pass.text,
      });

      if (fallbackResponse.statusCode == 200) {
        var data = json.decode(fallbackResponse.body);
        if (data == "Error") {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Please enter a correct email or password.')),
          );
        } else {
          await saveLoginInfo();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const GotwoDashbordrider()),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Server error. Please try again later.')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login failed. Please try again.')),
      );
    }
  }
}


  @override
  void initState() {
    super.initState();
    loadLoginInfo(); // ตรวจสอบว่ามีการบันทึกข้อมูลการเข้าสู่ระบบหรือไม่
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // ย้อนกลับไปยังหน้าก่อนหน้านี้
          },
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _icon(),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "LOGIN",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Color(0xFF1A1C43),
                  ),
                ),
                const SizedBox(height: 30),

                // Email textformfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: const Color(0xFF1A1C43), width: 2),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextFormField(
                        controller: email,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Password textformfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: const Color(0xFF1A1C43), width: 2),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextFormField(
                        controller: pass,
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // Checkbox for "Remember Me"
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Checkbox(
                        
                        activeColor:
                            const Color(0xFF1A1C43), // Change the color when checked
                        checkColor: Colors.white,
                        value: rememberMe,
                        onChanged: (value) {
                          setState(() {
                            rememberMe = value ?? false;
                          });
                        },
                      ),
                      const Text("Remember Me")
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Login button
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        await signIn();
                        debugPrint("Login ");
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(
                          const Color(0xFF1A1C43)),
                      minimumSize: WidgetStateProperty.all(const Size(110, 35)),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _icon() {
    return Image.asset('asset/images/pngegg.png');
  }
}
