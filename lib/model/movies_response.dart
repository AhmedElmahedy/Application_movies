class Movie {
 late int id;
 late  String title;
 late String overview;
 late String posterPath;
 late String releaseDate;
  // Add other relevant fields here

  Movie({
     this.id = 0 ,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    // Initialize other fields here
  });

  // Factory constructor to create a Movie object from a map (e.g., Firestore data)
 /// json => object
   Movie.fromMap(Map<String, dynamic> data) {
      id = data['id'] as int?  ?? 0 ;
      title = data['title'] as String?  ?? 'mahedy';
      overview = data['overview'] as String? ?? 'Ezz' ;
      posterPath = data['poster_path'] as String?  ?? 'fuiohdio';
      releaseDate= data['releaseDate'] as String? ?? 'dfdv';
      // Initialize other fields from the map
  }

  // Method to convert Movie object to a map (for saving to Firestore)
 /// object => json
  Map<String, dynamic> toMap() {
    return {
      'id' : id,
      'title': title,
      'overview': overview,
      'poster_path': posterPath,
      'releaseDate': releaseDate
      // Convert other fields to map
    };
  }
}
