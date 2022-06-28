class DailyUpdateModel {
  int? id;
  int? userId;
  String? title;
  String? description;
  String? projectId;
  String? acknowledgedAt;

  DailyUpdateModel(
      {this.id,
      this.acknowledgedAt,
      this.description,
      this.projectId,
      this.userId,
      this.title});


  DailyUpdateModel.fromJson(Map<String, dynamic> json) { //!fromJson is a named constructor
    id = json['id'];
    userId = json['user_id'];
    title = json['title'];
    description = json['description'];
    projectId = json['project_id'];
    acknowledgedAt = json['acknowledge_at'];
  }
}
