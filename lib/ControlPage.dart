import 'package:flutter/material.dart';

class ControlPage extends StatelessWidget {
  const ControlPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 229, 246, 218),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 113, 160, 59),
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 20,
              backgroundImage: const AssetImage('assets/images/Logo.jpg'),
            ),
            const SizedBox(width: 15),
            const Text(
              "Control Panel",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
      body: ListView(
        children: const [
          WaterStatus(title: 'WaterStatus 1'),
          WaterStatus(title: 'WaterStatus 2'),
        ],
      ),
    );
  }
}

class WaterStatus extends StatefulWidget {
  final String title;
  const WaterStatus({super.key, required this.title});

  @override
  State<WaterStatus> createState() => _WaterStatusState();
}

class _WaterStatusState extends State<WaterStatus> {
  bool isAutoWater = false;
  TimeOfDay timeOn = const TimeOfDay(hour: 0, minute: 0);
  TimeOfDay timeOff = const TimeOfDay(hour: 0, minute: 0);

  Future<void> selectTime(BuildContext context, bool isOnTime) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: isOnTime ? timeOn : timeOff,
    );
    if (picked != null) {
      setState(() {
        if (isOnTime) {
          timeOn = picked;
        } else {
          timeOff = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(255, 203, 234, 185),
            Color.fromARGB(255, 242, 249, 240),
          ],
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              gradient: const LinearGradient(
                colors: [
                  Color.fromARGB(255, 132, 220, 81),
                  Color(0xFFD2EFC7),
                ],
              ),
            ),
            child: Column(
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Image.asset(
                      "assets/images/valve.png",
                      width: 80,
                      height: 80,
                    ),
                    const SizedBox(width: 30),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Auto Water",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Switch(
                            value: isAutoWater,
                            onChanged: (val) {
                              setState(() {
                                isAutoWater = val;
                              });
                            },
                            activeColor: Colors.white,
                            activeTrackColor: Colors.green,
                            inactiveThumbColor: Colors.white,
                            inactiveTrackColor: Colors.red,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildTimeControl("Time On", timeOn, () => selectTime(context, true)),
              buildTimeControl("Time Off", timeOff, () => selectTime(context, false)),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildTimeControl(String label, TimeOfDay time, VoidCallback onTap) {
    return Column(
      children: [
        Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 3)),
              ],
            ),
            child: Text(
              '${time.hour.toString().padLeft(2, '0')} : ${time.minute.toString().padLeft(2, '0')} | ${time.period.name}',
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
