import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/images/images.dart';

class OrgEduFeed extends StatelessWidget {
  const OrgEduFeed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List _items = ['1','2','3'];
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
        SizedBox(height:20.h),
        Expanded(
          child: ListView.builder(itemCount:100,itemBuilder: (context,index){
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: CustomCard(context)
            );
          }),
        ),
      ],
    ),
            )));
  }


  Widget CustomCard (BuildContext context){
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0.r),
      ),
      child: InkWell(
        onTap: (){},
        child: Container(
          height:380.h,
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(backgroundImage: AssetImage(tLogo)),
                  SizedBox(width:16.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("SLIIT"),
                      Text("posted 3d ago")
                    ],
                  )
                ],
              ),
              Container(
                height:200.h,
                decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/edushareflutter-1358a.appspot.com/o/EduShareThumbnail.jpg?alt=media&token=ad43151d-9618-4acb-a020-e5c4dbbad71f"))
                )
              ),
              SizedBox(height: 20.h),
              Text("Bsc(hons) in Information Technology sssssssssssssssssssssssssssssssssssssss",style:Theme.of(context).textTheme.titleSmall,overflow: TextOverflow.ellipsis,),
              SizedBox(height: 20.h),
              // Text("The programme is designed for technically focused students who required to develop strong professional & academic capabilities in programming. You will develop strong technical skills in the areas of software design and software engineering, operating systems, systems administration and technical support, and networking.", overflow: TextOverflow.ellipsis,maxLines: 4,)
           Divider(height: 1,color: Colors.black26),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton.icon(onPressed: (){},icon: Icon(Icons.edit) ,label:Text("Edit")),
                  TextButton.icon(onPressed: (){},icon: Icon(Icons.delete) ,label:Text("Delete")),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
