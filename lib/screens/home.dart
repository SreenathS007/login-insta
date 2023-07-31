import 'package:flutter/material.dart';
import 'package:login_page/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});

  //Story Image Inserting
  List<String> profileImage = [
    "assets/images/dileep.jpg",
    "assets/images/dq.jpg",
    "assets/images/mammootty.jpg",
    "assets/images/mohanlal.jpg",
    "assets/images/prithvi.jpg",
    "assets/images/surya.jpg",
    "assets/images/vijay.jpg",
    "assets/images/vj sethupathy.jpg",
  ];

  //Post Images
  List<String> posts = [
    "assets/images/One.jpg",
    "assets/images/Two.jpg",
    "assets/images/Three.jpg",
    "assets/images/Four.jpg",
    "assets/images/Five.jpg",
    "assets/images/Six.jpg",
    "assets/images/Seven.jpg",
    "assets/images/Eight.jpg",
  ];

  //Profile Names

List<String> profileNames= [
       "dileepactor",
       "dqsalamaan",
       "mammootty",
       "mohanlal",
       "therealprithvi",
       "actorsurya",
       "actorvijay",
       "actotvijaysethy",


];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Bottom NavigationBar

      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            const Spacer(),
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {},
            ),
            const Spacer(),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            const Spacer(),
            IconButton(
              icon: Icon(Icons.add_box),
              onPressed: () {},
            ),
            const Spacer(),
            IconButton(
              icon: Icon(Icons.slow_motion_video),
              onPressed: () {},
            ),
            const Spacer(),
            IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {},
            ),
          ],
        ),
      ),

      //Top Navigation Bar

      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Image.asset(
          'assets/images/instagram-text-icon.png',
          height: 30,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border_outlined),
            color: Colors.black,
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.chat_bubble_outline),
            color: Colors.black,
            onPressed: () {},
          ),
          IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Are you sure want to Exit?'),
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            signout(context);
                          },
                          child: Text('Yes'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('No'),
                        ),
                      ],
                    );
                  });
            },
            icon: Icon(Icons.exit_to_app),
            color: Colors.black,
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            //STORY PART

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  profileImage.length,
                  (index) => Container(
                    padding: EdgeInsets.all(10.0),
                    child: Center(
                      child: Column(
                        children: [
                          (index  ==index)
                              ? CircleAvatar(
                                  radius: 35,
                                  backgroundImage: AssetImage(
                                    profileImage[index],
                                  ),
                                )
                              : Container(
                                   height: 70,
                                   width: 70,
                                
                                  child: Image.asset(
                                    posts[
                                        index], // Use the correct asset path from the posts list
                                  ),
                                ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "profile name",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            //POST SECTION

            Divider(),
            Column(
              children: List.generate(
                posts.length,
                (index) => Column(
                  children: [
                    //HEADER POST
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          child: CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage(
                              profileImage[index],
                            ),
                          ),
                        ),
                        Text('profile name'),
                        Spacer(),
                        IconButton(
                          icon: Icon(Icons.more_vert),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    //IMAGE POST
                    Image.asset(posts[index]),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  signout(BuildContext ctx) async {
    final _sharedPrefs = await SharedPreferences.getInstance();
    await _sharedPrefs.clear();

    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx1) => ScreenLogin()), (route) => false);
  }
}
