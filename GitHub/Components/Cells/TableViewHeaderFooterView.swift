import UIKit

final class TableViewHeaderFooterView<Maker: BackingViewMaker>: UITableViewHeaderFooterView {
    let backed: Maker.View
    override init(reuseIdentifier: String?) {
        let backingView = Maker.makeBackedView()
        self.backed = backingView
        super.init(reuseIdentifier: reuseIdentifier)
        backingView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(backingView)
        NSLayoutConstraint.activate([
            backingView.topAnchor.constraint(equalTo: contentView.topAnchor),
            backingView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backingView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            backingView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        backed.prepareForReuse()
    }
    
    func update(_ closure: ((Maker.View) -> Void)?) {
        if let closure = closure {
            closure(backed)
        }
    }
}

extension TableViewHeaderFooterView {
    static func register(to tableView: UITableView) {
        tableView.register(self, forHeaderFooterViewReuseIdentifier: Maker.View.reuseIdentifier)
    }
    static func dequeue(from tableView: UITableView, closure: ((Maker.View) -> Void)? = nil) -> TableViewHeaderFooterView {
        let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: Maker.View.reuseIdentifier) as! TableViewHeaderFooterView
        cell.update(closure)
        return cell
    }
}
