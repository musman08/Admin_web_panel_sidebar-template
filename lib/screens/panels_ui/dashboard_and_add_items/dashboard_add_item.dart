import 'package:flutter/material.dart';
import 'package:untitled/utils/utils.dart';
import 'package:untitled/widgets/mytextformfield_widget.dart';
import 'package:date_time_picker/date_time_picker.dart';

class DashboardAddItemScreen extends StatefulWidget {
  const DashboardAddItemScreen({Key? key}) : super(key: key);

  @override
  State<DashboardAddItemScreen> createState() => _DashboardAddItemScreenState();
}

class _DashboardAddItemScreenState extends State<DashboardAddItemScreen> {
  final _formKey = GlobalKey<FormState>();
  int ? selectedValue;
  // DateTime dateTime = DateTime(2022, 12, 24, 00, 00);
  DateTime dateTime = DateTime.now();
  bool dateSelected = false;
  bool timeSelected = false;

  void validateFields() {
    if (_formKey.currentState!.validate()) {
      if(timeSelected == true || dateSelected == true){

      }else{
        Utils().toastMessage("Please Select Date and Time both");
      }
    }
  }

  Future<DateTime?> pickDate() => showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
  );
  Future<TimeOfDay?> pickTime() => showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute)
  );



  @override
  Widget build(BuildContext context) {
    final hours = dateTime.hour.toString().padLeft(2, '0');
    final minutes = dateTime.minute.toString().padLeft(2, '0');
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add Job Post"),
        ),
        // backgroundColor: Colors.,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text("Make Your Job Post Here", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  const MyText(text: "Job Title", top: 20, bottom: 5, left: 3,),
                  ////First Form Field
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 700),
                    child: MyTextFormField(
                      hintText: "Job Title",
                      keyboardType: TextInputType.text,
                      prefixIcon: Icons.person,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Job title is must!";
                        } else if (value.trim().length < 15) {
                          return 'Enter a valid Name at least 15 Characters';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: ConstrainedBox(constraints:const BoxConstraints(maxWidth: 600),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const MyText(text: "Date", left: 5, bottom: 5,),
                                ElevatedButton(
                                  onPressed: () async{
                                    final date = await pickDate();
                                    if(date ==null) return;
                                    final newDateTime = DateTime(
                                      date.year,
                                      date.month,
                                      date.day,
                                      dateTime.hour,
                                      dateTime.minute,
                                    );
                                    setState(() {
                                      dateTime = newDateTime;
                                      dateSelected = true;
                                      print(dateTime.day);
                                    });
                                  },
                                  child: dateSelected ==false ? const Text("Select Date") : Text("${dateTime.year}/${dateTime.month}/${dateTime.day}"),
                                ),
                                const MyText(text: "Hourly Rate", top: 15, left: 5, bottom: 5,),
                                MyTextFormField(
                                  keyboardType: TextInputType.number,
                                  prefixIcon: Icons.money,
                                  validator: (value) {
                                    if(value!.isEmpty){
                                      return "Enter your rate";
                                    }
                                    else if (int.tryParse(value.trim()) == null) {
                                      return "Enter a valid number!";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                                const MyText(text: "Country",top:10, left: 5, bottom: 5,),
                                MyTextFormField(
                                  hintText: "Country Name",
                                  keyboardType: TextInputType.number,
                                  prefixIcon: Icons.flag_outlined,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Enter your country name";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                                const MyText(text: "Score",top:10, left: 5, bottom: 5,),
                                DropdownButtonFormField<int>(
                                  items: List.generate(5, (index) {
                                    return DropdownMenuItem<int>(
                                      value: index + 1,
                                      child: Text('${index + 1}'),
                                    );
                                  }),
                                  value: selectedValue,
                                  onChanged: (value){
                                    selectedValue = value;
                                  },
                                  validator: (value){
                                    if(value == null){
                                      return "please Select a value";
                                    }
                                  },
                                  decoration:  InputDecoration(
                                    hintText: "Score Value",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10)
                                      )
                                  ),
                                ),
                              ],
                            )
                          ),
                         const SizedBox(width: 10,),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const MyText(text: "Time", left: 5, bottom: 5,),
                                ElevatedButton(
                                  onPressed: () async{
                                    final time = await pickTime();
                                    if(time ==null) return;
                                    final timeTime = DateTime(
                                      dateTime.year,
                                      dateTime.month,
                                      dateTime.day,
                                      time.hour,
                                      time.minute
                                    );
                                    setState(() {
                                      dateTime = timeTime;
                                      timeSelected = true;
                                      // print(dateTime.day);
                                    });
                                  },
                                  child: timeSelected ==false ? const Text("Select Time") :  Text("$hours:$minutes") ,
                                ),
                                const MyText(text: "Budget in Dollars", top: 15, left: 5, bottom: 5,),
                                MyTextFormField(
                                  keyboardType: TextInputType.number,
                                  prefixIcon: Icons.monetization_on_outlined,
                                  validator: (value) {
                                    if(value!.isEmpty){
                                      return "Budget please!";
                                    }
                                    else if (int.tryParse(value.trim()) == null) {
                                      return "Enter a valid number!";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                                // const MyText(text: "Hourly Rate", left: 5, bottom: 5,),
                              ],
                            )
                          ),
                        ],
                      ),
                    ),
                  ),

                  const MyText(text: "Job Description",left: 3, bottom: 5, top: 10,),
                  MyTextFormField(
                    maxLines: 7,
                    hintText: "Job Description at least 50 characters",
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Description";
                      } else if (value.trim().length < 50) {
                        return 'Enter a valid job description of at least 50 Characters';
                      } else {
                        return null;
                      }
                    },
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  Center(child: ElevatedButton(
                      onPressed: () => validateFields(),
                      child: const Text("Upload Data")),)
                ],
              ),
            ),
          ),
        )
        );
  }
}

class MyText extends StatelessWidget {
  const MyText({Key? key, required this.text, this.top, this.bottom, this.right, this.left, this.fontSize}) : super(key: key);
  final String text;
  final int ? top;
  final int ? bottom;
  final int? right;
  final int? left;
  final int? fontSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
          left: (left ?? 0).toDouble(),
          right: (right ?? 0).toDouble(),
          top: (top ?? 0).toDouble(),
          bottom: (bottom?? 0).toDouble()
        ),
      child: Text(text, style: TextStyle(fontSize: (fontSize ?? 14).toDouble() ),),
    );
  }
}
