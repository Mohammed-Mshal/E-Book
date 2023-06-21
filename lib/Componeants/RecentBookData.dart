import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_project/Pages/DescriptionBook.dart';

class RecentBookData extends StatefulWidget {
  const RecentBookData({
    Key? key,
  }) : super(key: key);
  @override
  _RecentBookData createState() => _RecentBookData();
}

class _RecentBookData extends State<RecentBookData> {
  List<dynamic> books = [];

  getShortInfoBook() async {
    final response =
        await http.get(Uri.parse("https://www.dbooks.org/api/recent"));
    if (response.statusCode == 200) {
      var data = await jsonDecode(response.body);
      setState(() {
        books = data["books"];
      });
    } else {
      throw Exception('${response.statusCode}');
    }
  }

  @override
  void initState() {
    super.initState();
    getShortInfoBook();
  }

  Widget build(BuildContext context) {
    return books.isNotEmpty
        ? ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: books.length,
            itemBuilder: (context, index) {
              final title = books[index]!["title"];
              final image = books[index]!["image"];
              final id = books[index]!["id"];

              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  shadowColor: Colors.transparent,
                  elevation: 0,
                  onSurface: Colors.transparent,
                  fixedSize: const Size(150, 150),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DescriptionBook(
                                id: id,
                              )));
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 121.66,
                      height: 180.5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                              image: NetworkImage(image),
                              fit: BoxFit.cover)
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18.0,
                        overflow: TextOverflow.ellipsis,
                        color: Colors.black45,
                      ),
                    ),
                  ],
                ),
              );
            },
          )
        : const Center(
            child: CircularProgressIndicator(),
          );
  }
}
