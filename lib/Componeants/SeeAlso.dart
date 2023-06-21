import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:my_project/Pages/DescriptionBook.dart';
class SeeAlso extends StatefulWidget{
  const SeeAlso({Key? key,}) : super(key: key);
  @override
  _SeeAlso createState() => _SeeAlso();
}
class _SeeAlso extends State<SeeAlso>{
  List<dynamic> books = [];


  getShortInfoBook() async{
    final response =
    await http.get(Uri.parse("https://www.dbooks.org/api/recent"));
    if (response.statusCode == 200) {
      var data = await jsonDecode(response.body);
      setState((){
        books=data["books"];
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
    return ListView.builder(
      itemCount: books.length,
      itemBuilder: (context, index) {
        final title=books[index]!["title"];
        final image=books[index]!["image"];
        final authors=books[index]!["authors"];
        final id= books[index]!['id'];
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
                margin: const EdgeInsets.only(right: 8.0, bottom: 12.0),
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
      },
    );
  }
}