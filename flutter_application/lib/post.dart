

class Post {
  String body;
  String author;
  int likes = 0;
  int dislikes = 0;
  bool userLiked = false;
  bool userDisliked = false;

  Post(this.body, this.author);

  void hasLikedPost() {
    likes = userLiked ? likes -=1 : likes +=1;
    if (userDisliked) {
      dislikes -= 1;
      userDisliked = false;
    }
    userLiked = !userLiked;
  }

  void hasDislikedPost() {
    dislikes = userDisliked ? dislikes -=1 : dislikes +=1;
    if (userLiked) {
      likes -= 1;
      userLiked = false;
    }
    userDisliked = !userDisliked;
  }
}
