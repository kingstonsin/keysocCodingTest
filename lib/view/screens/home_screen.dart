import 'package:flutter/material.dart';
import 'package:keysoc_coding_test/model/album.dart';
import 'package:keysoc_coding_test/model/albumList.dart';
import 'package:keysoc_coding_test/model/apis/api_response.dart';
import 'package:keysoc_coding_test/view/widgets/AlbumListWidget.dart';
import 'package:keysoc_coding_test/view_model/album_view_model.dart';
import 'package:provider/provider.dart';

import 'bookMark.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AlbumList bookMarkList = AlbumList();
  Widget getAlbumWidget(BuildContext context, ApiResponse apiResponse) {
    List<Album>? albumList = apiResponse.data as List<Album>?;

    switch (apiResponse.status) {
      case Status.LOADING:
        return Center(child: CircularProgressIndicator());
      case Status.COMPLETED:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 8,
              child: AlbumListWidget(albumList!, (Album album) {
                Provider.of<AlbumViewModel>(context, listen: false)
                    .setSelectedAlbum(album);
              }, bookMarkList),
            ),
          ],
        );
      case Status.ERROR:
        return Center(
          child: Text('Please try again latter!!!'),
        );
      case Status.INITIAL:
      default:
        return Center(
          child: Text('Loading...'),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    // final _inputController = TextEditingController();

    ApiResponse apiResponse = Provider.of<AlbumViewModel>(context).response;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Album List'),
        leading: ElevatedButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext context) {
              return BookMark(bookMarkList: bookMarkList);
            }));
          },
          child: const Icon(Icons.bookmark_outlined),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: getAlbumWidget(context, apiResponse)),
        ],
      ),
    );
  }
}
