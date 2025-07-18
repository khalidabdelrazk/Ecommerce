abstract class ProductTabStates {}
class CategorySelectedState extends ProductTabStates {
  final String selectedCategory;
  CategorySelectedState(this.selectedCategory);
}
class ProductTabInitialState extends ProductTabStates {}
class ProductTabLoadingState extends ProductTabStates {}