class TaskModel{
  String id;
  String title;
  String description;
  int date;
  bool isDone;

  TaskModel({
    this.id ='',
    required this.title,
    required this.description,
    required this.date,
    this.isDone= false
  });

  TaskModel.fromJson(Map<String, dynamic>json)
  :this(id: json['id'],
      isDone: json['isDone'],
      title: json['title'],
      date: json['date'],
      description: json['description']
  );

  // TaskModel fromJson(Map<String, dynamic>json){
  //     id: json['id'];
  //     isDone: json['isDone'];
  //     title: json['title'];
  //     date: json['date'];
  //     description: json['description'];
  // }
Map<String,dynamic>toJson(){
  return
      {
        'id':id,
        'isDone': isDone,
        'title': title,
        'date': date,
        'description': description
      };
}
}