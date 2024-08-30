class Category{
  String id;
  String title;
  String imagepath;
  Category({required this.id,required this.title , required this.imagepath});

  static List<Category> getcategories(){
    return [
      Category(id: '28', title: "Action", imagepath: "assets/images/Genre_Standard.png"),
      Category(id: '12', title: "Adventure", imagepath: "assets/images/Genre_Standard.png"),
      Category(id: '16', title: "Animation", imagepath: "assets/images/Genre_Standard.png"),
      Category(id: '35', title: "Comedy", imagepath: "assets/images/Genre_Standard.png"),
      Category(id: '80', title: "Crime", imagepath: "assets/images/Genre_Standard.png"),
      Category(id: '99', title: "Documentary", imagepath: "assets/images/Genre_Standard.png"),
      Category(id: '18', title: "Drama", imagepath: "assets/images/Genre_Standard.png"),
      Category(id: '10751', title: "Family", imagepath: "assets/images/Genre_Standard.png"),
      Category(id: '14', title: "Fantasy", imagepath: "assets/images/Genre_Standard.png"),
      Category(id: '36', title: "History", imagepath: "assets/images/Genre_Standard.png"),
      Category(id: '27', title: "Horror", imagepath: "assets/images/Genre_Standard.png"),
      Category(id: '10402', title: "Music", imagepath: "assets/images/Genre_Standard.png"),
      Category(id: '9648', title:"Mystery", imagepath: "assets/images/Genre_Standard.png"),
      Category(id: '10749', title: "Romance", imagepath: "assets/images/Genre_Standard.png"),
      Category(id: '878', title: "Science Fiction", imagepath: "assets/images/Genre_Standard.png"),
      Category(id: '10770', title: "TV Movie", imagepath: "assets/images/Genre_Standard.png"),
      Category(id: '53', title: "Thriller", imagepath: "assets/images/Genre_Standard.png"),
      Category(id: '10752', title: "War", imagepath: "assets/images/Genre_Standard.png"),
      Category(id: '37', title: "Western" , imagepath: "assets/images/Genre_Standard.png")
      
    ];

  }
  
  
  
 
 




}