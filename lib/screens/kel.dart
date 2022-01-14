import 'package:flutter/material.dart';

import 'home.dart';

class Kel extends StatelessWidget {
  const Kel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anggota Kelompok 10'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
              icon: const Icon(Icons.home, color: Colors.white))
        ],
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 80,
            ),
            child: Column(
              children: [
                Center(
                  child: Image.asset(
                    'res/takagi.png',
                    width: 179,
                    height: 240,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    children: [
                      const Card(
                        child: ListTile(
                          title: Text('Dimas Seto Rizky Goenardi'),
                          subtitle: Text('21120119130051'),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://static.wikia.nocookie.net/karakai-jouzu-no-takagi-san/images/a/ab/Episode_1_Screenshot_3.png/revision/latest/top-crop/width/360/height/450?cb=20180514055609'),
                          ),
                        ),
                      ),
                      const Card(
                        child: ListTile(
                          title: Text('Ilyasa Aliadjrun'),
                          subtitle: Text('21120119130058'),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://static.wikia.nocookie.net/karakai-jouzu-no-takagi-san/images/a/ab/Episode_1_Screenshot_3.png/revision/latest/top-crop/width/360/height/450?cb=20180514055609'),
                          ),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: Text('Ahmad Rafly Pradana'),
                          subtitle: Text('21120119130085'),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://static.wikia.nocookie.net/karakai-jouzu-no-takagi-san/images/a/ab/Episode_1_Screenshot_3.png/revision/latest/top-crop/width/360/height/450?cb=20180514055609'),
                          ),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: Text('Gunawan Prasetya'),
                          subtitle: Text('21120119120025'),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://static.wikia.nocookie.net/karakai-jouzu-no-takagi-san/images/a/ab/Episode_1_Screenshot_3.png/revision/latest/top-crop/width/360/height/450?cb=20180514055609'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
