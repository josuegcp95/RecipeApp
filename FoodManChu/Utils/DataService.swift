

import Foundation

class DataService {
    static let shared = DataService()
    
//MARK:  CATEGORIES
    func generateInitialCategories() {
        let category1 = Category(context: Constants.context)
        category1.name = "Meat"
        
        let category2 = Category(context: Constants.context)
        category2.name = "Keto"
        
        let category3 = Category(context: Constants.context)
        category3.name = "Vegetarian"
        
        let category4 = Category(context: Constants.context)
        category4.name = "Vegan"
        
        let category5 = Category(context: Constants.context)
        category5.name = "Paleo"
        
        Constants.appDelegate.saveContext()
    }
    
//MARK:  INGREDIENTS
    func generateInitialIngredients() {
        let ingredient1 = Ingredient(context: Constants.context)
        ingredient1.name = "Apple"
        
        let ingredient2 = Ingredient(context: Constants.context)
        ingredient2.name = "Banana"
        
        let ingredient3 = Ingredient(context: Constants.context)
        ingredient3.name = "Beef"
        
        let ingredient4 = Ingredient(context: Constants.context)
        ingredient4.name = "Black Beans"
        
        let ingredient5 = Ingredient(context: Constants.context)
        ingredient5.name = "Black Pepper"
        
        let ingredient6 = Ingredient(context: Constants.context)
        ingredient6.name = "Blue Cheese"
        
        let ingredient7 = Ingredient(context: Constants.context)
        ingredient7.name = "Blueberry"
        
        let ingredient8 = Ingredient(context: Constants.context)
        ingredient8.name = "Burger Bun"
        
        let ingredient9 = Ingredient(context: Constants.context)
        ingredient9.name = "Cheddar Cheese"
        
        let ingredient10 = Ingredient(context: Constants.context)
        ingredient10.name = "Chicken"
        
        let ingredient11 = Ingredient(context: Constants.context)
        ingredient11.name = "Corn"
        
        let ingredient12 = Ingredient(context: Constants.context)
        ingredient12.name = "Crab"
        
        let ingredient13 = Ingredient(context: Constants.context)
        ingredient13.name = "Eggs"
        
        let ingredient14 = Ingredient(context: Constants.context)
        ingredient14.name = "Noodles"
        
        let ingredient15 = Ingredient(context: Constants.context)
        ingredient15.name = "Fish"
        
        let ingredient16 = Ingredient(context: Constants.context)
        ingredient16.name = "Garlic"
        
        let ingredient17 = Ingredient(context: Constants.context)
        ingredient17.name = "Green Pepper"
        
        let ingredient18 = Ingredient(context: Constants.context)
        ingredient18.name = "Ground Turkey"
        
        let ingredient19 = Ingredient(context: Constants.context)
        ingredient19.name = "Kidney"
        
        let ingredient20 = Ingredient(context: Constants.context)
        ingredient20.name = "Kiwi"
        
        let ingredient21 = Ingredient(context: Constants.context)
        ingredient21.name = "Lemon"
        
        let ingredient22 = Ingredient(context: Constants.context)
        ingredient22.name = "Lettuce"
        
        let ingredient23 = Ingredient(context: Constants.context)
        ingredient23.name = "Liver"
        
        let ingredient24 = Ingredient(context: Constants.context)
        ingredient24.name = "Mango"
        
        let ingredient25 = Ingredient(context: Constants.context)
        ingredient25.name = "Mushrooms"
        
        let ingredient26 = Ingredient(context: Constants.context)
        ingredient26.name = "Mussels"
        
        let ingredient27 = Ingredient(context: Constants.context)
        ingredient27.name = "Olive Oil"
        
        let ingredient28 = Ingredient(context: Constants.context)
        ingredient28.name = "Olives"
        
        let ingredient29 = Ingredient(context: Constants.context)
        ingredient29.name = "Onion"
        
        let ingredient30 = Ingredient(context: Constants.context)
        ingredient30.name = "Oranges"
        
        let ingredient31 = Ingredient(context: Constants.context)
        ingredient31.name = "Oregano"
        
        let ingredient32 = Ingredient(context: Constants.context)
        ingredient32.name = "Paprika"
        
        let ingredient33 = Ingredient(context: Constants.context)
        ingredient33.name = "Parmesan Cheese"
        
        let ingredient34 = Ingredient(context: Constants.context)
        ingredient34.name = "Parmesan Cream Sauce"
        
        let ingredient35 = Ingredient(context: Constants.context)
        ingredient35.name = "Pear"
        
        let ingredient36 = Ingredient(context: Constants.context)
        ingredient36.name = "Plantain"
        
        let ingredient37 = Ingredient(context: Constants.context)
        ingredient37.name = "Pork"
        
        let ingredient38 = Ingredient(context: Constants.context)
        ingredient38.name = "Potatoes"
        
        let ingredient39 = Ingredient(context: Constants.context)
        ingredient39.name = "Ranch"
        
        let ingredient40 = Ingredient(context: Constants.context)
        ingredient40.name = "Red Beans"
        
        let ingredient41 = Ingredient(context: Constants.context)
        ingredient41.name = "Red Chilli"
        
        let ingredient42 = Ingredient(context: Constants.context)
        ingredient42.name = "Red Pepper"
        
        let ingredient43 = Ingredient(context: Constants.context)
        ingredient43.name = "Rice"
        
        let ingredient44 = Ingredient(context: Constants.context)
        ingredient44.name = "Salmon"
        
        let ingredient45 = Ingredient(context: Constants.context)
        ingredient45.name = "Salt"
        
        let ingredient46 = Ingredient(context: Constants.context)
        ingredient46.name = "Shrimp"
        
        let ingredient47 = Ingredient(context: Constants.context)
        ingredient47.name = "Spinach"
        
        let ingredient48 = Ingredient(context: Constants.context)
        ingredient48.name = "Squids"
        
        let ingredient49 = Ingredient(context: Constants.context)
        ingredient49.name = "Strawberry"
        
        let ingredient50 = Ingredient(context: Constants.context)
        ingredient50.name = "Tomatoes"
        
        let ingredient51 = Ingredient(context: Constants.context)
        ingredient51.name = "Tulsi"
        
        let ingredient52 = Ingredient(context: Constants.context)
        ingredient52.name = "Tuna Fish"
        
        let ingredient53 = Ingredient(context: Constants.context)
        ingredient53.name = "Turkey"
        
        let ingredient54 = Ingredient(context: Constants.context)
        ingredient54.name = "Vinegar"
        
        let ingredient55 = Ingredient(context: Constants.context)
        ingredient55.name = "Watermelon"
        
        Constants.appDelegate.saveContext()
    }
    
//MARK:  RECIPES
    func generateInitialRecipes() {
        let recipe1 = Recipe(context: Constants.context)
        recipe1.name = "Salmon Teriyaki"
        recipe1.time = 25
        recipe1.type = "Paleo"
        recipe1.details = "Air fried salmon with teriyaki glaze"
        recipe1.ingredients = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
        recipe1.instructions = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
        
        let recipe2 = Recipe(context: Constants.context)
        recipe2.name = "Garlic Butter Steak Bites"
        recipe2.time = 15
        recipe2.type = "Meat"
        recipe2.details = "Delicious steak bites smothered in a yummy garlic butter sauce"
        recipe2.ingredients = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
        recipe2.instructions = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
        
        let recipe3 = Recipe(context: Constants.context)
        recipe3.name = "Baked Cauliflower Parmesan"
        recipe3.time = 10
        recipe3.type = "Vegetarian"
        recipe3.details = "Oven Baked Cauliflower Parmesan with marinera sauce"
        recipe3.ingredients = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
        recipe3.instructions = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
        
        Constants.appDelegate.saveContext()
    }
}
