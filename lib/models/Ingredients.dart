class Ingredients {

  final double quantity;
  final String unit;
  final String ingredient;

  Ingredients(this.quantity, this.unit, this.ingredient);

  Ingredients.fromJson(Map<String, dynamic> json)
  : quantity = json['quantity'],
    unit = json['unit'],
    ingredient = json['ingredient'];

}