import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DescriptionBook extends StatefulWidget {
  final String id;

  const DescriptionBook({Key? key, required this.id}) : super(key: key);
  @override
  _DescriptionBook createState() => _DescriptionBook();
}

class _DescriptionBook extends State<DescriptionBook> {
     Map book={};

   void fetchDataBooks(id) async {
    final url = 'https://www.dbooks.org/api/book/${id.toString().toLowerCase()}';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = await jsonDecode(body);
    setState((){
      book=json;
    });
   }

  @override
  void initState() {
    super.initState();
    fetchDataBooks(widget.id);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff1d212b),
        centerTitle: true,
        title:  Text(
          book['title']??'',
          overflow: TextOverflow.fade,
        ),
        //  أضافة زر القائمة
        actions: [
          //  أضافة زر الاشعارات
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications))
        ],
      ),
      body:book.isNotEmpty?
      Padding(padding:const EdgeInsets.all(12),
        child:
      Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 8.0, bottom: 12.0),
                height: 250.0,
                width: 180.0,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(bottomRight:Radius.circular(8.0)),
                  image: DecorationImage(
                    image: NetworkImage(book['image']??''),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 18,
                      ),
                      Text(
                        book['title']??'',
                        style: const TextStyle(
                            fontSize: 20.0,
                            color: Color.fromRGBO(50, 50, 50, 1.0),
                            overflow: TextOverflow.ellipsis),
                      ),
                      const SizedBox(
                        height: 18.0,
                      ),
                      Container(
                          child: book['subtitle'].toString().isNotEmpty?
                          Flex(direction: Axis.vertical,
                            children: [
                              Text(
                                book['subtitle'] ??'',
                                style: const TextStyle(
                                  overflow: TextOverflow.clip,
                                  fontSize: 16.0,
                                  color: Color.fromRGBO(50, 50, 50, 1.0),
                                ),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                            ],
                          ):const SizedBox(height: 18,)
                      ),
                      Text(
                        book['authors']??'' ,
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Color.fromRGBO(50, 50, 50, 1.0),
                          overflow: TextOverflow.clip,
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flex(
                            direction: Axis.horizontal,
                            children: [
                              const Icon(Icons.book ,size: 28),
                              Text(
                                book['pages']??'',
                                style: const TextStyle(
                                    fontSize: 22
                                ),
                              ),
                            ],
                          ),
                          Flex(
                            direction: Axis.horizontal,
                            children: [
                              const Icon(Icons.date_range),
                              Text(book['year'],style: const TextStyle(
                                  fontSize: 22
                              ),
                              )
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),

                    ],
                  )),
              Container(
                margin: const EdgeInsets.only(top: 18),
                child: const Icon(
                  Icons.bookmark_border,
                  color: Color.fromRGBO(50, 50, 50, 1.0),
                ),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                  child:
                  Text(book['description'],
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  )
              )
            ],
          )
        ],
      )
        ,):
      const Center(child: CircularProgressIndicator()),
  );
}
