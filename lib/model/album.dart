class Album {
  final String? artistName;
  final String? collectionName;
  final String? primaryGenreName;
  final String? artworkUrl;
  final String? previewUrl;
  bool isBookMark = false;

  Album({
    this.artistName,
    this.collectionName,
    this.primaryGenreName,
    this.artworkUrl,
    this.previewUrl,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      artistName: json['artistName'] as String?,
      collectionName: json['collectionName'] as String?,
      primaryGenreName: json['primaryGenreName'] as String?,
      artworkUrl: json['artworkUrl100'] as String?,
      previewUrl: json['previewUrl'] as String?,
    );
  }

  void changeBookMark() {
    isBookMark ? false : true;
  }
}
