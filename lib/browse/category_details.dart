class Category{
  String id;
  String title;
  String imagepath;
  Category({required this.id,required this.title , required this.imagepath});

  static List<Category> getcategories(){
    return [
      Category(id: '28', title: "Action", imagepath: "assets/images/action 1.png"),
      Category(id: '12', title: "Adventure", imagepath: "assets/images/abenteuer 1.png"),
      Category(id: '16', title: "Animation", imagepath: "assets/images/animation 1.png"),
      Category(id: '35', title: "Comedy", imagepath: "assets/images/komodie 1.png"),
      Category(id: '80', title: "Crime", imagepath: "assets/images/krimi 1.png"),
      Category(id: '99', title: "Documentary", imagepath: "assets/images/documentar film 1.png"),
      Category(id: '18', title: "Drama", imagepath: "assets/images/drama 1.png"),
      Category(id: '10751', title: "Family", imagepath: "assets/images/family 1.png"),
      Category(id: '14', title: "Fantasy", imagepath: "assets/images/Sci-Fi & fantasy 1.png"),
      Category(id: '36', title: "History", imagepath: "assets/images/historie 1.png"),
      Category(id: '27', title: "Horror", imagepath: "assets/images/horror 1.png"),
      Category(id: '10402', title: "Music", imagepath: "assets/images/musik 1.png"),
      Category(id: '9648', title:"Mystery", imagepath: "assets/images/My stery 1.png"),
      Category(id: '10749', title: "Romance", imagepath: "assets/images/liebesFilm 1.png"),
      Category(id: '878', title: "Science Fiction", imagepath: "assets/images/Science Fiction 1.png"),
      Category(id: '10770', title: "TV Movie", imagepath: "assets/images/Tv Film 1.png"),
      ////////////////////////////////////////////////////////////////////////////////////////
      Category(id: '53', title: "Thriller", imagepath: "assets/images/Genre_Standard.png"), //+>
      Category(id: '10752', title: "War", imagepath: "assets/images/Genre_Standard.png"),//+>
      Category(id: '37', title: "Western" , imagepath: "assets/images/Genre_Standard.png")//+>
      
    ];

  }
  
  
  
 
 




}