import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgets_list/provider/testing_view_model.dart';
import 'package:widgets_list/widgets/save.dart';

class HiveDatabseScreen extends StatefulWidget {
  const HiveDatabseScreen({super.key});

  @override
  State<HiveDatabseScreen> createState() => _HiveDatabseScreenState();
}

class _HiveDatabseScreenState extends State<HiveDatabseScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<TestingViewModel>(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Hive database'),
        ),
        // body: FutureBuilder(
        //   future: Hive.openBox("Student"),
        //   builder: ((context, snapshot) {
        //     return Text(snapshot.data.values.toString());
        //   }),
        // ),
        body: ListView.builder(
          itemCount: model.dataList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(model.dataList[index]["name"].toString()),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
                                  onTap: () {
                                    model.delete(index);
                                  },
                                  child: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  )),
                              InkWell(
                                onTap: () {
                                  log(index.toString());
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          content: Container(
                                            height: 300,
                                            width: double.infinity,
                                            child: Column(
                                              children: [
                                                TextFormField(
                                                  controller: nameController,
                                                  decoration: InputDecoration(
                                                    hintText: model
                                                        .dataList[index]["name"]
                                                        .toString(),
                                                  ),
                                                ),
                                                TextFormField(
                                                  controller: ageController,
                                                  decoration: InputDecoration(
                                                    hintText: model
                                                        .dataList[index]["age"]
                                                        .toString(),
                                                  ),
                                                ),
                                                TextFormField(
                                                  controller: addressController,
                                                  decoration: InputDecoration(
                                                    hintText: model
                                                        .dataList[index]
                                                            ["address"]
                                                        .toString(),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text("cancel")),
                                            TextButton(
                                                onPressed: () {
                                                  model.update(
                                                    index,
                                                    nameController.text
                                                        .trim()
                                                        .toString(),
                                                    ageController.text
                                                        .trim()
                                                        .toString(),
                                                    addressController.text
                                                        .trim()
                                                        .toString(),
                                                  );
                                                  Navigator.pop(context);
                                                },
                                                child: Text("update")),
                                          ],
                                        );
                                      });

                                  //arshad kh
                                },
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.amber,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              // Text(model.dataList[index]["age"].toString()),
                            ],
                          ),
                        ],
                      ),
                      Text(model.dataList[index]["address"].toString()),
                    ],
                  ),
                ),
                // child: ListTile(

                // leading: ,
                // trailing: Row(
                //   children: [
                //     Icon(Icons.add),
                //     Text(model.dataList[index]["age"].toString()),
                //   ],
                // ),
                // ),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            //var box = await Hive.openBox("Dommy");

            // box.add({"name": "khan", "age": "32"});

            // List list = box.toMap() as List;

            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SaveData()));
            //  var data = await Hive.openBox("Student");

            // data.addAll([
            //   {"name": "arshad kant", "age": 43, "address": "Hangue"}
            // ]);
            // model.init();

            // data.putAt(2, {"name": "hassan", "age": 23, "address": "Pakistan"});

            // List list = data.values.toList();
            // log(list.toString());

            // log(data.values.toList().toString());
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
