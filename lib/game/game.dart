import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:lira_bar/variables/mainvariables.dart';

class game extends StatefulWidget {
  const game({super.key});
  @override
  State<game> createState() => _game();
}

class _game extends State<game> {
  late VideoPlayerController _videocontroller;
  ValueNotifier<int> cdur = ValueNotifier(0);
  load() async{
    setState(() {
      showbar = true;
      loaded = false;
      shooting = false;
      dead = false;
      bullet = 0;
      red = random.nextInt(6);
      hand = random.nextInt(3);
    });
    await _videocontroller.seekTo(Duration(minutes: 0,seconds: 0));
    await _videocontroller.play();
    if (cdur.value == 5)
     setState(() {
      loaded = true;
    });
    await _videocontroller.pause();
  }
  shootblank() async{
    setState((){
      shooting = true;
    });
    await _videocontroller.seekTo(Duration(minutes: 0,seconds: 12));
    await _videocontroller.play();
    if (cdur.value == 13)
     setState(() {
      shooting = false;
     });
    await _videocontroller.pause();
  }
  shootbullet() async{
    setState(() {
      shooting = true;
    });
    await _videocontroller.seekTo(Duration(minutes: 0,seconds: 19));
    await _videocontroller.play();
    if (cdur.value == 21)
    setState(() {
      shooting = false;
      dead = true;
    });
    await _videocontroller.pause();
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      showbar = false;
    });
  }
  roulette() {
    if (bullet == red) {
      shootbullet();
    }
    else {
      shootblank();
      setState(() {
        bullet++;
      });
      handpick();
    }
  }

  Widget death() {
    return TweenAnimationBuilder(
        tween: ColorTween(begin: Colors.transparent, end: Colors.red[900]),
        duration: Duration(seconds: 2),
        builder: (context, color, child) {
          return Container(
              width: MediaQuery.of(context).size.width ,
              height: MediaQuery.of(context).size.height,
              color: color,
              child: Center(child:
              Stack(
                  children: [
                    Align(
                        alignment: Alignment.center,
                        child: Column(
                            children: [
                              Spacer(),
                              Text(bullet+1 == 1 ?"Allah rahmet eylesin ben" : bullet+1 >= 5 ? "EŞŞŞŞEKRAY" : "You died on bullet number ${bullet+1}",style: TextStyle(fontSize: 30),),
                              IconButton(onPressed: load, icon: Icon(Icons.restart_alt_outlined,size: 64,color: Colors.black,)),
                              Spacer()
                            ])),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: SizedBox(
                            height: 128,
                            width: 128,
                            child:Image(image: deathphotos[bullet])
                        )),
                  ]),
              )
          );
        }
    );

  }
  Widget handpick() {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: 1),
      duration: const Duration(seconds: 5),
      builder: (BuildContext context, value, child) {
        bool pickhand = value >= 1.0;
        return Container(
          width: 15,
          height: 30,
          alignment: Alignment.center,
          child: Column(
            children: [
              if (!pickhand)
                Image(image: handphotos[hand]),
              SizedBox(height: 15),
              if (!pickhand)
                Text(
                  "${handphotos[hand].assetName} Hand",
                  style: TextStyle(fontSize: 34, color: Colors.red[950]),
                ),
            ],
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _videocontroller.addListener(() {
      final position = _videocontroller.value.position;
      cdur.value = position.inSeconds;
    });
    _videocontroller = VideoPlayerController.asset("assets/weapon/revolver.mp4")
      ..initialize().then((_) {
        setState(() {});
    });
    load();
  }
  @override
  void dispose() {
    super.dispose();
    _videocontroller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _videocontroller.value.isInitialized
          ? Stack(
        children: [
          SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: _videocontroller.value.size.width,
                  height: _videocontroller.value.size.height,
                  child: VideoPlayer(_videocontroller),
                ),
              )
          ),
          if (showbar)
            Align(
              alignment: Alignment.topRight,
              child: Container(color: Colors.black,height: 700,width: 80,),
            ),
          Align(
            alignment: Alignment.bottomRight,
            child: SizedBox(
              height: 128,
              width: 128,
              child: Image(image: photos[bullet]),
            ),
          ),
          if (loaded && !shooting && !dead)
            Positioned(
              top: MediaQuery.of(context).size.height * 0.49,
              left: MediaQuery.of(context).size.width * 0.38,
              child: GestureDetector(
                onDoubleTap: roulette,
                child: Icon(Icons.casino_outlined, size: 80, color: Colors.transparent),
              ),
            ),
          if (dead) death(),
        ],
      )
          : const Center(child: CircularProgressIndicator()),
    );

  }
}