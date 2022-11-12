

import UIKit
import CoreData

class RecipeListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var controller: NSFetchedResultsController<Recipe>!
    var filteredRecipes: [Recipe]!
    var indexToDelete: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        self.tableView.keyboardDismissMode = .interactive
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil);
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil);
//                    DataService.shared.generateInitialCategories()
//                    DataService.shared.generateInitialIngredients()
//                    DataService.shared.generateInitialRecipes()
        attemptFetch()
    }
}
//MARK:  Keyboard
extension RecipeListViewController {
    
    @objc func keyboardWillShow(sender: NSNotification) {
        self.view.frame.origin.y = -20
    }
    @objc func keyboardWillHide(sender: NSNotification) {
        self.view.frame.origin.y = 0
    }
}
//MARK:  TableView Setup
extension RecipeListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredRecipes.count 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.recipeCellId, for: indexPath) as? RecipeCell else {
            return UITableViewCell()
        }
        let recipe = filteredRecipes[indexPath.row]
        cell.configCell(recipe)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 265
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let objects = filteredRecipes, objects.count > 0 {
            let recipe = objects[indexPath.row]
            indexToDelete = indexPath.row
            performSegue(withIdentifier: Constants.editRecipeSegue, sender: recipe)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.editRecipeSegue {
            if let destination = segue.destination as? RecipeDetailsViewController {
                if let recipe = sender as? Recipe {
                    destination.recipeToEdit = recipe
                    destination.indexToDelete = indexToDelete
                    destination.filteredRecipes = filteredRecipes
                    destination.filteredRecipesDelegate = self
                }
            }
        } else if segue.identifier == Constants.addNewRecipeSegue {
            if let destination = segue.destination as? RecipeDetailsViewController {
                destination.filteredRecipesDelegate = self
            }
        }
    }
    func configureCell(_ cell: RecipeCell, indexpath: IndexPath) {
        let recipe = controller.object(at: indexpath)
        cell.configCell(recipe)
    }
}
//MARK:  CoreData Setup
extension RecipeListViewController: NSFetchedResultsControllerDelegate {
    
    func attemptFetch() {
        let fetchRequest: NSFetchRequest<Recipe> = Recipe.fetchRequest()
        
        let dateSort = NSSortDescriptor(key: "created", ascending: false)
        fetchRequest.sortDescriptors = [dateSort]
        
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest,
                                                    managedObjectContext: Constants.context,
                                                    sectionNameKeyPath: nil,
                                                    cacheName: nil)
        
        controller.delegate = self
        self.controller = controller
        
        do {
            try controller.performFetch()
            filteredRecipes = controller.fetchedObjects
        } catch let err {
            print(err)
        }
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch type {
        case .insert:
            if let indexPath = newIndexPath {
                tableView.insertRows(at: [indexPath], with: .fade)
            }
        case .delete:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        case .update:
            if let indexPath = indexPath {
                let cell = tableView.cellForRow(at: indexPath) as! RecipeCell
                configureCell(cell, indexpath: indexPath)
            }
        case .move:
            if let indexPath = indexPath {
                tableView.insertRows(at: [indexPath], with: .fade)
            }
        @unknown default:
            break
        }
    }
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
}
//MARK:  Seachbar Setup
extension RecipeListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
                
        filteredRecipes = []
        
        if searchText == "" {
            filteredRecipes = controller.fetchedObjects
            self.tableView.reloadData()
        } else {
            
            for recipe in controller.fetchedObjects! {
                guard let name = recipe.name,
                      let category = recipe.type,
                      let description = recipe.details,
                      let ingredients = recipe.ingredients
                else { return }
           
                if name.lowercased().contains(searchText.lowercased()) ||
                   category.lowercased().contains(searchText.lowercased()) ||
                    description.lowercased().contains(searchText.lowercased()) ||
                    ingredients.lowercased().contains(searchText.lowercased())
                {
                    filteredRecipes.append(recipe)
                }
            }
            self.tableView.reloadData()
        }
    }
}
//MARK:  Filtered Recipes Delegate
extension RecipeListViewController: FilteredRecipesDelegate {
    func updateFilteredRecipes(results: [Recipe]) {
        filteredRecipes = results
    }
}
