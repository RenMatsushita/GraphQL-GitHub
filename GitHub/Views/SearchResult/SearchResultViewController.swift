import UIKit
import RxSwift
import RxCocoa

final class SearchResultViewController: UIViewController, SearchResultViewProtocol {
    private let querySubject = PublishSubject<String>()
    var query: Observable<String> {
        return querySubject
    }
    
    private let tableView = UITableView(frame: .zero, style: .grouped)
    
    var presenter: SearchResultPresenter!
    private let dataSource = SearchResultDataSource()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        configureTableView()
        
        presenter.items
            .drive(tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }
    private func configureTableView() {
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        TableViewCell<UserContentView>.register(to: tableView)
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
extension SearchResultViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
extension SearchResultViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let query = searchController.searchBar.searchTextField.text ?? ""
        querySubject.onNext(query)
    }
}
