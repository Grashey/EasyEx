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
        $0.dataSource = self
        $0.delegate = self
        return $0
    }(UITableView())

    private lazy var searchController: UISearchController = {
        $0.searchBar.searchBarStyle = .prominent
        $0.searchBar.placeholder = SearchConsts.searchBarPlaceholder
        $0.searchBar.sizeToFit()
        $0.obscuresBackgroundDuringPresentation = false
        $0.searchResultsUpdater = self
        $0.searchBar.delegate = self
        return $0
    }(UISearchController())

    override func loadView() {
        view = tableView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = SearchConsts.mainTitle
        navigationItem.searchController = searchController
    }
    func reloadView() {
        tableView.reloadData()
    }
    private func dismissKeyboard() {
        searchController.searchBar.endEditing(true)
    }
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.result.count ?? .zero
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.description(), for: indexPath)
        if let security = presenter?.result[indexPath.row] {
            (cell as? SearchTableViewCell)?.configure(value: security)
        }
        return cell
    }
}

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        dismissKeyboard()
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            presenter?.clear()
        }
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        presenter?.clear()
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        dismissKeyboard()
    }
}

extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.searchTextField.text, text.count > 2 else { return }
        presenter?.search(text)
    }
}

extension SearchViewController: UIScrollViewDelegate {
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        dismissKeyboard()
    }
}
