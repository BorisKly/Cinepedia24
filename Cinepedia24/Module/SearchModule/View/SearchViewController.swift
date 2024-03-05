//
//  SearchViewController.swift
//  Cinepedia24
//
//  Created by Borys Klykavka on 03.03.2024.
//
import UIKit

protocol SearchViewControllerProtocol: AnyObject {
    func reloadData()
    func showLoadingView()
    func hideLoadingView()
    func setupTableView()
    func getSearchText() -> String?
}

final class SearchViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var searchText: String?
    var presenter: SearchPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        setAccessibilityIdentifiers()
    }
}

extension SearchViewController: SearchViewControllerProtocol, ActivityIndicatorLoading {
    
    func reloadData() {
        tableView.reloadData()
    }
    
    func showLoadingView() {
        showLoading()
    }
    
    func hideLoadingView() {
        hideLoading()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cellType: SearchTableViewCell.self)
    }
    
    func getSearchText() -> String? {
        return searchText
    }
    
}

