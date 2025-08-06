import 'package:flutter/material.dart';
import 'package:navigator_routing/resources/widgets/common_widget.dart';
import 'package:get/get.dart';

class StateWidget extends StatefulWidget {
  final String userName;
  final String age;

  const StateWidget({super.key,required this.userName, required this.age});
  //1.Tạo ra State, 2.Gán State với context, context đại diện cho 1 widget
  @override
  State<StateWidget> createState() => _StateWidgetState();
}

class _StateWidgetState extends State<StateWidget> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Information"),
        leading: IconButton(
          onPressed: (){
            //Get.back();
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_outlined),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: informationWidget(
              userNameContent: widget.userName,
              ageContent: widget.age),
        ),
      ),
    );
  }

}
