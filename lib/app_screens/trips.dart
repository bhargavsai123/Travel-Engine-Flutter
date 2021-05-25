import 'dart:math';

import 'package:bruh_123/app_screens/profile.dart';
import 'package:bruh_123/app_screens/trip_details.dart';
import 'package:bruh_123/app_screens/welcome.dart';
import 'package:bruh_123/components/buttons/rounded_button.dart';
import 'package:bruh_123/components/custom_input.dart';
import 'package:bruh_123/components/gap.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';

// ignore: use_key_in_widget_constructors
class TripsScreen extends StatefulWidget {
  @override
  _TripsScreenState createState() => _TripsScreenState();
}

class _TripsScreenState extends State<TripsScreen> {
  final List<String> entries = <String>[
    'Trip A',
    'Trip B',
    'Trip C',
    'Trip D',
    'Trip E',
    'Trip F'
  ];
  final List<String> images = <String>[
    "https://media.timeout.com/images/105762050/630/472/image.jpg",
    'https://img2.oastatic.com/img2/50562766/max/t.jpg',
    'https://images.wsj.net/im-196106?width=1280&size=1',
    "https://media.timeout.com/images/105762050/630/472/image.jpg",
    'https://img2.oastatic.com/img2/50562766/max/t.jpg',
    'https://images.wsj.net/im-196106?width=1280&size=1',
  ];

  var budget = TextEditingController();

  var loc = TextEditingController();

  var trip = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      drawerScrimColor: Colors.transparent,
      drawer: Drawer(
        elevation: 0.0,
        child: Container(
          color: Colors.orange[50],
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileScreen(),
                      ),
                    ),
                    child: Row(
                      children: [
                        Hero(
                          tag: "User",
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor: kAccentColor,
                            backgroundImage: const NetworkImage(
                                "https://cdn.dribbble.com/users/29574/screenshots/4826855/avatar_-_og_-_dribbble.png?compress=1&resize=400x300"),
                          ),
                          transitionOnUserGestures: true,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "User Name",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  color: kAccentColor,
                                ),
                              ),
                              const SizedBox(
                                height: 1,
                              ),
                              Text(
                                "Email ID",
                                style: TextStyle(
                                  fontSize: 15.0,
                                  color: kAccentColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const DrawerDivider(),
                Flexible(
                  child: SizedBox(
                    height: size.height,
                  ),
                ),
                const DrawerDivider(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 5.0),
                  child: Theme(
                    data: ThemeData(
                      splashColor: kAccentColor,
                      textTheme: GoogleFonts.montserratTextTheme(),
                    ),
                    child: Material(
                      color: Colors.orange[50],
                      child: ListTile(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(25.0),
                          ),
                        ),
                        leading: Transform.rotate(
                          angle: pi,
                          child: Icon(
                            Icons.logout_rounded,
                            color: kAccentColor,
                          ),
                        ),
                        title: Text(
                          "Log Out",
                          style: TextStyle(
                            fontSize: 15.0,
                            color: kAccentColor,
                          ),
                        ),
                        onTap: () {
                          Future.delayed(const Duration(milliseconds: 200), () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WelcomeScreen(),
                              ),
                            );
                          });
                        },
                      ),
                    ),
                  ),
                ),
                const Gap(),
              ],
            ),
          ),
        ),
      ),
      body: Builder(
        builder: (context) => Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SafeArea(
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Scaffold.of(context).openDrawer();
                      },
                      child: const Icon(
                        Icons.menu_rounded,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      "Trips",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 24.0,
                    )
                  ],
                ),
              ),
            ),
            Flexible(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  ),
                ),
                child: ListView.builder(
                  padding: const EdgeInsets.only(bottom: 60),
                  addRepaintBoundaries: false,
                  scrollDirection: Axis.vertical,
                  itemCount: entries.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: buildCard(entries, images, index),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0.0,
        child: const Icon(
          Icons.add_rounded,
          color: Colors.white,
        ),
        backgroundColor: kAccentColor,
        splashColor: Colors.white,
        onPressed: () {
          showModalBottomSheet(
              backgroundColor: kAccentColor,
              barrierColor: kAccentLightColor,
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(25.0),
                ),
              ),
              context: context,
              builder: (context) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: MediaQuery.of(context).viewInsets,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                            width: size.width * 0.1,
                            height: 5,
                            decoration: BoxDecoration(
                              color: kAccentLightColor,
                              borderRadius: BorderRadius.circular(29.0),
                            ),
                          ),
                        ),
                        Text(
                          "New Trip",
                          style: TextStyle(
                            color: kAccentLightColor,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Gap(),
                        CustomInput(
                          label: "Trip Name",
                          icon: Icons.location_city_rounded,
                          password: false,
                          textColor: kAccentLightColor,
                          keyboardType: TextInputType.name,
                          controller: trip,
                        ),
                        // CustomInput(
                        //   label: "Duration",
                        //   icon: Icons.access_time,
                        //   password: false,
                        //   textColor: kAccentLightColor,
                        //   keyboardType: TextInputType.datetime,
                        //   controller: duration,
                        // ),
                        InputDatePickerFormField(
                          firstDate: DateTime(DateTime.now().year - 5),
                          lastDate: DateTime(DateTime.now().year + 5),
                          initialDate: DateTime.now(),
                          fieldLabelText: "Date",
                        ),
                        CustomInput(
                          label: "Location",
                          icon: Icons.location_on_rounded,
                          password: false,
                          textColor: kAccentLightColor,
                          keyboardType: TextInputType.streetAddress,
                          controller: loc,
                        ),
                        CustomInput(
                          label: "Budget",
                          icon: Icons.attach_money_outlined,
                          password: false,
                          textColor: kAccentLightColor,
                          keyboardType: TextInputType.number,
                          controller: budget,
                        ),
                        const Gap(),
                        RoundedButton(
                          text: "Create Trip",
                          press: () {},
                          color: kAccentLightColor,
                          textColor: kAccentColor,
                          splash: kAccentLightColor,
                        ),
                        const Gap(),
                      ],
                    ),
                  ),
                );
              });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Card buildCard(entries, images, index) {
    Size size = MediaQuery.of(context).size;
    return Card(
      margin: const EdgeInsets.fromLTRB(5.0, 15.0, 5.0, 15.0),
      color: Colors.white,
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  DetailsScreen(entries: entries, index: index),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.network(
                  images[index],
                  width: size.width,
                  height: size.height * 0.2,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 5, 0, 15),
                  child: Column(
                    children: [
                      Text(
                        entries[index],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: kPrimaryDarkColor,
                        ),
                      ),
                      Text(
                        "Duration",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13.0,
                          color: kPrimaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(5, 0, 15, 10),
                  child: Text(
                    "Budget",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: kAccentColor,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class DrawerDivider extends StatelessWidget {
  const DrawerDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1,
      indent: 20,
      endIndent: 20,
      color: kAccentColor,
    );
  }
}
