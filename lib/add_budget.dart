import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class AddBudgetPage extends StatefulWidget {
  static List<List<String>> listData = _AddBudgetPageState.list;
  const AddBudgetPage({super.key});

  @override
  State<AddBudgetPage> createState() => _AddBudgetPageState();
}

class _AddBudgetPageState extends State<AddBudgetPage> {
  static List<List<String>> list = [];
  final _formKey = GlobalKey<FormState>();
  String jenis = '';
  String title = '';
  String amount = '';
  List<String> listJenis = ['Income', 'Expenses'];
  List<String> listForm = [];

  List<List<String>> _getList(){
    return list;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text('Form', style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 22, color: Colors.black54,
        ),),
      ),
      // Adding drawer menu
      drawer: Drawer(
        child: Column(
          children: [
            SizedBox(height: 30.0,),
            // Adding clickable menu
            ListTile(
              title: const Text('counter_7'),
              onTap: () {
                // Routing the menu to the main page
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage()),
                );
              },
            ),
            ListTile(
              title: const Text('Add Budget Info'),
              onTap: () {
                // Routing the menu to the form page
                Navigator.pop(
                  context,
                  MaterialPageRoute(builder: (context) => const AddBudgetPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Budget Data'),
              onTap: () {
                // Routing the menu to the form page
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) =>  BudgetDataPage(list: list)),
                );
              },
            ),
          ],
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color.fromRGBO(128,212,196,1),),

                    ),
                    hintText: "Title",
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      title = value!;
                    });
                  },

                  onSaved: (String? value) {
                    setState(() {
                      title = value!;
                    });
                  },

                  // Validator sebagai validasi form
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Title cannot be empty!';
                    }
                    return null;
                  },

                ),
              ),
                const Divider(
                  height: 1,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color.fromRGBO(128,212,196,1),),

                      ),
                      hintText: "Amount",
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        amount = value!;
                      });
                    },

                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        amount = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Amount cannot be empty!';
                      }
                      return null;
                    },


                  ),
                ),
                const Divider(
                  height: 1,
                ),
                DropdownButton<String>(
                    value: listJenis.first,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    elevation: 16,
                    hint: Text(
                      "Choose Type",
                      style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                    ),
                    underline: Container(
                      height: 2,
                      color: Colors.white,
                    ),
                    items: listJenis.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(), onChanged: (String? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    jenis = value!;
                  });
                },
                ),
                TextButton(
                  child: const Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color.fromRGBO(128,212,196,1)),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      listForm.add(title);
                      listForm.add(amount);
                      listForm.add(jenis);
                      list.add(listForm);
                      listForm = [];
                      _sendDataToBudgetData(context);
                    }
                  },
                ),
            ],),
          ),
        ),

      ),
    );
  }
  void _sendDataToBudgetData(BuildContext context){
    var dataToSend = list;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  BudgetDataPage(list: dataToSend,))
    );
    
  }
}

class BudgetDataPage extends StatelessWidget {
  final list;
  BudgetDataPage({super.key, @required this.list});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text('Budget Data', style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 22, color: Colors.black54,
        ),),
      ),
      // Adding drawer menu
      drawer: Drawer(
        child: Column(
          children: [
            SizedBox(height: 30.0,),
            // Adding clickable menu
            ListTile(
              title: const Text('counter_7'),
              onTap: () {
                // Routing the menu to the main page
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage()),
                );
              },
            ),
            ListTile(
              title: const Text('Add Budget Info'),
              onTap: () {
                // Routing the menu to the form page
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const AddBudgetPage()),
                );
              },
            ),

          ],
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) => Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Color.fromRGBO(128,212,196,1)
            )
          ),
          elevation: 6,
          margin: const EdgeInsets.all(10),
          child:  ListTile(
            title: Text(list[index][0]),
            subtitle: Text(list[index][1]),
            trailing: Text(list[index][2]),
          ),
        )
          
        
      ),
      )
    );
  }


}
