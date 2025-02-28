import 'package:flutter/material.dart';

class PollQuestions extends StatefulWidget {
  @override
  _PollQuestionsState createState() => _PollQuestionsState();
}

class _PollQuestionsState extends State<PollQuestions> {
  Map<int, String?> _selectedOptions = {};

  final String _newsImage = 'assets/images/poll_Image.jpg';
  final String _sideImage1 = 'assets/images/poll_Image2.jpg';
  final String _sideImage2 = 'assets/images/poll_Image3.jpg';

  final List<Map<String, dynamic>> _pollQuestions = [
    {
      "question": "Who is the Best Player of India Cricket Team?",
      "options": ["MS Dhoni", "Virat Kohli", "Rohit Sharma"]
    },
    {
      "question": "Which is the best programming language?",
      "options": ["Python", "JavaScript", "Dart"]
    },
    {
      "question": "What is the capital of India?",
      "options": ["Delhi", "Mumbai", "Kolkata"]
    },
    {
      "question": "Which phone brand do you prefer?",
      "options": ["Apple", "Samsung", "OnePlus"]
    },
    {
      "question": "Best streaming platform?",
      "options": ["Netflix", "Amazon Prime", "Disney+"]
    },
    {
      "question": "Which is your favorite social media app?",
      "options": ["Facebook", "Instagram", "Twitter"]
    },
    {
      "question": "Which is the best car brand?",
      "options": ["Tesla", "BMW", "Mercedes"]
    },
    {
      "question": "Which Indian festival do you enjoy the most?",
      "options": ["Diwali", "Holi", "Eid"]
    },
    {
      "question": "What is your favorite food?",
      "options": ["Pizza", "Biryani", "Burgers"]
    },
    {
      "question": "Which sport do you like the most?",
      "options": ["Cricket", "Football", "Tennis"]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            SizedBox(
              width: 1,
            ),
            Icon(Icons.location_on, color: Colors.blue),
            SizedBox(width: 5),
            Text("Regent Street, London",
                style: TextStyle(color: Colors.black54)),
            Spacer(),
            Icon(Icons.monetization_on, color: Colors.amber),
            Text("2"),
            SizedBox(width: 10),
            Icon(Icons.notifications, color: Colors.blue),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              _buildCategoryTabs(),
              _buildLiveNewsCard(),
              _buildPollSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryTabs() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildTab("Popular"),
        _buildTab("All"),
        _buildTab("Politics"),
        _buildTab("Tech"),
      ],
    );
  }

  Widget _buildTab(String title) {
    return TextButton(
      onPressed: () {},
      child: Text(title,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
    );
  }

  Widget _buildLiveNewsCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Image.asset(_newsImage, fit: BoxFit.cover),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "LA blast: Police find dump of 7,000 mobile phones, Oppn knocks security lapses",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPollSection() {
    List<Widget> pollWidgets = [];

    for (int i = 0; i < _pollQuestions.length; i++) {
      pollWidgets.add(_buildPollQuestion(
          i, _pollQuestions[i]["question"], _pollQuestions[i]["options"]));

      if ((i + 1) % 2 == 0) {
        if (i == 1) {
          pollWidgets.add(_buildSideImageWithText(
              _sideImage1, "Exclusive: Political affairs and analysis."));
        } else if (i == 3) {
          pollWidgets.add(_buildSideImageWithText(_sideImage2,
              "Year in Review: The Biggest Climate Headlines of 2024"));
        }
      }
    }

    return Column(children: pollWidgets);
  }

  Widget _buildPollQuestion(int index, String question, List<String> options) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(question,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Column(
              children: options.map((option) {
                return RadioListTile<String>(
                  title: Text(option),
                  value: option,
                  groupValue: _selectedOptions[index],
                  onChanged: (value) {
                    setState(() {
                      _selectedOptions[index] = value;
                    });
                  },
                );
              }).toList(),
            ),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Your response has been recorded!"),
                  duration: Duration(seconds: 2),
                ));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              child: const Text("See Results"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSideImageWithText(String imagePath, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[300],
              ),
              child: Image.asset(imagePath, fit: BoxFit.cover),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Latest News Update",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
