import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prjct_andie/checkbox/checkbox_state.dart';
import 'package:universal_html/html.dart' as html;


void main() {
  runApp(const MaterialApp(home: ClientCategory()));
}


class ClientCategory extends StatefulWidget {
   const ClientCategory({Key? key}) : super(key: key);

  @override
  State<ClientCategory> createState() => _ClientCategoryState();
}

var tmpArray = [];


class _ClientCategoryState extends State<ClientCategory> {

  Map<String, bool> values = {
    'PANDAY': false,
    'PLUMBER': false,
    'PAINTER': false,
    'GARDENER': false,
    'COOK': false,
    'TECHNICIAN': false,
    'ELECTRICIAN': false,
    'HOUSE KEEPER': false,
    'LAUNDERER': false,
  };



  getCheckboxItems() {
    values.forEach((key, value) {
      if (value == true) {
        tmpArray.add(key);
      }
    });

    // Printing all selected items on Terminal screen.
    print(tmpArray);
    // Here you will get all your selected Checkbox items.

    // Clear array after use.
    tmpArray.clear();
  }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: const Color.fromRGBO(255, 205, 84, 1.0),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(65),
          child: AppBar(
            backgroundColor: const Color.fromRGBO(255, 205, 84, 1.0),
            title: Image.asset('assets/andie_logo.png',
              width: 180,
            ),
            actions: <Widget>[
              Center(
                child: Container(
                  margin: const EdgeInsets.only(right: 65),

                  child: const Text('My Andie',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  ),

                ),
              ),
              Center(
                child: Container(
                  margin: const EdgeInsets.only(right: 65),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () {

                    },
                    child: const Text('Category',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  margin: const EdgeInsets.only(right: 65),
                  child: const Text('Profile',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  ),

                ),
              ),
            ],
          ),
        ),
        body:
        Center(
          child: Container(
            padding: const EdgeInsets.all(15),
            color: Colors.white,
            width: 1500,
            height: 650,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text('CATEGORY',
                  style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold
                  ),),

                Container(
                  margin: const EdgeInsets.only(top: 5),
                  //   color: Colors.blue,
                  width: 1200,
                  height: 180,
                  child: ListView(
                    children: values.keys.map((String key) {
                      return CheckboxListTile(
                        title: Text(key),
                        value: values[key],
                        activeColor: Colors.pink,
                        checkColor: Colors.white,
                        onChanged: (bool? value) async {
                          setState(() {
                            values[key] = value!;
                          });
                        },
                      );
                    }).toList(),
                  ),

                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(right: 65),
                    child: ElevatedButton(
                      child: const Text('DONE'),
                      onPressed: () async {

                        //html.window.location.reload();
                        getCheckboxItems();
                      },
                    ),
                  ),
                ),

              ],
            ),
          ),

        ),

      );
    }

    Widget buildSingleCheckBox(CheckBoxState checkbox) =>
        CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          activeColor: Colors.orangeAccent,
          value: checkbox.value,
          title: Text(checkbox.title,
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
          onChanged: (value) => setState(() => checkbox.value = value!),
        );


}
