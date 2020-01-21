import UIKit
import GitHubCore

final class SearchUserViewController: UIViewController, SearchUserViewProtocol {
    
    private let tableView = UITableView(frame: .zero, style: .grouped)
    private lazy var searchController = UISearchController(searchResultsController: self.resultController)
    private let resultController = SearchResultViewBuilder.make()
    
    var presenter: SearchUserPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        navigationItem.title = "GitHub"
        
        configureTableView()
        configureSearchController()
    }
    private func configureTableView() {
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.tableFooterView = .init()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    private func configureSearchController() {
        searchController.hidesNavigationBarDuringPresentation = true
        searchController.delegate = self
        self.definesPresentationContext = true
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchResultsUpdater = resultController
    }
}

extension SearchUserViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
extension SearchUserViewController: UISearchControllerDelegate {
    
}
