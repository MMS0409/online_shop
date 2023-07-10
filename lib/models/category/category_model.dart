// "electronics",
// "jewelery",
// "men's clothing",
// "women's clothing"

class CategoryModel{
  final List<String> list;

  CategoryModel({required this.list});

  factory CategoryModel.fromJson(List<String> list){
    return CategoryModel(list: list);
  }
}