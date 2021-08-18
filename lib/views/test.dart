import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Test extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Test"),),
      body: TestView(),
    );
  }
}

class TestView extends StatefulWidget{

  @override
  TestState createState() => TestState();
}

class TestState extends State{
  List<String> list = ["A", "B", "C", "D"];

  void changeList(){

    setState(() {
      String temp = list[1];
      list[1] = list[3];
      list[3] = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index){
                return ListTile(
                  title: Text(list[index]),
                  subtitle: Text(index.toString()),
                );
              },
            ),
        ),
        ElevatedButton(
          onPressed: changeList,
          child: Text("Change Button"),
        )
      ],
    );
  }
}