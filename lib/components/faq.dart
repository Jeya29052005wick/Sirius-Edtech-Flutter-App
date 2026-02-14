import 'package:flutter/material.dart';

class FAQ extends StatelessWidget {
  const FAQ({super.key});

  final List<Map<String, String>> faqList = const [
    {
      'question': 'What is this app about?',
      'answer': 'This app provides online math tuition with videos.'
    },
    {
      'question': 'Who can use this app?',
      'answer': 'Students from Class 6 to 12, college students, and competitive exam aspirants.'
    },
    {
      'question': 'Do I need to pay to use the app?',
      'answer': 'Free users can access basic content. Premium users get full access to all features.'
    },
    {
      'question': 'How are the lessons structured?',
      'answer': 'Lessons include concept videos.'
    },
    {
      'question': 'How can I contact support?',
      'answer': 'Email: sirusmathcourses@gmail.com'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("FAQ"),backgroundColor: Colors.white,),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: faqList.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.white,
            margin: const EdgeInsets.only(bottom: 12),
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Theme(
              data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                tilePadding: const EdgeInsets.symmetric(horizontal: 16),
                title: Text(
                  faqList[index]['question']!,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      faqList[index]['answer']!,
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),

    );
  }
}
