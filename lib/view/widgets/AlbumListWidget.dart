import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keysoc_coding_test/model/album.dart';
import 'package:keysoc_coding_test/model/album.dart';
import 'package:keysoc_coding_test/model/albumList.dart';

import 'package:keysoc_coding_test/view_model/album_view_model.dart';
import 'package:provider/provider.dart';

class AlbumListWidget extends StatefulWidget {
  final List<Album> _albumList;
  final Function _function;
  final AlbumList _bookMarkList;


  AlbumListWidget(this._albumList, this._function,this._bookMarkList);

  @override
  _AlbumListWidgetState createState() => _AlbumListWidgetState();
}

class _AlbumListWidgetState extends State<AlbumListWidget> {

  Widget _buildSongItem(Album album) {

    Album? _selectedAlbum = Provider.of<AlbumViewModel>(context).album;
    bool isBook = widget._bookMarkList.isContainAlbum(album);


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
                    //TODO
                    album.trackName ?? '',
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
                    album.artistName ?? '',
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

            IconButton(onPressed: isBook
                ?(){
              print("isinAL = true");
              setState(() {
                isBook=false;
              });
              widget._bookMarkList.deleteAlbum(album);
              Provider.of<AlbumViewModel>(context,listen: false).album?.changeBookMark();
            }
            :(){
              print("isinAL = false");
              setState(() {
                isBook=true;
              });
              widget._bookMarkList.addAlbum(album);
              Provider.of<AlbumViewModel>(context,listen: false).album?.changeBookMark();
              print("BOOK = "+ widget._bookMarkList.albumList.toString());

            }, icon: isBook
    ? Icon(Icons.bookmark_add_outlined, color: Colors.red,)
          : Icon(Icons.bookmark_add_outlined)),

        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Column(children: <Widget>[
        ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: widget._albumList.length,
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemBuilder: (BuildContext context, int index) {
            Album data = widget._albumList[index];


            return InkWell(
              onTap: () {
                if (null != data.artistName) {
                  widget._function(data);
                }
              },
              child: _buildSongItem(data),
            );
          },
        ),
      ]),
    );
  }
}