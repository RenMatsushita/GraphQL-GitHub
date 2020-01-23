import UIKit

final class SearchUserViewController: UIViewController {
    
    private lazy var searchController = UISearchController(searchResultsController: self.resultController)
    private let resultController = SearchResultViewBuilder.make()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        navigationItem.title = "GitHub"
        
        searchController.hidesNavigationBarDuringPresentation = true
        searchController.delegate = self
        self.definesPresentationContext = true
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchResultsUpdater = resultController
    }
}
extension SearchUserViewController: UISearchControllerDelegate {
    
}
