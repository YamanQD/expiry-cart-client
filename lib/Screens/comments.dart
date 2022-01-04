import 'package:expiry_cart/Style/constant.dart';
import 'package:flutter/material.dart';

class Comments extends StatefulWidget {
  final String title;

  const Comments({Key key, @required this.title}) : super(key: key);

  @override
  State<Comments> createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  Widget createComment({owner, comment}) {
    // return  Row(
    //   children: [
    //
    //     Container(
    //      padding : const EdgeInsets.all(20.0),
    //      child :    Text('$owner : ' , style: TextStyle(fontSize: 15))
    //     ),
    //    Container(
    //      color: Color(0xff77b234),
    //        padding :const EdgeInsets.all(20.0),
    //      child : Text('$comment' , style: TextStyle(fontSize: 20)),
    //        ),
    //   ],
    // );
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

  String comment = '';
  List<Widget> comments = [];
  void addComment(String comment) {
    setState(() {
      comments.add(createComment(owner: ' yo ', comment: comment));
      print(comments.length);
    });
  }

  Widget buildCommentList() {
    //return ListView.builder(
    // itemBuilder: (context, index){
    //    return buildCommentItem(comments[index]);
    // }
    return ListView.builder(
        itemCount: comments.length,
        itemBuilder: (context, index) {
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
                  onFieldSubmitted: (String SubmittedStr) {
                    comment = SubmittedStr;
                    buildCommentItem(SubmittedStr);

                    addComment(SubmittedStr);
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: kGreenLightColor,
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.send, color: kGreenColor),
                      onPressed: () {
                        addComment(comment);
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
