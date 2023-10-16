import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo/screens/tasks/task_item.dart';
import '../../models/task_model.dart';
import '../../shared/styles/colors.dart';
import '../../shared/network/firebase/firebase_manager.dart';

class TasksTab extends StatefulWidget {
  @override
  State<TasksTab> createState() => _TasksTabState();
}

class _TasksTabState extends State<TasksTab> {
  // const TasksTab({super.key});
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalendarTimeline(
          initialDate: selectedDate,
          firstDate: DateTime.now().subtract(Duration(days: 700)),
          lastDate: DateTime.now().add(Duration(days: 700)),
          onDateSelected: (date) {
            selectedDate = date;
            setState(()
            {

            });
          },
          leftMargin: 20,
          monthColor: primary,
          dayColor: Colors.black45,
          activeDayColor: Colors.white,
          activeBackgroundDayColor: primary,
          dotsColor: Colors.white,
          selectableDayPredicate: (date) => true,
          locale: 'en_ISO',
        ),
        Expanded(
          child: StreamBuilder<QuerySnapshot<TaskModel>>(
            stream: FireBaseManager.getTasks(selectedDate), builder: (context, snapshot) {
                if(snapshot.connectionState== ConnectionState.waiting){
                  return const Center(child: CircularProgressIndicator());
                }
                if(snapshot.hasError){
                  return Text('Something went Wrong');
                }

                var tasks = snapshot.data?.docs.map((doc) => doc.data()).toList()??[];
                return ListView.builder(itemBuilder: (context, index) {
                  return TaskItem(tasks[index]);
                },itemCount: tasks.length,);
          },),
        )
      ],
    );
  }
}
