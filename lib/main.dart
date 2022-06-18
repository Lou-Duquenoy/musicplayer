import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'player_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music player',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const MyAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children:  [
            const HeaderSection(),
            PlayListSection(),
          ],
        ),
      ),
      bottomNavigationBar: const BottomSection(),
    );
  }
}

class BottomSection extends StatelessWidget {
  const BottomSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.blue,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.pause,
            color: Colors.white,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Text(
            "N95 . Kendrick Lamar",
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.arrow_circle_up,
            color: Colors.white,
          ),
          label: '',
        ),
      ],
    );
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      decoration: const BoxDecoration(
        color: Colors.red,
        image: DecorationImage(
          image: AssetImage('images/kendrick.jpg'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 20,
            bottom: 30,
            child: Text(
              'Kendrick Lamar',
              style: GoogleFonts.arizonia(
                color: Colors.white,
                fontSize: 43,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 20,
            child: MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PlayerPage(),
                  ),
                );
              },
              color: Colors.blue,
              shape: const CircleBorder(),
              child: const Padding(
                padding: EdgeInsets.all(17),
                child: Icon(
                  Icons.play_arrow_rounded,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class PlayListSection extends StatelessWidget {
  final List playList = [
    {
      'title': 'N95',
      'played': true,
      'duration': '3:15',
    },
    {
      'title': 'Die Hard',
      'played': false,
      'duration': '3:59',
    },
    {
      'title': 'United In Grief',
      'played': true,
      'duration': '4:15',
    },
    {
      'title': 'Father Time',
      'played': true,
      'duration': '3:42',
    },
    {
      'title': 'Rich Spirit',
      'played': true,
      'duration': '3:22',
    },
    {
      'title': 'WorldWide Steppers',
      'played': true,
      'duration': '3:23',
    },
    {
      'title': 'The Heart Part 5',
      'played': true,
      'duration': '5:32',
    },
    {
      'title': 'Silent Hill',
      'played': true,
      'duration': '3:40',
    },
    {
      'title': 'We Cry Togepher',
      'played': true,
      'duration': '5:41',
    },
    {
      'title': 'Count Me Out',
      'played': true,
      'duration': '4:43',
    },
  ];

  PlayListSection({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(30, 40, 20, 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Popular',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 10),
                child: const Text(
                  'Show all',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.blue,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          Column(
            children: playList.map((song) {
              return SizedBox(
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      song['title'],
                      style: TextStyle(
                        color: song['played'] ? Colors.blue : Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          song['duration'],
                          style: TextStyle(
                            color: song['played'] ? Colors.blue : Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Icon(
                          Icons.more_vert,
                          color: song['played'] ? Colors.blue : Colors.grey,
                        )
                      ],
                    )
                  ],
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: const IconButton(
        icon: Icon(
          Icons.menu,
          color: Colors.white,
          size: 25,
        ),
        onPressed: null,
      ),
      actions: const [
        IconButton(
          icon: Icon(
            Icons.more_vert,
            color: Colors.white,
            size: 25,
          ),
          onPressed: null,
        ),
      ],
      backgroundColor: Colors.white.withOpacity(0),
    );
  }
}
