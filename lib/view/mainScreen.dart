import 'package:flutter/material.dart';
import 'package:meme_generator/controller/fetchMeme.dart';
import 'package:meme_generator/controller/saveMyData.dart';

class mainScreen extends StatefulWidget {
  const mainScreen({super.key});

  @override
  State<mainScreen> createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  String imgUrl = ""; //complete app ka variable

  int? memeNo = 0;

  int targetMeme = 100;

  bool isLoading = true;

  bool isLight = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetInitMemeNo(); //to update ther meme nuumber
    updateImg();
  }

  GetInitMemeNo() async {
    //this method sets the meme number
    memeNo = await saveMyData.fetchData() ??
        0; //await lgake int m convert ans also ??0 checks if null then return 0
    if (memeNo! > 100) {
      targetMeme = 500;
    } else if (memeNo! > 500) {
      targetMeme = 1000;
    }
    setState(
        () {}); //we called this to refresh we can't use async since upr await use hora h
  }

  void updateImg() async {
    String getImgUrl =
        await FetchMeme.fetchNewMeme(); //getImgurl is varibale of the method
    setState(() {
      imgUrl = getImgUrl;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isLight ? Colors.white : Colors.black,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    isLight = !isLight;
                  });
                },
                icon: Icon(isLight ? Icons.dark_mode : Icons.light_mode),
              )
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            "Meme #${memeNo.toString()}",
            style: TextStyle(
                color: isLight ? Colors.black : Colors.white,
                fontSize: 30,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Target ${targetMeme} Memes",
            style: TextStyle(
              color: isLight ? Colors.black : Colors.white,
              fontSize: 30,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          isLoading
              ? Container(
                  height: 400,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: SizedBox(
                        height: 50,
                        width: 50,
                        child: CircularProgressIndicator()),
                  ),
                )
              : Image.network(
                  height: 400,
                  width: MediaQuery.of(context).size.width,
                  imgUrl),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () async {
                // setState(() {
                //   memeNo = memeNo! + 1;
                // });
                await saveMyData.saveData(memeNo! + 1);
                GetInitMemeNo();
                updateImg();
              },
              child: Container(
                  height: 50,
                  width: 150,
                  child: Center(
                      child: Text(
                    "More Fun!!",
                    style: TextStyle(fontSize: 20),
                  )))),
          Spacer(),
          Text(
            "Made with ❤️ by ",
            style: TextStyle(
                color: isLight ? Colors.black : Colors.white, fontSize: 20),
          ),
          Text(
            "Kartik",
            style: TextStyle(
                color: isLight ? Colors.black : Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
        ]),
      ),
    );
  }
}
