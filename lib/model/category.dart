class Category{
  String ?id;
  String ?title;
  String ?img;
 int ?colorCode;
 Category({
    this.img,
   this.title ,
   this.id,
   this.colorCode
});
 static List<Category> getCategories(){
   return [
  Category(id:'sports' , img: 'assets/images/ball.png',title: 'Sports', colorCode: 0xffC91C22),
  Category(id:'business' , img: 'assets/images/bussines.png',title: 'business', colorCode: 0xffCF7E48),
  Category(id:'technology', img: 'assets/images/Politics.png',title: 'technology', colorCode: 0xff003E90),
  Category(id:'health' , img: 'assets/images/health.png',title: 'Health', colorCode: 0xffED1E79),
  Category(id:'entertainment', img: 'assets/images/environment.png',title: 'entertainment', colorCode: 0xff4882CF),
  Category(id:'science',img: 'assets/images/science.png',title: 'Science', colorCode: 0xffF2D352),
  Category(id:'general',img: 'assets/images/science.png',title: 'general', colorCode: 0xffF2D352),
   ] ;
 }

}