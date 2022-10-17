import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrgEduFeed extends StatelessWidget {
  const OrgEduFeed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _searchController = TextEditingController();
    return Scaffold(
      drawer: Text("drawer"),
        body: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
      children: [
        TextField(
          controller: _searchController,
          decoration:InputDecoration(
              labelText: "Search",
            hintText: "Post Title",
            prefixIcon: Icon(Icons.search),
            suffixIcon: IconButton(onPressed: _searchController.clear, icon: Icon(Icons.clear)),


          )
        ),
        
      ],
    ),
            )));
  }
}
