import 'package:expiry_cart/Style/constant.dart';
import 'package:expiry_cart/models/product.dart';
import 'package:expiry_cart/categories_helper/utils.dart';
import 'package:flutter/material.dart';

class Comments extends StatefulWidget {
  final String title;
  int id;
  List<Comment> commentsList = [];

  Comments(
      {Key key,
      @required this.title,
      @required this.id,
      @required this.commentsList})
      : super(key: key);

  @override
  State<Comments> createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  final commentController = TextEditingController();
  List<Widget> comments = [];

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    widget.commentsList.forEach((element) {
      comments.add(Container(
        child: Row(
          children: [
            Container(
                padding: const EdgeInsets.all(20.0),
                child: Text('${element.owner} : ',
                    style: TextStyle(fontSize: 15))),
            Container(
              //color: Color(0xff77b234),
              // padding :const EdgeInsets.all(20.0),
              child: Text(element.body, style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ));
    });
  }

  Widget createComment({owner, comment}) {
    return Container(
      child: Row(
        children: [
          Container(
              padding: const EdgeInsets.all(20.0),
              child: Text('$owner : ', style: TextStyle(fontSize: 15))),
          Container(
            //color: Color(0xff77b234),
            // padding :const EdgeInsets.all(20.0),
            child: Text('$comment', style: TextStyle(fontSize: 20)),
          ),
        ],
      ),
    );
  }

  Future<bool> addComment(String comment) async {
    if (await Utils.comment(widget.id, comment)) {
      setState(() {
        comments.add(createComment(owner: 'You', comment: comment));
        widget.commentsList.add(Comment(id: 1, body: comment, owner: 'You'));
        print('added!');
      });
      return true;
    }
    return false;
  }

  Widget buildCommentList() {
    //return ListView.builder(
    // itemBuilder: (context, index){
    //    return buildCommentItem(comments[index]);
    // }
    return ListView.builder(
        itemCount: widget.commentsList.length,
        itemBuilder: (context, index) {
          print(widget.commentsList.length.toString());
          return comments[index];
        });
  }

  Widget buildCommentItem(String comment) {
    return ListTile(title: Text(comment));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Comments:', style: kAppBarText),
          iconTheme: const IconThemeData(color: kGreenColor)),
      body: Column(
        children: <Widget>[
          Expanded(child: buildCommentList()),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              width: MediaQuery.of(context).size.width - 15,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 18.0),
                child: TextFormField(
                  controller: commentController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: kGreenLightColor,
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.send, color: kGreenColor),
                      onPressed: () async {
                        if (await addComment(commentController.text)) {
                          buildCommentItem(commentController.text);
                          print(commentController.text);
                          commentController.clear();
                        } else {
                          print('noooo');
                        }
                      },
                    ),
                    contentPadding: const EdgeInsets.all(25.0),
                    hintText: ' Write a comment...',
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
