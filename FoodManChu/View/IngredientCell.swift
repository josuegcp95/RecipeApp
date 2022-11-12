

import UIKit

class IngredientCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    
    func configCell(_ ingredient: Ingredient) {
        name.text = ingredient.name
    }
}
