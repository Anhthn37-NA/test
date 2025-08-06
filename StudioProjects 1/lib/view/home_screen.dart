import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navigator_routing/view/state_widget.dart';
import 'information_screen.dart';
import 'package:navigator_routing/resources/widgets/common_widget.dart';
import 'package:navigator_routing/resources/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'saved_information.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TextEditingController? usernameController;
  TextEditingController? birthYearController;
  String userName = NOT_DEFINE;
  String age = NOT_DEFINE;
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

//3.Khởi tạo State
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    usernameController = TextEditingController();
    birthYearController = TextEditingController();
    //1.Khởi tạo State
    //2.Được dùng để đặt các lệnh thực thi trước khi build:load dữ liệu từ cơ sở dữ liệu
    //3.context không hoạt động
  }

  //4.chạy khi load Dependencies,lúc này Widget có context
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  //6.Gọi khi Widget configuration bị thay đổi
  @override
  void didUpdateWidget(covariant HomeScreen oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  //8.Xóa State khỏi Tree,xảy ra khi chuyển màn hình (hủy widget đó)
  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }

  //9.Hủy state đi
  @override
  void dispose() {
    // TODO: implement dispose
    print("Hàm dispose được chạy,state bị xóa");
    if(!mounted) {print("Biến mouted là false");};
    super.dispose();
    usernameController!.dispose();
    birthYearController!.dispose();
  }


  //5.Hàm build
  @override
  Widget build(BuildContext context) {
    //2.Biến mouted == true;
    if(mounted){print("mouted đã tạo ra");}
    print("Hàm build đã được chạy");
    return Scaffold(
        appBar: AppBar(
            title: Text(USER_INFORMATION),
            centerTitle: true
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            // color: Colors.blue,
            child: Column(
              children: [
                // Tên Widget
                textInputWidget(
                    labelText: USER_NAME,
                    hintText: USER_NAME_HERE,
                    controller: usernameController),

                // Năm sinh Widget
                textInputWidget(
                    labelText: BIRTH_YEAR,
                    hintText: BIRTH_YEAR_HERE,
                    controller: birthYearController),

                // Xac nhan Buttons
                ElevatedButton(
                    onPressed: (){
                      //7.Hàm setState:Build lại toàn bộ các widget,kể cả widget không liên quan
                      setState(() {
                        userName = usernameController!.text;
                        age = (DateTime.now().year - int.parse(birthYearController!.text)).toString();
                      });
                      storeInformation(userName: userName, age: age);
                    },
                    child: Text(CONFIRM)),
                /*
              confirmationButton(
                  onPressed: (){
                    setState(() {
                      userName = usernameController!.text;
                      age = (DateTime.now().year - int.parse(birthYearController!.text)).toString();
                    });
                  },
                  labelButton: "Xác nhận"),
               */

                // Information Widget
                informationWidget(
                    userNameContent: userName,
                    ageContent: age),

                // Next Page Button Widget
                TextButton(
                    onPressed: (){
                      /*
                    var route = MaterialPageRoute(builder: (context) => InformationScreen(
                        userName: userName, age: age));
                    Navigator.push(context, route);

                     */
                      var route = MaterialPageRoute(builder: (context) => StateWidget(
                          userName: userName, age: age));
                      Navigator.push(context, route);
                    },
                    child: Text(NEXT_PAGE)),
                TextButton(
                    onPressed: (){
                      Get.to(() => SavedInformation());

                    },
                    child: Text(VIEW_SAVED_INFORMATION)
                )
              ],
            ),
          ),
        )
    );
  }

  // Lưu thông tin vào shared_preferences(key:value); int, double, String, bool
  storeInformation({required String userName, required String age}) async {
    /* SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setString("userName", userName);
  preferences.setString("age", age);
     */
    final SharedPreferences prefs = await _prefs;
    await prefs.setString('information', USER_NAME + ":" + userName + "\n" + AGE + ":" + age);
    print("Save Information");


  }

}

