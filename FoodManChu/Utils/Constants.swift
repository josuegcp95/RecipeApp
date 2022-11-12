

import Foundation
import UIKit

enum Constants {
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    static let context = appDelegate.persistentContainer.viewContext
    static let recipeCellId = "RecipeCell"
    static let ingredientCellId = "IngredientCell"
    static let addNewRecipeSegue = "addNewRecipeSegue"
    static let editRecipeSegue = "editRecipeSegue"
    static let addNewIngredientSegue = "addNewIngredientSegue"
    static let editIngredientSegue = "editIngredientSegue"
}
