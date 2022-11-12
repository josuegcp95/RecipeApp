

import UIKit

class RecipeCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var details: UILabel!
    @IBOutlet weak var ingredients: UITextView!
    @IBOutlet weak var instructions: UITextView!

    func configCell(_ recipe: Recipe) {
        name.text = "Name: \(recipe.name ?? "")"
        time.text = "Time: \(recipe.time) minutes"
        type.text = "Category: \(recipe.type ?? "")"
        details.text = "Description: \(recipe.details ?? "")"
        ingredients.text = "Ingredients: \(recipe.ingredients ?? "")"
        instructions.text = "Instructions: \(recipe.instructions ?? "")"
    }
}
