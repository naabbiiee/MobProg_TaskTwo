class Model{

  final int id;
  final int userid;
  final String title;
  final bool completed;

  Model({
    required this.id,
    required this.userid,
    required this.title,
    required this.completed});

  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
      id: json['id'],
      userid: json['userid'],
      title: json['title'],
      completed: json['completed'],

    );
  }

}