import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:assignmentt_2/models/student.dart';
import 'package:assignmentt_2/screens/input/input.dart';
import 'package:assignmentt_2/screens/profile/profile.dart';

import '../../redux/store.dart';

class Landing extends StatefulWidget {
  static const routeName = '/';
  const Landing({Key? key}) : super(key: key);

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  List<Student> students = [
    Student(name: 'Janani', srn: 'PES2UG21CS455', phoneNo: '9999'),
    Student(name: 'Shruti', srn: 'PES2UG21CS500', phoneNo: '9999'),
    Student(name: 'Samantha', srn: 'PES2UG21CS463', phoneNo: '9999')
  ];

  late BuildContext appStateContext;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (context, state) {
        appStateContext = context;
        return Scaffold(
          body: SafeArea(
            child: Container(
              margin: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.05,
                horizontal: MediaQuery.of(context).size.width * 0.1,
              ),
              width: MediaQuery.of(context).size.width,
              child: ListView(
                children: [
                  Image.asset(
                    'assets/images/PESUIOLogo.jpg',
                    height: MediaQuery.of(context).size.width * 0.5,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  ...state.students!
                      .map(
                    //...students.map(
                        (e) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Profile(
                              name: e.name,
                              srn: e.srn,
                              phoneNo: e.phoneNo,
                            ),
                          ),
                        );
                      },
                      child: ListTile(
                        title: Text(e.name),
                        subtitle: Text(e.srn),
                        trailing: FaIcon(
                          FontAwesomeIcons.user,
                        ),
                      ),
                    ),
                  )
                      .toList(),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              //Navigator.pushNamed(context, Input.routeName);
              Navigator.pushReplacementNamed(context, Input.routeName);
            },
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}

// StoreConnector(
// converter: (store) => store.state,
// builder: (context, state) {
// return ;
// },
// )
