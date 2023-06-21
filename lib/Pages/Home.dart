import 'package:flutter/material.dart';
import 'package:my_project/Componeants/RecentBookData.dart';
import 'package:my_project/Componeants/SeeAlso.dart';
import 'package:my_project/Pages/Search.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePage createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {


  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      //الشريط العلوي
      floatingActionButton:  FloatingActionButton.extended(
          elevation: 8,
          label: const Text('Search'),
          backgroundColor: const Color(0xff1d212b),
          icon: const Icon(Icons.search_sharp),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const Search()
                )
            );
          },

      )
,
      appBar: AppBar(
        backgroundColor: const Color(0xff1d212b),
        centerTitle: true,
        title:  Text("E-Book"),
        //  أضافة زر القائمة
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          //  أضافة زر الاشعارات
          IconButton(onPressed: () {},
              icon: const Icon(Icons.notifications)
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  const [
                Text(
                  "My Book",
                  style: TextStyle(fontSize: 20.0),
                ),
                //وضع فراغ
                SizedBox(
                  height: 12.0,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 250.0,
                  child: RecentBookData(),
                ),
                Text(
                  "See Also",
                  style: TextStyle(fontSize: 20.0),
                ),
                SizedBox(
                  height: 12.0,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 1000.0,
                  child: SeeAlso(),
                )
              ],
            ),
          )
      ),
    );
  }
}
