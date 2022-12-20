import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  List<String> list = ["Arshad", "khan", "junaid", "Babar", "Tariq", "Mobile"];
  String search = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: (value) {
            setState(() {
              search = value;
            });
          },
        ),
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          if (search.isEmpty) {
            return ListTile(
              title: Text(list[index]),
            );
          }
          if (list[index].toLowerCase().contains(search)) {
            return ListTile(
              title: Text(list[index]),
            );
          }
          return Container();
        },
      ),
    );
  }
}
