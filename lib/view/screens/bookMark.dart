import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keysoc_coding_test/model/album.dart';
import 'package:keysoc_coding_test/model/albumList.dart';

class BookMark extends StatefulWidget {
  const BookMark({Key? key, required this.bookMarkList}) : super(key: key);
  final AlbumList bookMarkList;
  @override
  _BookMarkState createState() => _BookMarkState();
}

class _BookMarkState extends State<BookMark> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
        title: const Text('BookMarked List'),
        leading: ElevatedButton(onPressed: () {
          Navigator.pop(context);
        },
          child: Icon(Icons.keyboard_backspace_rounded),),
      ),
      body: widget.bookMarkList.albumList.isEmpty? Text("You don't have any bookmarked album!"):SingleChildScrollView(
    child: Column(children: <Widget>[
      ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: widget.bookMarkList.albumList.length,
      separatorBuilder: (context, index) {
        return Divider();
      },
      itemBuilder: (BuildContext context, int index) {
        Album data = widget.bookMarkList.albumList[index];


        return InkWell(

          child: _buildItem(data),
        );
      },
    ),
    ]),
    ),

    );
  }

Widget _buildItem(Album album){
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    child: Row(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: Container(
            width: 50,
            height: 50,
            child: Image.network(album.artworkUrl ?? ''),
          ),
        ),
        SizedBox(
          width: 10.0,
        ),
        Expanded(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                Text(

                  album.artistName?? '',
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  album.primaryGenreName ?? '',
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  album.collectionName ?? '',
                  style: TextStyle(
                    fontSize: 10.0,
                    color: Colors.grey,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ]),
        ),
      ],
    ),
  );
}

}