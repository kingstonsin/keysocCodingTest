class Album {
  final String? artistName;
  final String? collectionName;
  final String? trackName;
  final String? artworkUrl;
  final String? previewUrl;
   bool isBookMark = false;

  Album(
      {this.artistName,
        this.collectionName,
        this.trackName,
        this.artworkUrl,
        this.previewUrl,
       });


  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      artistName: json['artistName'] as String?,
      collectionName: json['collectionName'] as String?,
      trackName: json['trackName'] as String?,
      artworkUrl: json['artworkUrl100'] as String?,
      previewUrl: json['previewUrl'] as String?,
    );
  }

  void changeBookMark(){
    isBookMark?false:true;
  }



}