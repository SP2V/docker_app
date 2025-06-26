import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  
  List<String> title = ["โรคกุ้งแห้ง", "โรคใบจุด", "โรคใบเหลือง"];

  List<String> detail = [
    '''1. การจัดการแปลงปลูก
ปลูกพริกในพื้นที่ระบายน้ำดี ไม่ชื้นแฉะ

ระยะห่างระหว่างต้น/แถวให้พอเหมาะ ลดการอับชื้น

กำจัดวัชพืชรอบแปลงเพื่อให้อากาศถ่ายเท

2. การตัดแต่งและทำลายผลที่เป็นโรค
ตัดผลที่แสดงอาการโรคและเผาทำลาย

ไม่ควรทิ้งไว้ในแปลง เพราะเชื้อราจะฟุ้งกระจาย

3. การใช้สารป้องกันกำจัดโรคพืช
พ่นสารเคมีที่มีฤทธิ์ต้านเชื้อรา เช่น:

แมนโคเซบ (Mancozeb)

โพรพิเนบ (Propineb)

โพรคลอราซ (Prochloraz)

อะซอกซีสโตรบิน (Azoxystrobin)

คาร์เบนดาซิม (Carbendazim)

พ่นทุก 7–10 วันในช่วงที่มีความชื้นสูง หรือเมื่อเริ่มพบอาการ''',
    
'''1. การจัดการแปลงปลูก
เลือกพันธุ์ที่ต้านทานโรคถ้ามี

จัดระยะปลูกให้ต้นไม้ไม่แออัด อากาศถ่ายเทดี ลดความชื้นบนใบ

กำจัดวัชพืชและเศษใบที่ร่วงลงดิน เพราะเป็นแหล่งสะสมเชื้อโรค

2. การตัดแต่งใบที่เป็นโรค
ตัดและเก็บใบที่มีอาการโรคไปทำลายนอกแปลง ห้ามทิ้งไว้ในแปลงเพราะเชื้อจะฟุ้งกระจาย

3. การใช้สารป้องกันกำจัดโรคพืช
พ่นสารป้องกันเชื้อราที่มีประสิทธิภาพ เช่น

แมนโคเซบ (Mancozeb)

โพรพิเนบ (Propineb)

ไตรฟอรีน (Triforine)

โพรคลอราซ (Prochloraz)

สำหรับโรคใบจุดที่เกิดจากแบคทีเรีย ใช้สารกลุ่มคอปเปอร์ (Copper oxychloride หรือ Copper hydroxide)

พ่นสารตามคำแนะนำทุก 7–10 วัน โดยเฉพาะในช่วงที่มีฝนตกหรืออากาศชื้น

4. การใช้ชีวภัณฑ์
ใช้ไตรโคเดอร์มา (Trichoderma spp.) ช่วยยับยั้งเชื้อราที่เป็นสาเหตุของโรคใบจุด''',
    
'''1. การจัดการแปลงปลูก
เลือกพันธุ์ที่ต้านทานโรคถ้ามี

จัดระยะปลูกให้ต้นไม้ไม่แออัด อากาศถ่ายเทดี ลดความชื้นบนใบ

กำจัดวัชพืชและเศษใบที่ร่วงลงดิน เพราะเป็นแหล่งสะสมเชื้อโรค

2. การตัดแต่งใบที่เป็นโรค
ตัดและเก็บใบที่มีอาการโรคไปทำลายนอกแปลง ห้ามทิ้งไว้ในแปลงเพราะเชื้อจะฟุ้งกระจาย

3. การใช้สารป้องกันกำจัดโรคพืช
พ่นสารป้องกันเชื้อราที่มีประสิทธิภาพ เช่น

แมนโคเซบ (Mancozeb)

โพรพิเนบ (Propineb)

ไตรฟอรีน (Triforine)

โพรคลอราซ (Prochloraz)

สำหรับโรคใบจุดที่เกิดจากแบคทีเรีย ใช้สารกลุ่มคอปเปอร์ (Copper oxychloride หรือ Copper hydroxide)

พ่นสารตามคำแนะนำทุก 7–10 วัน โดยเฉพาะในช่วงที่มีฝนตกหรืออากาศชื้น

4. การใช้ชีวภัณฑ์
ใช้ไตรโคเดอร์มา (Trichoderma spp.) ช่วยยับยั้งเชื้อราที่เป็นสาเหตุของโรคใบจุด''',
  ];

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
              backgroundImage: AssetImage('assets/images/Logo.jpg'),
            ),
            const SizedBox(width: 15),
            const Text(
              "Notification",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(top: 10),
        itemCount: title.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: _buildExpandableNotification(
              context,
              title[index],
              detail[index],
            ),
          );
        },
      ),
    );
  }

  Widget _buildExpandableNotification(BuildContext context,String title,String detail,) 
  {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(0, 3)),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: ExpansionTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          collapsedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
          ),
          collapsedBackgroundColor: Colors.white,
          backgroundColor: const Color(0xFFD2EFC7),
          tilePadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 3),
          title: Text(
            "${title.toString()}",
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(25),
              child: Text(
                "${detail.toString()}",
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
