import UIKit
import RxSwift
import RxCocoa

final class SearchUserDataSource: NSObject, UITableViewDataSource, RxTableViewDataSourceType {
    typealias Element = [String]
    var items: Element = []
    func tableView(_ tableView: UITableView, observedEvent: Event<Element>) {
        Binder<Element>(self) { dataSource, element in
            dataSource.items = element
            tableView.reloadData()
        }.on(observedEvent)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        return TableViewCell<UserContentView>.dequeue(from: tableView, for: indexPath) { view in
            view.update(for: item)
        }
    }
}
