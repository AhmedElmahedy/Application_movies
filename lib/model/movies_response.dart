class Movie {
  int? id;
 String? title;
 String? overview;
 String? posterPath;
 String? releaseDate;
  // Add other relevant fields here

  Movie({
     this.id  ,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    // Initialize other fields here
  });

  // Factory constructor to create a Movie object from a map (e.g., Firestore data)
 /// json => object
   Movie.fromMap(Map<String, dynamic> data) {
      id = data['id'];
      title = data['title'];
      overview = data['overview']  ;
      posterPath = data['poster_path'] ;
      releaseDate= data['releaseDate'] ;
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
