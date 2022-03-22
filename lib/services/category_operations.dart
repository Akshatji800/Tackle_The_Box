import 'package:tackle_the_box/models/category.dart';

class CategoryOperations{
  CategoryOperations._(){}
  static List<Category> getCategories(){
    return <Category>[
      Category('Top Songs','https://cdn.discordapp.com/app-icons/856091507689259048/77080d298923895373997a6b4ea8cbb7.png'),
      Category('StuntStorm Music','https://cdn.discordapp.com/app-icons/850011982777417759/d2a9cbf8512a2c3d123ac3cb6b80b82f.png'),
      Category('amFOSS Chills','https://cdn.discordapp.com/app-icons/861440360664662027/5d18f0c2cf45b71184066f0021c7d1ca.png'),
      Category('Rizwan Beats','https://cdn.discordapp.com/app-icons/856739358153113630/170fc5a05cc817654a991f651690cfcc.png')
    ];


  }
}