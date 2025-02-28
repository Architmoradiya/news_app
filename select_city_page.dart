
import 'package:flutter/material.dart';

import 'bottom_nav_bar.dart';

class CitySelection extends StatefulWidget {
  const CitySelection({super.key});

  @override
  State<CitySelection> createState() => _CitySelectionState();
}

class _CitySelectionState extends State<CitySelection> {
  List<String> allCities = [
    "London",
    "New York",
    "Tokyo",
    "Sydney",
    "Dubai",
    "Bangkok",
    "Singapore",
    "Hong kong",
    "Seoul",
    "Los Angeles",
    "Barcelona",
    "Istanbul",
    "Rome",
    "Berlin",
    "Bali",
    "Hanoi",
    "Malaysia",
    "Maldives",
    "Durban",
    "Barbados",
    "Bhutan",
    "India",
    "Venezuela",
    "Viertnam",
  ];
  List<String> displayedCities = [];
  String selectedCity = "";
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    displayedCities = List.from(allCities);
  }

  void filterSearch(String query) {
    setState(() {
      if (query.isEmpty) {
        displayedCities = List.from(allCities);
      } else {
        List<String> filtered = allCities
            .where((city) => city.toLowerCase().contains(query.toLowerCase()))
            .toList();

        // Move matching cities to the top
        displayedCities = [
          ...filtered,
          ...allCities.where((city) => !filtered.contains(city))
        ];
      }
    });
  }

  void navigateToNextPage() {
    if (selectedCity.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BottomNavbar(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Box
            TextField(
              controller: searchController,
              onChanged: filterSearch,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: "Search your city",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            SizedBox(height: 16),

            // City List
            Expanded(
              child: ListView.builder(
                itemCount: displayedCities.length,
                itemBuilder: (context, index) {
                  String city = displayedCities[index];
                  return ListTile(
                    leading: Icon(Icons.send, size: 18, color: Colors.grey),
                    title: Text(
                      city,
                      style: TextStyle(
                        color:
                            city == selectedCity ? Colors.blue : Colors.black,
                        fontWeight: city == selectedCity
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        selectedCity = city;
                      });
                    },
                  );
                },
              ),
            ),

            // Next Button
            ElevatedButton(
              onPressed: selectedCity.isNotEmpty ? navigateToNextPage : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text("Next"),
            ),
          ],
        ),
      ),
    );
  }
}
