import UIKit

final class TableViewCell<Maker: BackingViewMaker>: UITableViewCell {
    let backed: Maker.View
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        let backingView = Maker.makeBackedView()
        self.backed = backingView
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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

extension TableViewCell {
    static func register(to tableView: UITableView) {
        tableView.register(self, forCellReuseIdentifier: Maker.View.reuseIdentifier)
    }
    static func dequeue(from tableView: UITableView, for indexPath: IndexPath, selectionStyle: UITableViewCell.SelectionStyle = .default, closure: ((Maker.View) -> Void)? = nil) -> TableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Maker.View.reuseIdentifier, for: indexPath) as! TableViewCell
        cell.selectionStyle = selectionStyle
        cell.update(closure)
        return cell
    }
}
