class CocktailListItem {
  final int drinkId;
  final String name;
  final String category;
  final String alcoholic;
  final String glass;
  final String instruction;
  final List<String> ingredients;
  final List<String> measures;
  final String image;

  CocktailListItem({
    required this.drinkId,
    required this.name,
    required this.category,
    required this.alcoholic,
    required this.glass,
    required this.instruction,
    required this.ingredients,
    required this.measures,
    required this.image,
  });
}
