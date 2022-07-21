import 'album.dart';

class AlbumList{

  final List<Album> albumList=[];


  void addAlbum(Album album){
    albumList.add(album);
  }

  void deleteAlbum(Album album){
    albumList.remove(album);
  }

  bool isContainAlbum(Album album){
    if(albumList==null){return false;}
    if(albumList.contains(album)){
      return true;
    }else{return false;}
  }


}