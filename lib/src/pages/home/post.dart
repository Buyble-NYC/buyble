import 'package:buyble_real/src/utils/buyble_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Post extends StatefulWidget {
  const Post({Key? key}) : super(key: key);

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  late TextEditingController _titleController;
  late TextEditingController _priceController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    // TODO: implement initState
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    _priceController = TextEditingController();

    super.initState();
  }

  PreferredSizeWidget _appbar() {
    return AppBar(
      elevation: 0.2,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_new,
          size: 25,
        ),
        onPressed: () {
          Get.back();
        },
      ),
      title: Text("Post For Sale"),
      actions: [
        TextButton(
            onPressed: () {
              print("save the post!");
            },
            child: Text(
              "Done",
              style: TextStyle(color: BuybleColor.colorList[0], fontSize: 18),
            )),
        SizedBox(width: 10,)
      ],
    );
  }

  Widget _imageSection() {
    return Container(
      width: Get.width,
      height: Get.width - 30,
      color: Colors.grey,
    );
  }

  Widget _line() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6),
      width: Get.width,
      height: 1,
      color: Colors.grey.withOpacity(0.4),
    );
  }

  Widget _title() {
    return Container(
      width: Get.width,
      child: TextField(
        controller: _titleController,
        decoration: InputDecoration(
          hintText: "Title",
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.grey,
          ),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }

  Widget _price() {
    return Container(
      width: Get.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "\$",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
              SizedBox(
                width: 200,
                child: TextField(
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      _priceController.text = value;
                    });
                    //이거 전부다 컨트롤러 사용해야겠다
                  },
                  controller: _priceController,
                  decoration: InputDecoration(
                    hintText: "Set to 0 to give away",
                    hintStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 12),
                width: 23,
                height: 23,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(4)),
                child: _priceController.text == "0"
                    ? GestureDetector(
                        onTap: () {
                          print("color check box is clicked");
                          //이거 전부다 컨트롤러 사용해야겠다
                        },
                        child: Container(
                          color: BuybleColor.colorList[2],
                          child: Center(
                              child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 20,
                          )),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          setState(() {
                            _priceController.text == "0";
                          });
                        },
                        child: Container()),
                // child: Container(color: Colors.red,),
              ),
              Text(
                "Free",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _description() {
    return Container(
      width: Get.width,
      child: TextField(
        controller: _descriptionController,
        maxLines: 6,
        decoration: InputDecoration(
          hintText: "Describe your item in as much detail as you can",
          hintStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }

  Widget _location(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      margin: EdgeInsets.only(bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Where to meet",style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),),
          GestureDetector(
            onTap: (){
              print("location 정하는걸로 넘어가야댐");
            },
            child: Row(
              children: [
                Text("Select",style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16
                ),),
                SizedBox(width: 6,),
                Icon(Icons.arrow_forward_ios_rounded,size: 20,color: Colors.black87,)
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15),
        children: [
          _imageSection(),
          _line(),
          _title(),
          _line(),
          _price(), // 이거 컨트롤러 달아서 Obx 처리 해야겠다.
          _line(),
          _description(),
          _line(),
          _location(),
        ],
      ),
    );
  }
}
