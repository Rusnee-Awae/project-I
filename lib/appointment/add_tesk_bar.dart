
import 'package:authentification/appointment/input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class AddTeskpage extends StatefulWidget{
  const AddTeskpage({Key key}) : super(key: key);

  @override
  State<AddTeskpage> createState() => _AddTeskpageState();
}

class _AddTeskpageState extends State<AddTeskpage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  DateTime _selectedData = DateTime.now();
  String _endTime= "9:30 PM";
  String _startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  int _selectedRemind =5;
  List<int> remaindList=[
    5,
    10,
    15,
    20,
  ];

  String _selectedRepeat = "none";
  List<String> RepeatList=[
    "rusnee",
    "awe",
    "rus",
    "rus",
  ];
  int _selectedColor=0;

  var value;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Book Appointment"),
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(Get.isDarkMode ? Icons.wb_auto_outlined : Icons.nightlife,
            size: 20,
            color: Get.isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        actions: [
          CircleAvatar(
            backgroundImage: AssetImage(
                "images/todo1.jpg"
            ),
          ),
          SizedBox(width: 20,)
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("add tesk",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                ),
              ),
              Myinput(
                title: "Date", hint: DateFormat.yMd().format(_selectedData),
                widget: IconButton(
                  icon: Icon(Icons.calendar_today_outlined,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    print("hi star");
                    _getDateFromUser();
                  },
                ),
              ),
              Row(
                children: [
                  Expanded(child: Myinput(
                    title: "star Date",
                    hint: _startTime,
                    widget: IconButton(
                      onPressed: (){
                        _getTimeFromUser(isStarTime: true);
                      },
                      icon: Icon(
                        Icons.access_time_rounded,
                        color: Colors.grey,
                      ),
                    ),
                  ),),
                  SizedBox(width: 12,),
                  Expanded(child: Myinput(
                    title: "end  Date",
                    hint: _endTime,
                    widget: IconButton(
                      onPressed: (){
                        _getTimeFromUser(isStarTime: true);
                      },
                      icon: Icon(
                        Icons.access_time_rounded,
                        color: Colors.grey,
                      ),
                    ),
                  ),)
                ],
              ),
              Myinput(title: "Remind", hint: "$_selectedRemind minutes early",
               widget: DropdownButton(
                icon:Icon(Icons.keyboard_arrow_down,
                color: Colors.grey,
                ),

                iconSize: 32,
                elevation: 4,
                underline: Container(height:0,),
                onChanged: (String newValue){
                  setState((){
                    _selectedRemind = int.parse(newValue);
                  });
                },
                items:remaindList.map<DropdownMenuItem<String>>((int value){
                  return DropdownMenuItem<String>(
                  value: value.toString(),
                  child: Text(value.toString())
                  );
              }
              ).toList(),
              ),
              ),
              Myinput(title: "Repead", hint: "$_selectedRepeat minutes early",
                widget: DropdownButton(
                  icon:Icon(Icons.keyboard_arrow_down,
                    color: Colors.grey,
                  ),

                  iconSize: 32,
                  elevation: 4,
                  underline: Container(height:0,),
                  onChanged: (String newValue){
                    setState((){
                      _selectedRepeat = newValue;
                    });
                  },
                  items:RepeatList.map<DropdownMenuItem<String>>((String value){
                    return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value, style: TextStyle(color: Colors.grey),)
                    );
                  }
                  ).toList(),
                ),
              ),
              SizedBox(height: 18,),
            ],

          ),
        ),
      ),
    );
  }

    _validateDate(){
    if(_titleController.text.isNotEmpty&&_noteController.text.isNotEmpty){
      _addTaskToDb();
      Get.back();
    }
    else if( _titleController.text.isNotEmpty || _noteController.text.isNotEmpty)
    {
      Get.snackbar("required","All are required",
      snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white,
        icon: Icon(Icons.warning_amber_rounded),
          colorText: Colors.pink
      );
    }
    }

    _addTaskToDb(){
    print("My id is "+"$value");
    }
    _colorPallete(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Color",
        ),
        SizedBox(height: 8.0,),
        Wrap(
            children: List<Widget>.generate(
                3,
                    (int index){
                  return GestureDetector(
                    onTap: (){
                      setState(() {
                        _selectedColor=index;
                        print("$index");
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right:8.0 ),
                      child: CircleAvatar(
                        radius: 14,
                        backgroundColor: Colors.pinkAccent,
                        child: _selectedColor==index?Icon(Icons.done,
                          color: Colors.white,
                          size: 16,
                        ): Container(

                        ),

                      ),
                    ),
                  );
                }
            )
        )
      ],
    );
    }
    // ignore: dead_code
    _getDateFromUser() async{
      DateTime _pickerDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2015),
          lastDate: DateTime(2121),
      );
      if(_pickerDate!=null){
        setState(() {
          _selectedData = _pickerDate;
          print(_selectedData);
        });
      }
      else{
        print("it is null ");

      }
    }
    _getTimeFromUser({bool isStarTime}) async {
    var pikckedTime= await _showTimePicker();
    String  _formatedTime = pikckedTime.format(context);
    if(pikckedTime==null){
      print("Time canceld");
    }
    else if(isStarTime==true){
      _startTime=_formatedTime;

    }
    else if(isStarTime==false){


    }
    }
    _showTimePicker(){
    return showTimePicker(
      initialEntryMode: TimePickerEntryMode.input,
      context: context,
    initialTime: TimeOfDay(
        
        hour: int.parse(_startTime.split(":")[0]), 
        minute: int.parse(_startTime.split(":")[1].split("")[0]))
    );
    }
}