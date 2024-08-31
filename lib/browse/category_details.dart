class Category{
  String id;
  String title;
  String imagePath;
  Category({required this.id,required this.title , required this.imagePath});
  static List<Category> getCategories(){
    return [
      Category(id: '28', title: "Action", imagePath: "assets/images/action 1.png"),
      Category(id: '12', title: "Adventure", imagePath: "assets/images/abenteuer 1.png"),
      Category(id: '16', title: "Animation", imagePath: "assets/images/animation 1.png"),
      Category(id: '35', title: "Comedy", imagePath: "assets/images/komodie 1.png"),
      Category(id: '80', title: "Crime", imagePath: "assets/images/krimi 1.png"),
      Category(id: '99', title: "Documentary", imagePath: "assets/images/documentar film 1.png"),
      Category(id: '18', title: "Drama", imagePath: "assets/images/drama 1.png"),
      Category(id: '10751', title: "Family", imagePath: "assets/images/family 1.png"),
      Category(id: '14', title: "Fantasy", imagePath: "assets/images/Sci-Fi & fantasy 1.png"),
      Category(id: '36', title: "History", imagePath: "assets/images/historie 1.png"),
      Category(id: '27', title: "Horror", imagePath: "assets/images/horror 1.png"),
      Category(id: '10402', title: "Music", imagePath: "assets/images/musik 1.png"),
      Category(id: '9648', title:"Mystery", imagePath: "assets/images/My stery 1.png"),
      Category(id: '10749', title: "Romance", imagePath: "assets/images/liebesFilm 1.png"),
      Category(id: '878', title: "Science Fiction", imagePath: "assets/images/Science Fiction 1.png"),
      Category(id: '10770', title: "TV Movie", imagePath: "assets/images/Tv Film 1.png"),
      Category(id: '53', title: "Thriller", imagePath: "assets/images/Thirller 1.png"),
      Category(id: '10752', title: "War", imagePath: "assets/images/politics 1.png"),
      Category(id: '37', title: "Western" , imagePath: "assets/images/western 1.png")
    ];
  }
}