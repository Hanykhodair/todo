import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/shared/network/firebase/firebase_manager.dart';

class AddTaskBottomSheet extends StatefulWidget {

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  var titleController = TextEditingController();

  var descriptionController = TextEditingController();
  var selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Add new task',
          textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
            letterSpacing: 1, fontWeight: FontWeight.w700, fontSize: 25
          ),),
          SizedBox(height: 10,),
          TextFormField(
          controller: titleController,
            decoration: InputDecoration(
              hintText: "Enter Task Title",
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.blue),
              ),
              focusedBorder:  OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Colors.blue),
            ),
          ),),
          SizedBox(height: 20,),
          TextFormField(
            controller: descriptionController,
            decoration: InputDecoration(
              label: Text('Task Description'),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.blue),
              )
            ),
          ),
          SizedBox(height: 18,),
          Text('Select Date',
              style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black
          ),),
          InkWell(
            onTap: () {
              selectDate();
            },
            child: Text(selectedDate.toString().substring(0,10),
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.blue,
              fontWeight: FontWeight.w500,
            ),),
          ),
          SizedBox(height: 18,),
          ElevatedButton(onPressed: () {
            TaskModel task = TaskModel(title: titleController.text,
                description: descriptionController.text,
                date: DateUtils.dateOnly(selectedDate).millisecondsSinceEpoch);
            FireBaseManager.addTask(task).then((value) {
              showDialog(context: context, builder:(context){
                return AlertDialog(
                  title: Text('Success'),
                  content: Text('Task Added Successfully'),
                  actions: [
                    ElevatedButton(onPressed: ()
                {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: Text('Thank You'))
                  ],
                );
              },);
            });

          }, child: Text('Add Task'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
          ),),
        ],
      ),
    );
  }

  selectDate()async{
    DateTime? chosenDate = await showDatePicker(context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (chosenDate == null)
      {
        return;
      }
    selectedDate= chosenDate;
    setState(() {

    });
  }
}
