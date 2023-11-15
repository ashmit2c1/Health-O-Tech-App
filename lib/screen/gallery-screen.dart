// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  final _stream =
      FirebaseFirestore.instance.collection('gallery-collection').snapshots();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
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
              'GALLERY',
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
                      padding: EdgeInsets.only(top: height / 80),
                      child: Container(
                        height: height / 2,
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: width / 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    height: height / 3,
                                    width: width / 2.2,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(height / 60),
                                        gradient: const LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              Colors.white,
                                              Colors.white,
                                              Colors.white,
                                              Colors.white,
                                              Color.fromARGB(
                                                  255, 211, 211, 211),
                                              Color.fromARGB(
                                                  255, 174, 174, 174),
                                              Color.fromARGB(255, 147, 147, 147)
                                            ]),
                                        image: DecorationImage(
                                            image:
                                                NetworkImage(document['img1']),
                                            fit: BoxFit.cover)),
                                  ),
                                  SizedBox(
                                    height: height / 55,
                                  ),
                                  Container(
                                    height: height / 7,
                                    width: width / 2.2,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(height / 60),
                                        gradient: const LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              Colors.white,
                                              Colors.white,
                                              Colors.white,
                                              Colors.white,
                                              Color.fromARGB(
                                                  255, 211, 211, 211),
                                              Color.fromARGB(
                                                  255, 174, 174, 174),
                                              Color.fromARGB(255, 147, 147, 147)
                                            ]),
                                        image: DecorationImage(
                                            image:
                                                NetworkImage(document['img2']),
                                            fit: BoxFit.cover)),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    height: height / 4.3,
                                    width: width / 2.2,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(height / 60),
                                        gradient: const LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              Colors.white,
                                              Colors.white,
                                              Colors.white,
                                              Colors.white,
                                              Color.fromARGB(
                                                  255, 211, 211, 211),
                                              Color.fromARGB(
                                                  255, 174, 174, 174),
                                              Color.fromARGB(255, 147, 147, 147)
                                            ]),
                                        image: DecorationImage(
                                            image:
                                                NetworkImage(document['img3']),
                                            fit: BoxFit.cover)),
                                  ),
                                  SizedBox(
                                    height: height / 60,
                                  ),
                                  Container(
                                    height: height / 4.3,
                                    width: width / 2.2,
                                    decoration: BoxDecoration(
                                        gradient: const LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              Colors.white,
                                              Colors.white,
                                              Colors.white,
                                              Colors.white,
                                              Color.fromARGB(
                                                  255, 211, 211, 211),
                                              Color.fromARGB(
                                                  255, 174, 174, 174),
                                              Color.fromARGB(255, 147, 147, 147)
                                            ]),
                                        borderRadius:
                                            BorderRadius.circular(height / 60),
                                        image: DecorationImage(
                                            image:
                                                NetworkImage(document['img4']),
                                            fit: BoxFit.cover)),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            }),
      ),
    );
  }
}
