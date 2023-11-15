// event-screen for the application
// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:healthotech/utils/constants.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({super.key});

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  final _stream =
      FirebaseFirestore.instance.collection('event-collection').snapshots();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final Uri emailUri =
              Uri(scheme: 'mailto', path: 'healthotech@vitbhopal.ac.in');
          launchUrl(emailUri);
        },
        shape: const CircleBorder(),
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.email_rounded,
          color: Color.fromARGB(255, 0, 70, 113),
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_rounded)),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Column(
          children: [
            Text(
              'EVENTS FROM',
              style: TextStyle(
                  fontFamily: 'Gotham',
                  fontWeight: FontWeight.w300,
                  fontSize: height / 60),
            ),
            Text(
              'HEALTH O TECH',
              style: TextStyle(
                  fontFamily: 'Gotham',
                  fontWeight: FontWeight.w500,
                  fontSize: height / 60),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: StreamBuilder<QuerySnapshot>(
            stream: _stream,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text("There has been some error");
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              var documents = snapshot.data!.docs;
              return ListView.builder(
                  itemCount: documents.length,
                  itemBuilder: (BuildContext context, int index) {
                    var document = documents[index];
                    return Padding(
                      padding: EdgeInsets.all(height / 150),
                      child: Container(
                          height: height / 4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(height / 50),
                              gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.white,
                                    Colors.white,
                                    Colors.white,
                                    Colors.white,
                                    Color.fromARGB(255, 211, 211, 211),
                                    Color.fromARGB(255, 174, 174, 174),
                                    Color.fromARGB(255, 147, 147, 147)
                                  ]),
                              image: DecorationImage(
                                  image: NetworkImage(document['img']),
                                  fit: BoxFit.cover)),
                          child: Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width / 20),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    document['name'],
                                    style: TextStyle(
                                        fontFamily: "Gotham",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: height / 40),
                                  ),
                                  SizedBox(
                                    height: height / 15,
                                    child: Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            final Uri url =
                                                Uri.parse(document['link']);
                                            launchUrl(url,
                                                mode: LaunchMode
                                                    .externalApplication);
                                          },
                                          child: Image.asset(
                                            ImageAssetManager.instagram,
                                            height: height / 20,
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () async {
                                            final urlpreview = document['link'];
                                            await Share.share(
                                                "Check out this event by Health-O-Tech \n$urlpreview");
                                          },
                                          child: CircleAvatar(
                                            radius: height / 50,
                                            backgroundColor: Colors.white,
                                            child: const Icon(Icons.share),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )),
                    );
                  });
            }),
      ),
    );
  }
}
