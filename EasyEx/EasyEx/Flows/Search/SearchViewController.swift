//
//  SearchViewController.swift
//  EasyEx
//
//  Created by Aleksandr Fetisov on 06.07.2022.
//

import UIKit

class SearchViewController: UIViewController {
    
    var presenter: iSearchPresenter?
    private lazy var tableView: UITableView = {
        $0.register(SearchTableViewCell.self, forCellReuseIdentifier: SearchTableViewCell.description())
        return $0
    }(UITableView())
    
    private lazy var searchBar: UISearchBar = {
        $0.backgroundImage = UIImage()
        $0.searchBarStyle = .prominent
        return $0
    }(UISearchBar())
    
    override func loadView() {
        view = tableView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
    }
    
    func reloadView() {
        tableView.reloadData()
    }

}

extension SearchViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        section == .zero ? .zero : (presenter?.result.count ?? .zero)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.description(), for: indexPath)
            (cell as? SearchTableViewCell)?.configure(value: presenter?.result[indexPath.row] ?? [])
            return cell
        }
        return UITableViewCell()
    }

}

extension SearchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == .zero {
            return searchBar
        }
        return nil
    }
}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard searchText.count > 2 else { return }
        presenter?.search(searchText)
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        self.view.gestureRecognizers?.removeLast()
        return true
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
}
