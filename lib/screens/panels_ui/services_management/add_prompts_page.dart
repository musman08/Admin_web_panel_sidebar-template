import 'package:flutter/material.dart';
import '../../../utils/utils.dart';

class AddPromptsScreen extends StatefulWidget {
  const AddPromptsScreen({Key? key}) : super(key: key);

  @override
  State<AddPromptsScreen> createState() => _AddPromptsScreenState();
}

class _AddPromptsScreenState extends State<AddPromptsScreen> {
  final _formKey = GlobalKey<FormState>();

  void validateFields() {
    if (_formKey.currentState!.validate()) {
      return Utils().toastMessage("Prompt uploaded Successfully");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add Prompts"),
        ),
        // backgroundColor: Colors.,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
              child: ConstrainedBox(constraints: const  BoxConstraints(
                maxWidth: 500,
                minWidth: 500,
                maxHeight: 400,
                minHeight: 400,
              ), child: Container(

                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(3,3),
                        spreadRadius: 5.0 ,
                        blurRadius: 7.0,
                      )
                    ]
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text("Make Your Prompt ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Enter Your Prompt here of at least 500 Characters", style: TextStyle(fontStyle: FontStyle.italic, fontSize: 13),),
                              const SizedBox(height: 3,),
                              TextFormField(
                                maxLines: 4,
                                decoration: const InputDecoration(
                                    hintText: "Add your Prompt",
                                    border: OutlineInputBorder(
                                    )
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Write prompt";
                                  } else if (value.trim().length < 500) {
                                    return 'Enter a valid Prompt of at least 500 Characters';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Choose Service", style: TextStyle(fontStyle: FontStyle.italic, fontSize: 13),),
                              const SizedBox(height: 2,),
                              DropdownButtonFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  items: const [], onChanged: (value){}),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Choose Category", style: TextStyle(fontStyle: FontStyle.italic, fontSize: 13)),
                              const SizedBox(height: 2,),
                              DropdownButtonFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  items: const [], onChanged: (value){}),
                            ],
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
                ),
              )
              )
          ),
        )
    );
  }
}
