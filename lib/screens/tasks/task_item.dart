import 'package:flutter/material.dart';
import '../../models/task_model.dart';
import '../../shared/styles/colors.dart';

class TaskItem extends StatelessWidget {
TaskModel task;
TaskItem(this.task,{super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12,
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Colors.transparent)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              height: 80,
              width: 8,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Colors.blue),
              ),
            ),
            SizedBox(width: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(task.title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),),
                Text(task.description, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300, color: Colors.black54),),
              ],
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.only(right: 12),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 2),
              decoration: BoxDecoration(color: primary, borderRadius: BorderRadius.circular(12) ),
              child: Icon(Icons.done, color: Colors.white,size: 30),
            )
          ],
        ),
      ),
    );
  }
}
