import 'package:flutter/material.dart';

class SensorDashboard extends StatefulWidget {
  const SensorDashboard({super.key});

  @override
  State<SensorDashboard> createState() => _SensorDashboardState();
}

class _SensorDashboardState extends State<SensorDashboard> {
  final double temperature = 30.0;
  final double humidity = 45.0;
  final bool waterStatus1 = false;
  final bool waterStatus2 = true;
  final bool cameraStatus = true;
  DateTime plantingDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: plantingDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != plantingDate) {
      setState(() {
        plantingDate = picked;
      });
    }
  }

  @override
  void didChangeDependencies() {
    // Preload images
    precacheImage(const AssetImage('assets/images/Logo.jpg'), context);
    precacheImage(const AssetImage('assets/images/valve.png'), context);
    precacheImage(const AssetImage('assets/images/camera.png'), context);
    super.didChangeDependencies();
  }

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
              "Sensor Dashboard",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          // Temperature & Humidity Box
          _buildTempHumidityBox(),

          // Device Status Box
          _buildDeviceStatusBox(),

          // Planting Date Box
          _buildPlantingDateBox(),
        ],
      ),
    );
  }

  Widget _buildTempHumidityBox() {
    return Container(
      margin: const EdgeInsets.all(13),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(36),
        gradient: const LinearGradient(
          colors: [Color(0xFFB0E194), Color(0xFFD2EFC7)],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              const Icon(Icons.wb_sunny, color: Colors.orange, size: 100),
              const SizedBox(height: 8),
              Text(
                "${temperature.toStringAsFixed(2)} °C",
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text("Air Temperature"),
            ],
          ),
          Container(width: 1, height: 115, color: Colors.grey),
          Column(
            children: [
              const Icon(Icons.water_drop, color: Color(0xFF03A9F4), size: 100),
              const SizedBox(height: 8),
              Text(
                "${humidity.toStringAsFixed(2)} %",
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text("Air Humidity"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDeviceStatusBox() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 13),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: const LinearGradient(
          colors: [Color(0xFFA2D088), Color(0xFFD2EFC7)],
        ),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 5, offset: Offset(0, 3)),
        ],
      ),
      child: Column(
        children: [
          const Text(
            "Device Status",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          _buildStatusRow("WaterStatus 1", waterStatus1),
          _dividerLine(),
          _buildStatusRow("WaterStatus 2", waterStatus2),
          _dividerLine(),
          _buildStatusRowWithImage(
            "Camera Status",
            "assets/images/camera.png",
            cameraStatus,
          ),
        ],
      ),
    );
  }

  Widget _dividerLine() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: 1,
        width: 300,
        color: const Color.fromARGB(168, 173, 173, 173),
      ),
    );
  }

  Widget _buildStatusRow(String label, bool isActive) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            Image.asset(
              "assets/images/valve.png",
              width: 80,
              height: 80,
              cacheWidth: 100,
            ),
            const SizedBox(width: 30),
            Text(label, style: const TextStyle(fontSize: 13)),
          ],
        ),
        Icon(
          Icons.circle,
          size: 25,
          color: isActive ? Colors.green : Colors.red,
        ),
      ],
    );
  }

  Widget _buildStatusRowWithImage(
    String label,
    String imagePath,
    bool isActive,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            Image.asset(imagePath, width: 80, height: 80, cacheWidth: 100),
            const SizedBox(width: 30),
            Text(label, style: const TextStyle(fontSize: 13)),
          ],
        ),
        Icon(
          Icons.circle,
          size: 25,
          color: isActive ? Colors.green : Colors.red,
        ),
      ],
    );
  }

  Widget _buildPlantingDateBox() {
    return Container(
      margin: const EdgeInsets.all(13),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: const LinearGradient(
          colors: [Color(0xFFB0E194), Color(0xFFD2EFC7)],
        ),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 3)),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: const [
              Icon(Icons.forest, color: Colors.green, size: 30),
              SizedBox(width: 15),
              Text(
                "Planting Date",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${plantingDate.day.toString().padLeft(2, '0')}/${plantingDate.month.toString().padLeft(2, '0')}/${plantingDate.year}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(width: 8),
              InkWell(
                onTap: () => _selectDate(context),
                child: const Icon(Icons.edit, size: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
