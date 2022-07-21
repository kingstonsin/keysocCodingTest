import 'package:keysoc_coding_test/model/services/album_service.dart';
import 'package:keysoc_coding_test/model/services/base_service.dart';

import 'album.dart';

class AlbumRepository {
  BaseService _albumService = AlbumService();

  Future<List> fetchAlbumList(String value) async {
    dynamic response = await _albumService.getResponse(value);
    final jsonData = response['results'] as List;
    List albumList =
        jsonData.map((tagJson) => Album.fromJson(tagJson)).toList();
    return albumList;
  }
}
