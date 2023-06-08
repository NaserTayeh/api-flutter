class PostRequest {
  String title;
  String body;
  int userId;
  PostRequest(this.title, this.body, this.userId);
  toJson() {
    return {'title': title, 'body': body, 'userId': userId};
  }
}
