import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prjct_andie/checkbox/checkbox_state.dart';


void main() {
  runApp(const MaterialApp(home: ClientCategory()));
}


class ClientCategory extends StatefulWidget {
  const ClientCategory({Key? key}) : super(key: key);

  @override
  State<ClientCategory> createState() => _ClientCategoryState();
}

class _ClientCategoryState extends State<ClientCategory> {

  final notifications = [
    CheckBoxState(title: 'PANDAY'),
    CheckBoxState(title: 'PLUMBER'),
    CheckBoxState(title: 'PAINTER'),
    CheckBoxState(title: 'GARDENER'),
    CheckBoxState(title: 'COOK'),
    CheckBoxState(title: 'TECHNICIAN'),
    CheckBoxState(title: 'ELECTRICIAN'),
    CheckBoxState(title: 'PLUMBER'),
    CheckBoxState(title: 'HOUSE KEEPER'),
    CheckBoxState(title: 'LAUNDERER'),
  ];
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
                  onPressed: () {},
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
         width:1500,
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

             Container (
               margin: const EdgeInsets.only(top: 5),
               //   color: Colors.blue,
               width: 1200,
               height: 180,
               child: GridView(
                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                   crossAxisCount: 3,
                   childAspectRatio: 10,
                   crossAxisSpacing: 50,
                   mainAxisSpacing: 10,
                 ),
                 children: [
                   ...notifications.map(buildSingleCheckBox).toList(),
                 ],

               ),

             ),
             Center(
               child: Container(
                 margin: const EdgeInsets.only(right: 65),
                 child: ElevatedButton(
                   child: const Text('DONE'),
                   onPressed: () async {
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
      onChanged: (value) => setState(() =>checkbox.value =value!),
    );
}
