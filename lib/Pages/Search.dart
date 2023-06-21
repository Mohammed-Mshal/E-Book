import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_project/Pages/DescriptionBook.dart';

class Search extends StatefulWidget {
  const Search({
    Key? key,
  }) : super(key: key);
  @override
  _Search createState() => _Search();
}

class _Search extends State<Search> {
  List<dynamic> booksSearch = [];

  void getSearchingBooks(query) async {
    final response = await http.get(Uri.parse(
        "https://www.dbooks.org/api/search/${query.toString().toLowerCase()}"));
    if (response.statusCode == 200) {
      var data = await jsonDecode(response.body);
      setState(() {
        booksSearch = data["books"];
      });
    } else {
      throw Exception('${response.statusCode}');
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff1d212b),
          centerTitle: true,
          title: const Text("Search"),
          //  أضافة زر القائمة
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
          actions: [
            //  أضافة زر الاشعارات
            IconButton(onPressed: () {}, icon: const Icon(Icons.notifications))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(
                height: 18,
              ),
              //أنشاء مربع البحث
              TextField(
                onSubmitted: (value) {
                  getSearchingBooks(value);
                },
                decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xffe6e6e6),
                    prefixIcon: const Icon(Icons.search),
                    contentPadding: const EdgeInsets.all(8.0),
                    hintText: "Search Your Favorite Book...",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    )),
              ),
              const SizedBox(
                height: 20,
              ),

              Expanded(
                  child: ListView.builder(
                      itemCount: booksSearch.length,
                      itemBuilder: (context, index) {
                        final title = booksSearch[index]!["title"];
                        final image = booksSearch[index]!["image"];
                        final authors = booksSearch[index]!["authors"];
                        final id = booksSearch[index]!['id'];
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            shadowColor: Colors.transparent,
                            elevation: 0,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DescriptionBook(
                                          id: id,
                                        )));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(
                                    right: 8.0, bottom: 12.0),
                                height: 128.0,
                                width: 83.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  image: DecorationImage(
                                    image: NetworkImage(image),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    title,
                                    style: const TextStyle(
                                        fontSize: 22.0,
                                        color: Color.fromRGBO(50, 50, 50, 1.0),
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                  const SizedBox(
                                    height: 18.0,
                                  ),
                                  Text(
                                    authors,
                                    style: const TextStyle(
                                        fontSize: 18.0,
                                        color: Color.fromRGBO(50, 50, 50, 1.0),
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                  const SizedBox(
                                    height: 12.0,
                                  ),
                                ],
                              )),
                              const Icon(
                                Icons.bookmark_border,
                                color: Color.fromRGBO(50, 50, 50, 1.0),
                              ),
                            ],
                          ),
                        );
                      }))
            ],
          ),
        ));
  }
}
