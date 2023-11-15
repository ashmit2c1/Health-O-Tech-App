// ignore_for_file: file_names

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:healthotech/components/listen-to-spotify.dart';
import 'package:healthotech/screen/marquee-text.dart';
import 'package:healthotech/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

class PlayPodcastScreen extends StatefulWidget {
  const PlayPodcastScreen({super.key});

  @override
  State<PlayPodcastScreen> createState() => _PlayPodcastScreenState();
}

class _PlayPodcastScreenState extends State<PlayPodcastScreen> {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  @override
  void initState() {
    super.initState();
    setAudio();
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });
    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer.dispose();
  }

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
              'PLAYING FROM',
              style: TextStyle(
                  fontFamily: 'Gotham',
                  fontWeight: FontWeight.w300,
                  fontSize: height / 60),
            ),
            Text(
              'HEALTH O TECH (H.O.T) Talks',
              style: TextStyle(
                  fontFamily: 'Gotham',
                  fontWeight: FontWeight.w500,
                  fontSize: height / 60),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: height / 2.3,
                  width: width / 1.1,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(height / 50),
                      image: const DecorationImage(
                          image: AssetImage(ImageAssetManager.podcastImage),
                          fit: BoxFit.fitWidth)),
                ),
              ),
              SizedBox(
                height: height / 100,
              ),
              const MarqueeText(),
              Center(
                child: Text(
                  "Dr. Rajiv Kumar Jain",
                  style: TextStyle(
                      fontFamily: "Gotham",
                      fontWeight: FontWeight.w300,
                      fontSize: height / 55),
                ),
              ),
              Slider(
                  activeColor: const Color.fromARGB(255, 0, 70, 113),
                  min: 0,
                  max: duration.inSeconds.toDouble(),
                  value: position.inSeconds.toDouble(),
                  onChanged: (value) async {
                    final position = Duration(seconds: value.toInt());
                    await audioPlayer.seek(position);
                    await audioPlayer.resume();
                  }),
              Row(
                children: [
                  SizedBox(
                    width: width / 2.5,
                  ),
                  CircleAvatar(
                    backgroundColor: const Color.fromARGB(255, 0, 70, 113),
                    radius: height / 20,
                    child: IconButton(
                      icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow,
                          color: Colors.white, size: height / 15),
                      onPressed: () async {
                        if (isPlaying) {
                          await audioPlayer.pause();
                        } else {
                          await audioPlayer.resume();
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    width: width / 10,
                  ),
                  IconButton(
                      onPressed: () async {
                        const urlpreview =
                            "https://open.spotify.com/episode/6wjfkvt7x4KCJ43O65b44I?si=56008ac176b14ef8";
                        await Share.share(
                            "Hey check out this podcast by Health O Tech \n$urlpreview");
                      },
                      icon: const Icon(Icons.share))
                ],
              ),
              SizedBox(
                height: height / 40,
              ),
              Center(
                child: Container(
                  height: height / 1.9,
                  width: width / 1.1,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 0, 70, 113),
                      borderRadius: BorderRadius.circular(height / 50)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(left: width / 20, top: height / 50),
                        child: const Text(
                          "About this episode",
                          style: TextStyle(
                              fontFamily: 'Gotham',
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: width / 26, top: height / 50),
                        child: const Text(
                          "In this season finale of our podcast series, our club president, Ms. Shreya Lakhera sits down with ⁠Dr. Rajiv Kumar Jain⁠, a highly experienced Health and Hospital Administrator who has dedicated more than 40 years of their life to improving the quality of healthcare in India. Dr. Jain is a successful doctor and a humble patriot, with the intention to improve the healthcare system in India and make it accessible for all\nHe has a wealth of expertise in Hospital Accreditation, Quality in Health Care, Epidemiology, Child Health, Hospital and Health Care Strategic Planning, Medical Regulation, Infectious Diseases and more.",
                          style: TextStyle(
                              fontFamily: 'Gotham',
                              fontWeight: FontWeight.w300,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height / 50,
              ),
              ListenToSpotifyWidget(
                  function: () {
                    final Uri url = Uri.parse(
                        'https://open.spotify.com/show/7Glk5sOSoRFU90vkZeHJxk?si=67e1bb0d071d4c29');
                    launchUrl(url, mode: LaunchMode.externalApplication);
                  },
                  text: "Listen to our podcasts on ",
                  animationPath: 'assets/lottie/spotify-animation.json'),
              SizedBox(
                height: height / 30,
              ),
            ],
          ),
        ),
      ),
    );
  }

  String formatTime(Duration position) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes);
    final seconds = twoDigits(duration.inSeconds);

    return [if (duration.inHours > 0) hours, minutes, seconds].join(':');
  }

  Future setAudio() async {
    final player = AudioCache(prefix: 'assets/podcast/');
    final url = await player.load('podcast.mp3');
    audioPlayer.setSourceUrl(url.path);
  }
}
