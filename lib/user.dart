import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
void main() {
  runApp( MaterialApp(
    home:User(),
  ));
}

class User extends StatefulWidget {
  User({Key? key}) : super(key: key);

  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  List<String> suggestions = ["Azadpur", "Vishwavidyalaya", "Karol Bagh", "Bhikaji Cama Place", "Khan Market", "Central Secretariat",
    "Lajpat Nagar", "Kashmere Gate", "Dilli Haat INA", "Rajouri Garden", "Dwarka Sector 21", "Dilshad Garden"];



  final TextEditingController _typeAheadController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Find A Ride', style: TextStyle(color: Colors.black, fontSize: 18)),
        backgroundColor: Colors.orange[900],
        centerTitle: true,
        leading: Container(
          margin: EdgeInsets.all(10),
          child: Icon(Icons.arrow_back),
          decoration: BoxDecoration(
              color: Colors.black12, borderRadius: BorderRadius.circular(10)
          ),
        ),
        actions: [
          Container(
              width: 37,
              margin: EdgeInsets.all(10),
              child: Icon(Icons.menu),
              decoration: BoxDecoration(
                  color: Colors.black12, borderRadius: BorderRadius.circular(10))),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(30),
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            TypeAheadField(
              hideOnLoading: true,
              animationDuration: Duration.zero,
              textFieldConfiguration: TextFieldConfiguration(
                controller: this._typeAheadController,
                autofocus: true,
                style: TextStyle(fontSize: 15),
                decoration: InputDecoration(
                    labelText: 'Select Metro Station', border: OutlineInputBorder()),
              ),
              suggestionsBoxDecoration: SuggestionsBoxDecoration(color: Colors.white),
              suggestionsCallback: (pattern) {
                List<String> matches = <String>[];
                matches.addAll(suggestions);

                matches.retainWhere((s) {
                  return s.toLowerCase().contains(pattern.toLowerCase());
                });
                return matches;
              },
              itemBuilder: (context, suggestion) {
                return Card(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Text(suggestion.toString()),
                    ));
              },
              onSuggestionSelected: (suggestion) {
                this._typeAheadController.text = suggestion;
              },
            ),
            SizedBox(height: 10.0,),
            ElevatedButton(
              child: Text('Next'),
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.deepOrange)),
              onPressed: () {
                _navigateToPollPage();
              },
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToPollPage() {
    FocusScope.of(context).unfocus(); // Unfocus any active text field
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PollPage()),
    );
  }
}

class _navigateToPollPage {
}

class PollPage extends StatelessWidget {
  @override
  List<Widget> items=[];



  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.orange[900]
// ... (existing code remains the same)
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20), // Add spacing between app bar and content
            PollWidget(title: 'Shalimar Bagh', noOfPeople: 2),
            SizedBox(height: 20),
            PollWidget(title: 'Satyawati College', noOfPeople: 3),
            Text("Add different destination",style: TextStyle(color: Colors.orange[900],fontSize: 18)),
            IconButton(onPressed: (){
              showDialog(context: context, builder: (context){
                return Container(
                  child: AlertDialog(
                      title: Text("Enter your destination"),
                      content: TextField(),
                      actions: [
                        TextButton(onPressed:(){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: const Text('Ashok Vihar\t No. of people: 1'),
                              duration: const Duration(seconds: 7)
                          ));
                          Navigator.pop(context);

                        }, child: Text("Ok"),

                        ), TextButton(onPressed:(){
                          Navigator.pop(context);
                        }, child: Text("Cancel")
                        )
                      ]
                  ),
                );
              });

            }, icon: Icon(Icons.add_circle_outlined, color: Colors.orange[900]),alignment: Alignment.bottomCenter, iconSize: 50,),
          ],
        ),
      ),
// ... (existing code remains the same)
    );
  }
}

class PollWidget extends StatelessWidget {
  final String title;
  final int noOfPeople;

  const PollWidget({required this.title, required this.noOfPeople});

  @override
  Widget build(BuildContext context) {


    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[800], // Dark grey color
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // Align content to the top
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white), // Larger font size and white color
              ),
              FloatingActionButton(
                onPressed: () {
// Implement your Create Poll button functionality here
                },
                child: Icon(Icons.add, color: Colors.orange[900]),
                // Orange plus icon
                backgroundColor: Colors.white,
                // White background for the plus button
                mini: true,
                // Smaller plus button
                elevation: 0, // No shadow
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            'No. Of People: $noOfPeople',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ],
      ),
    );
  }
}



