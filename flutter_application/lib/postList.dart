import 'package:flutter/material.dart';
import 'post.dart';

class PostList extends StatefulWidget {
  final List<Post> listItems;

  const PostList(this.listItems, {super.key});

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  void like(Function callBack) {
    setState(() {
      callBack();
    });
  }

  void disLike(Function callBack) {
    setState(() {
      callBack();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: widget.listItems.length,
      itemBuilder: (context, index) {
        Post post = widget.listItems[index];
        
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Post content and author
                ListTile(title: Text(post.body), subtitle: Text(post.author),),
                const SizedBox(height: 4),
                
                // Like and dislike buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Number of Likes
                    Row(children: [Text(post.likes.toString(), style: const TextStyle(fontSize: 12)),
                        IconButton(
                          onPressed: () => like(post.hasLikedPost),
                          icon: const Icon(Icons.thumb_up),
                          tooltip: 'Like',
                          hoverColor: const Color.fromARGB(255, 176, 228, 252),
                          color: post.userLiked ? Colors.blue : Colors.grey,
                        ),
                      ],
                    ),

                    const SizedBox(width: 16), // Space between buttons

                    // Number of Dislikes
                    Row(children: [
                        Text(post.dislikes.toString(), style: const TextStyle(fontSize: 12)),
                        IconButton(
                          onPressed: () => disLike(post.hasDislikedPost),
                          icon: const Icon(Icons.thumb_down),
                          tooltip: 'Dislike',
                          hoverColor: const Color.fromARGB(255, 255, 108, 108),
                          color: post.userDisliked ? Colors.red : Colors.grey,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}





