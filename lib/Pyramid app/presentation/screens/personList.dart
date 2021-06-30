import 'package:appoint_part/Pyramid%20app/Data/patientList.dart';
import 'package:appoint_part/Pyramid%20app/presentation/widgets/backButton.dart';
import 'package:appoint_part/Pyramid%20app/presentation/widgets/search.dart';
import 'package:flutter/material.dart';

class PersonList extends StatefulWidget {
  PersonList({@required this.title});

  final String title;

  @override
  _PersonListState createState() => _PersonListState();
}

class _PersonListState extends State<PersonList> {
  //List<Patient> patients;

  var pat;
  String query = '';

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Back(),
        title:Text('Choose Patient',
          style: TextStyle(
            color: Color(0xff1a1a1a),
            fontSize: height*0.025,
            fontFamily: "Mont",
            fontWeight: FontWeight.w700,
          ),),
        elevation:1,
        actions: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(right:width*0.04),
              child: Text('+Add Patient',
                style: TextStyle(
                  color: Color(0xff2ba7d5),
                  fontSize: height*0.02,
                  fontFamily: "Mont",
                ),),
            ),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(left:width*0.08, right:width*0.08, top:height*0.03,),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: height*0.02),
                child: Search(text: query,
                  hintText: 'Search for a patient',
                  onChanged: searchPatient,),
              ),
              /*pat!= null?
              Expanded(
                child: ListView.builder(
                  physics: AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: pat.length,
                  itemBuilder: (BuildContext context, int index) {

                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('/calendar',arguments: {'patient': pat},);
                      },
                      child: ListTile(
                        title: Text(pat.name,
                            style: TextStyle(fontWeight: FontWeight.w700,),
                        ),
                      ),
                    );
                  },
                )
              ):*/
              Expanded(
                  child: ListView.builder(
                    physics: AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: patients.length,
                    itemBuilder: (BuildContext context, int index) {
                      Patient patient=patients[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('/calendar',arguments: {'patient': patient},);
                          setState(() {
                          });
                        },
                        child: ListTile(
                          title: Text(patient.name,
                            style: TextStyle(fontWeight: FontWeight.w700,),
                          ),
                        ),
                      );
                    },
                  )
              ),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  void searchPatient(String query) {
    final p = (patients.where((patient) {
      final titleLower = patient.name.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower);
    })).toList();

    setState(() {
      this.query = query;
      this.pat= p;
    });
  }
}

