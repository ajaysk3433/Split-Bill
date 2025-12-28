import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:split_bill/components/menu/menu.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _groupName = TextEditingController();
  final TextEditingController _groupDescription = TextEditingController();

  void openDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Create a group"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _groupName,
              decoration: InputDecoration(
                hintText: "Group Name",
                border: OutlineInputBorder(borderSide: BorderSide(width: 1)),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _groupDescription,
              decoration: InputDecoration(
                hintText: "Description",
                border: OutlineInputBorder(borderSide: BorderSide(width: 1)),
              ),
              keyboardType: TextInputType.multiline,
              maxLines: 5,
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: null, child: Text("Cancel")),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[600]),
            child: Text("Create", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      drawer: Menu(),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(width: 1)),
              color: Colors.grey.withAlpha(30),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: ListTile(title: Text("item $index")),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: openDialog,
        child: Text("+"),
      ),
    );
  }
}
