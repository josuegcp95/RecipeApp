

import UIKit
import DropDown
import CoreData

protocol FilteredRecipesDelegate {
    func updateFilteredRecipes(results: [Recipe])
}

class RecipeDetailsViewController: UIViewController {
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var time: UITextField!
    @IBOutlet weak var categoryDropDownView: UIView!
    @IBOutlet weak var type: UITextField!
    @IBOutlet weak var details: UITextField!
    @IBOutlet weak var ingredientsDropDownView: UIView!
    @IBOutlet weak var ingredients: UITextField!
    @IBOutlet weak var instructions: UITextField!
    var recipeToEdit: Recipe?
    var ingredientsDictionary: [Int: String] = [:]
    var categoryList = [Category]()
    var stringCategoryList = [String]()
    var ingredientList = [Ingredient]()
    var stringIngredientList = [String]()
    let categoryDropDown = DropDown()
    let ingredientDropDown = DropDown()
    var filteredRecipesDelegate: FilteredRecipesDelegate!
    var filteredRecipes: [Recipe]!
//    var controller: NSFetchedResultsController<Recipe>?
    var indexToDelete: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if recipeToEdit != nil {
            loadExistingData()
        }
        retrieveCategories()
        retrieveIngredients()
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil);
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil);
        categoryDropDown.anchorView = categoryDropDownView
        categoryDropDown.direction = .bottom
        categoryDropDown.dataSource = stringCategoryList
        categoryDropDown.bottomOffset = CGPoint(x: 0, y:(categoryDropDown.anchorView?.plainView.bounds.height)!)
        ingredientDropDown.anchorView = ingredientsDropDownView
        ingredientDropDown.direction = .bottom
        ingredientDropDown.dataSource = stringIngredientList
        ingredientDropDown.bottomOffset = CGPoint(x: 0, y:(ingredientDropDown.anchorView?.plainView.bounds.height)!)
        categoryDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.type.text = stringCategoryList[index]
        }
        ingredientDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            if let _ = ingredientsDictionary[index] {
                ingredientsDictionary.removeValue(forKey: index)
                displayIngredients()
            } else {
                ingredientsDictionary[index] = item
                displayIngredients()
            }
        }
    }
}
//MARK:  Display Ingredients
extension RecipeDetailsViewController {
    
    func displayIngredients() {
        self.ingredients.text = ""
        for (_, ingredientName) in ingredientsDictionary {
            self.ingredients.text! += "•\(ingredientName) "
        }
    }
}
//MARK:  Keyboard
extension RecipeDetailsViewController {
    
    @objc private func hideKeyboard() {
        self.view.endEditing(true)
    }
    @objc func keyboardWillShow(sender: NSNotification) {
        self.view.frame.origin.y = -20
    }
    @objc func keyboardWillHide(sender: NSNotification) {
        self.view.frame.origin.y = 0
    }
}
//MARK:  Dropdown Menu
extension RecipeDetailsViewController {
    
    @IBAction func categoryTapped(_ sender: UIButton){
        categoryDropDown.show()
    }
    
    @IBAction func ingredientTapped(_ sender: UIButton){
        ingredientDropDown.show()
    }
}
//MARK:  Save, Delete, and Load existing data
extension RecipeDetailsViewController {
    
    @IBAction func saveTapped(_ sender: UIButton) {
        var recipe: Recipe!
        
        if recipeToEdit != nil {
            recipe = recipeToEdit
        } else {
            guard let name = name.text, !name.isEmpty,
                  let time = time.text, !time.isEmpty,
                  let type = type.text, !type.isEmpty,
                  let details = details.text, !details.isEmpty else { return }
            recipe = Recipe(context: Constants.context)
            retrieveRecipes()
            filteredRecipesDelegate.updateFilteredRecipes(results: filteredRecipes)
        }
        
        guard let name = name.text, !name.isEmpty,
              let time = time.text, !time.isEmpty,
              let type = type.text, !type.isEmpty,
              let details = details.text, !details.isEmpty else { return }
        
        recipe.name = name
        recipe.time = Int64(time) ?? 0
        recipe.type = type
        recipe.details = details
        recipe.ingredients = ingredients.text
        recipe.instructions = instructions.text
        
        Constants.appDelegate.saveContext()
        
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func deleteTapped(_ sender: UIButton) {
        if recipeToEdit != nil {
            Constants.context.delete(recipeToEdit!)
            filteredRecipes.remove(at: indexToDelete)
            filteredRecipesDelegate.updateFilteredRecipes(results: filteredRecipes)
            Constants.appDelegate.saveContext()
            navigationController?.popViewController(animated: true)
        } else {
            name.text = ""
            time.text = ""
            type.text = ""
            details.text = ""
            ingredients.text = ""
            instructions.text = ""
        }
    }
    
    func loadExistingData() {
        if let recipe = recipeToEdit {
            name.text = recipe.name
            time.text = "\(recipe.time)"
            type.text = recipe.type
            details.text = recipe.details
            ingredients.text = recipe.ingredients
            instructions.text = recipe.instructions
        }
    }
}
//MARK:  Retrieve Data
extension RecipeDetailsViewController {
    
    func retrieveCategories() {
        let fetchRequest: NSFetchRequest<Category> = Category.fetchRequest()
        let nameSort = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [nameSort]
        
        do {
            self.categoryList =  try Constants.context.fetch(fetchRequest)
            for item in categoryList {
                stringCategoryList.append(item.name!)
            }
        } catch let Err {
            print(Err)
        }
    }
    
    func retrieveIngredients(){
        let fetchRequest: NSFetchRequest<Ingredient> = Ingredient.fetchRequest()
        let nameSort = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [nameSort]
        
        do {
            self.ingredientList =  try Constants.context.fetch(fetchRequest)
            for item in ingredientList {
                stringIngredientList.append(item.name!)
            }
        } catch let Err {
            print(Err)
        }
    }
    
    func retrieveRecipes() {
        let fetchRequest: NSFetchRequest<Recipe> = Recipe.fetchRequest()
        let dateSort = NSSortDescriptor(key: "created", ascending: false)
        fetchRequest.sortDescriptors = [dateSort]
        
        do {
            
            self.filteredRecipes = try Constants.context.fetch(fetchRequest)
        } catch let err {
            print(err)
        }
    }
}

