import 'package:flutter/material.dart';

class GotwoRequest extends StatefulWidget {
  final dynamic item;
  const GotwoRequest({super.key, required this.item});

  @override
  _GotwoRequestState createState() => _GotwoRequestState();
}

class _GotwoRequestState extends State<GotwoRequest> {
  final formKey = GlobalKey<FormState>();

  Future<void> _showDialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Request'),
          content: const Text('Request has been accepted.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showRejectDialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'There is a request to join. Do you still want to delete this post?',
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      )),
                  child:
                      const Text("Yes", style: TextStyle(color: Colors.white)),
                ),
                ElevatedButton(
                  onPressed: () async {
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      )),
                  child: const Text("Cancel",
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final item = widget.item;

    return Scaffold(
      backgroundColor: const Color(0xFF1A1C43),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1C43),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Request', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35.0),
              topRight: Radius.circular(35.0),
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 5),
                const CircleAvatar(
                  radius: 30,
                  child: Icon(Icons.account_circle_outlined, size: 70),
                  backgroundColor: Colors.white,
                ),
                const SizedBox(height: 10),
                Text(
                  "${item['rider_name'] ?? 'Unknown'}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Icon(
                          item['rider_gender'] == 'male'
                              ? Icons.male // Icon for Male
                              : item['rider_gender'] == 'female'
                                  ? Icons.female // Icon for Female
                                  : Icons
                                      .help_outline, // Default icon if gender is unknown or other
                          color: item['rider_gender'] == 'male'
                              ? Colors.blue
                              : item['rider_gender'] == 'female'
                                  ? Colors.pink
                                  : Colors.grey,
                        ),
                        const SizedBox(width: 5), // Space between icon and text
                        Text(
                          "${item['rider_gender'] ?? 'Unknown'}",
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.credit_card, size: 18),
                    const SizedBox(width: 5),
                    Text(
                      "${item['price'] ?? 'Unknown'} THB",
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.date_range, size: 18),
                    const SizedBox(width: 5),
                    Text(
                      "Date: ${item['date'] ?? 'Unknown'}",
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Pick up",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(Icons.trip_origin,
                              color: Colors.green[800], size: 16),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              item['pick_up'] ?? 'Unknown',
                              style: const TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      // แสดงคอมเมนต์ที่ได้รับจาก item
                      Text(
                        "${item['comment_pick'] ?? 'No comment'}", // แสดงคอมเมนต์ pick up
                        style: const TextStyle(fontSize: 10),
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        "Drop",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Icon(Icons.location_on,
                              color: Colors.red, size: 16),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              item['at_drop'] ?? 'Unknown',
                              style: const TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      // แสดงคอมเมนต์ที่ได้รับจาก item
                      Text(
                        "${item['comment_drop'] ?? 'No comment'}", // แสดงคอมเมนต์ drop
                        style: const TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  item['status_helmet'] == '1' || item['status_helmet'] == 1
                      ? "There is a helmet for you" // If 1, show this message
                      : "Bring your own a helmet", // If 0, show this message
                  style: TextStyle(
                    fontSize: 14,
                    color: item['status_helmet'] == '1' ||
                            item['status_helmet'] == 1
                        ? Colors.green // Green for "There is a helmet for you"
                        : Colors.red, // Red for "Bring your own a helmet"
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        _showDialog();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text("Accept",
                          style: TextStyle(color: Colors.white)),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        debugPrint(item.toString());
                        _showRejectDialog();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text("Reject",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
