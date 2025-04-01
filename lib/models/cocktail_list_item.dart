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

  factory CocktailListItem.fromJson(Map<String, dynamic> json) {
    List<String> extractedIngredients = [];
    List<String> extractedMeasures = [];

    for (int i = 1; i <= 15; i++) {
      final ingredient = json['strIngredient$i'];
      final measure = json['strMeasure$i'];

      if (ingredient != null && ingredient.toString().isNotEmpty) {
        extractedIngredients.add(ingredient);
        extractedMeasures.add(measure ?? '');
      }
    }

    return CocktailListItem(
      drinkId: int.parse(json['idDrink']),
      name: json['strDrink'] ?? 'Unknown',
      category: json['strCategory'] ?? 'Unknown',
      alcoholic: json['strAlcoholic'] ?? 'Unknown',
      glass: json['strGlass'] ?? 'Unknown',
      instruction: json['strInstructions'] ?? 'No instructions',
      ingredients: extractedIngredients,
      measures: extractedMeasures,
      image:
          json['strImageSource']?.isNotEmpty == true
              ? json['strImageSource']
              : json['strDrinkThumb'] ?? '',
    );
  }
}
