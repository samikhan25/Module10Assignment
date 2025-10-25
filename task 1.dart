import 'package:flutter/material.dart';

class Assign10 extends StatelessWidget {
  const Assign10({super.key});

  @override
  Widget build(BuildContext context) {
    final courses = [
      {
        'title': 'Full Stack Web Development with JavaScript (MERN)',
        'image': 'assets/imgg.jpeg',
        'batch': 'ব্যাচ: ১১',
        'days': '৬ দিন বাকি',
        'seat': '৬ সিট বাকি',
      },
      {
        'title': 'Full Stack Web Development with Python, Django & React',
        'image': 'assets/img2.jpeg',
        'batch': 'ব্যাচ: ৬',
        'days': '৪০ দিন বাকি',
        'seat': '৮৬ সিট বাকি',
      },
      {
        'title': 'Full Stack Web Development with ASP.Net Core',
        'image': 'assets/img3.jpeg',
        'batch': 'ব্যাচ ৭',
        'days': '৩৯ দিন বাকি',
        'seat': '৭৫ সিট বাকি',
      },
      {
        'title': 'SQA: Manual & Automated Testing',
        'image': 'assets/img4.jpeg',
        'batch': 'ব্যাচ: ১৩',
        'days': '৪১ দিন বাকি',
        'seat': '৬৫ সিট বাকি',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Assignment'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          itemCount: courses.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.52,
          ),
          itemBuilder: (context, index) {
            final course = courses[index];
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 4,
                    offset: const Offset(1, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 📸 Image
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    child: Image.asset(
                      course['image']!,
                      height: 95,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),

                  // 🧾 Info Row (Batch + Hour + Days)
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                    child: Wrap( // ✅ Wrap instead of Row
                      alignment: WrapAlignment.start,
                      spacing: 6,
                      runSpacing: 4,
                      children: [
                        _infoIconText(Icons.batch_prediction, course['batch']!),
                        _infoIconText(Icons.event_seat, course['seat']!),
                        _infoIconText(Icons.calendar_today, course['days']!),
                      ],
                    ),
                  ),

                  // 📚 Title (auto-wrap)
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Text(
                      course['title']!,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.visible, // ✅ no cut, wraps to next line
                    ),
                  ),

                  const Spacer(),

                  // 🔘 Button
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey.shade200,
                          padding: const EdgeInsets.symmetric(vertical: 7),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 0,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailPage(title: course['title']!),
                            ),
                          );
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'বিস্তারিত দেখুন',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: 5),
                            Icon(Icons.arrow_right_alt,
                                size: 18, color: Colors.black),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  // ✅ Overflow-safe + wrap-enabled info icon + text widget
  Widget _infoIconText(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 11.5, color: Colors.grey.shade700),
        const SizedBox(width: 2),
        Flexible(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 10.5,
              color: Colors.grey.shade700,
            ),
            softWrap: true, // ✅ wrap enabled
            overflow: TextOverflow.visible, // ✅ no ellipsis
          ),
        ),
      ],
    );
  }
}

class DetailPage extends StatelessWidget {
  final String title;
  const DetailPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title, style: const TextStyle(fontSize: 16))),
      body: Center(
        child: Text(
          'Details of $title',
          style: Theme.of(context).textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

