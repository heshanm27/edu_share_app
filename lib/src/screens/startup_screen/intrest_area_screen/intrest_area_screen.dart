import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edu_share_app/src/models/interestArea_model/InterestAreaModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InterestArea extends StatefulWidget {
  const InterestArea({Key? key}) : super(key: key);

  @override
  State<InterestArea> createState() => _InterestAreaState();
}

class _InterestAreaState extends State<InterestArea> {

  Future<List<InterestAreaModel>> GetInterestAres() async{
    List<InterestAreaModel> Areas= [];
    CollectionReference interestAreas = FirebaseFirestore.instance.collection('interestAreas');
    QuerySnapshot querySnapshot = await interestAreas.get();

if(querySnapshot.docs.isEmpty){
   Areas.add(new InterestAreaModel("No Data","No Data"));
  return Areas;
}
    for(var doc in querySnapshot.docs){
      print(doc['name']);
      InterestAreaModel area = new InterestAreaModel(doc['name'],doc['description']);
      Areas.add(area);
    }
    return Areas;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(height: 40.h),
              Text(
                'Choose your Interest Areas',
                style: Theme.of(context).textTheme.headline3
              ),
              SizedBox(height: 20.h),
              Text('This tags will be used for customize app content to your preferences',style: Theme.of(context).textTheme.subtitle1),
              SizedBox(height: 20.h),
             Card(
               elevation: 5,
               shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10) ),
               child: Container(
                 width: double.maxFinite,
                 height:400.h,
                 child: FutureBuilder(
                     future:GetInterestAres(),
                     builder: (context,AsyncSnapshot<List<InterestAreaModel>> snapshot){
                       if(snapshot.hasData){
                         return SingleChildScrollView(
                           scrollDirection: Axis.vertical,
                           child: Padding(
                             padding: EdgeInsets.all(10),
                             child: Wrap(
                               runSpacing: 10,
                               spacing: 10,
                               children:getChipWidget(snapshot.data!) ,
                             ),
                           ),
                         );
                       }

                      return Center(
                         child: CircularProgressIndicator(),
                       );
                 }),
               ),
             ),
              ElevatedButton(onPressed: (){}, child: Text("Done"))
            ],
          ),
        ),
      ),
    );
  }


  List<Widget> getChipWidget(List<InterestAreaModel> list){


    return list.map((e) => Chip(label: Text(e.name))).toList();
  }
}
