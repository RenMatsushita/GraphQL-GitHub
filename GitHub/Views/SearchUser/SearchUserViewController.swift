//
//  SearchUserViewController.swift
//  GitHub
//
//  Created by 築山朋紀 on 2020/01/21.
//

import UIKit
import GitHubCore

final class SearchUserViewController: UIViewController, SearchUserViewProtocol {
    
    private let tableView = UITableView(frame: .zero, style: .grouped)
    
    var presenter: SearchUserPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
}

extension SearchUserViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
