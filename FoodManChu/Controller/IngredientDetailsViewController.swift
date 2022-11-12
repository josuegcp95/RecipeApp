

import UIKit

class IngredientDetailsViewController: UIViewController {
    @IBOutlet weak var name: UITextField!
    var ingredientToEdit: Ingredient?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if ingredientToEdit != nil {
            loadExistingData()
        }
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))
    }
}
//MARK:  Keyboard
extension IngredientDetailsViewController {

    @objc private func hideKeyboard() {
        self.view.endEditing(true)
    }
}
//MARK:  Save, Delete, and Load existing data
extension IngredientDetailsViewController {
    
    @IBAction func saveTapped(_ sender: UIButton) {
        var ingredient: Ingredient!

        if ingredientToEdit != nil {
            ingredient = ingredientToEdit
        } else {
            guard let name = name.text, !name.isEmpty else { return }
            ingredient = Ingredient(context: Constants.context)
        }
    
        guard let name = name.text, !name.isEmpty else { return }
        
        ingredient.name = name
        
        Constants.appDelegate.saveContext()
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func deleteTapped(_ sender: UIButton) {
        if ingredientToEdit != nil {
            Constants.context.delete(ingredientToEdit!)
            Constants.appDelegate.saveContext()
            navigationController?.popViewController(animated: true)
        } else {
            name.text = ""
        }
    }
    
    func loadExistingData() {
        if let ingredient = ingredientToEdit {
            name.text = ingredient.name
        }
    }
}
