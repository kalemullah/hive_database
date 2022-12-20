import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:widgets_list/provider/testing_view_model.dart';

class SaveData extends StatefulWidget {
  const SaveData({super.key});

  @override
  State<SaveData> createState() => _SaveDataState();
}

class _SaveDataState extends State<SaveData> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<TestingViewModel>(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text("add data"),
        ),
        body: Container(
          child: Center(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: "name",
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: ageController,
                  decoration: InputDecoration(
                    hintText: "age",
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: addressController,
                  decoration: InputDecoration(
                    hintText: "address",
                  ),
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          )),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            var data = await Hive.openBox("Student");

            data.addAll([
              {
                "name": nameController.text.trim().toString(),
                "age": ageController.text.trim(),
                "address": addressController.text.trim().toString()
              }
            ]);
            model.init();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Data successfully added'),
              duration: Duration(seconds: 1),
            ));
            nameController.clear();
            addressController.clear();
            ageController.clear();
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
