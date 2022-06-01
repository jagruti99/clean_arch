import '../../pages/post_detail_page.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/post.dart';

class PostListWidget extends StatefulWidget {
  final List<Post> posts;

  const PostListWidget({
    Key? key,
    required this.posts,
  }) : super(key: key);

  @override
  State<PostListWidget> createState() => _PostListWidgetState();
}

class _PostListWidgetState extends State<PostListWidget> {
  TextEditingController controller1 = TextEditingController();

  List _filteerd = [];
  String _searchResult = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print("INIT");
    print(widget.posts);

    _filteerd = widget.posts;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Wrap(
        children: [
          Card(
            child: ListTile(
              leading: Icon(Icons.search),
              title: TextField(
                  controller: controller1,
                  decoration: InputDecoration(
                      hintText: 'Search', border: InputBorder.none),
                  onChanged: (value) {
                    setState(() {
                      _searchResult = value;

                      _filteerd = widget.posts
                          .where((user) =>
                              user.idDrink
                                  .toString()
                                  .contains(_searchResult.toString()) ||
                              user.strDrink.contains(_searchResult.toString()))
                          .toList();
                    });
                  }),
              trailing: new IconButton(
                icon: new Icon(Icons.cancel),
                onPressed: () {
                  setState(() {
                    controller1.clear();
                    _searchResult = '';
                    _filteerd = widget.posts;
                  });
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
              shrinkWrap: true,
              primary: false,
              itemCount: _filteerd.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text(_filteerd[index].idDrink.toString()),
                  title: Text(
                    _filteerd[index].strDrink,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    _filteerd[index].strInstructions,
                    style: TextStyle(fontSize: 16),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PostDetailPage(post: _filteerd[index]),
                      ),
                    );
                  },
                );
              },
              separatorBuilder: (context, index) => Divider(thickness: 1),
            ),
          ),
        ],
      ),
    );
  }
}
