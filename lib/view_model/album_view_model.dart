import 'package:flutter/cupertino.dart';
import 'package:keysoc_coding_test/model/album.dart';
import 'package:keysoc_coding_test/model/album_repository.dart';
import 'package:keysoc_coding_test/model/apis/api_response.dart';

class AlbumViewModel with ChangeNotifier {
  ApiResponse _apiResponse = ApiResponse.initial('Empty data');
  // AlbumList? _albumList;
  Album? _album;

  AlbumViewModel(){
    fetchAlbumData("jack+johnson&entity=album");
  }

  ApiResponse get response {
    return _apiResponse;
  }

  Album? get album {
    return _album;
  }

  // AlbumList? get albumList{
  //   return _albumList;
  // }


  Future<void> fetchAlbumData(String value) async {
    _apiResponse = ApiResponse.loading('Fetching artist data');
    notifyListeners();
    try {
      List albumList = await AlbumRepository().fetchAlbumList(value);
      _apiResponse = ApiResponse.completed(albumList);
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
      print(e);
    }
    notifyListeners();
  }

  void setSelectedAlbum(Album? album) {
    _album = album;
    notifyListeners();
  }

  void changeBookMarked(Album? album){
    album?.changeBookMark();
    notifyListeners();
  }
  //
  // void setSelectedAlbumList(AlbumList? albumList) {
  //   _albumList = albumList;
  //   notifyListeners();
  // }
  //
  // void addAlbumtoList(Album album){
  //   _albumList?.addAlbum(album);
  //   notifyListeners();
  // }
  //
  // void deleteAlbumtoList(Album album){
  //   _albumList?.deleteAlbum(album);
  //   notifyListeners();
  // }

}