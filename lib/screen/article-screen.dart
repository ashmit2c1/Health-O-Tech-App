// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:healthotech/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({super.key});

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  final _stream =
      FirebaseFirestore.instance.collection('article-collection').snapshots();
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
              'ARTICLES FROM',
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
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: height / 10,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(height / 50),
                            image: const DecorationImage(
                                image: AssetImage(ImageAssetManager.container),
                                fit: BoxFit.cover)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: width / 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: height / 80),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      document['title-1'],
                                      style: TextStyle(
                                          fontFamily: 'Gotham',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: height / 42),
                                    ),
                                    Text(
                                      document['title-2'],
                                      style: TextStyle(
                                          fontFamily: 'Gotham',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: height / 42),
                                    )
                                  ],
                                ),
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                child: IconButton(
                                    onPressed: () async {
                                      final Uri url =
                                          Uri.parse(document['link']);
                                      launchUrl(url,
                                          mode: LaunchMode.externalApplication);
                                    },
                                    icon: const Icon(
                                      Icons.arrow_forward,
                                      color: Colors.black,
                                    )),
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
