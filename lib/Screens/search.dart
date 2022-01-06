import 'package:flutter/material.dart';

class SearchView extends StatelessWidget{
  const SearchView({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Colors.white,
      ),
      body: TextFormField(
        onTap: () {

        },
      ),
    );
  }




}