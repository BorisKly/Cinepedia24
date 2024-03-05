//
//  ListViewController.swift
//  Cinepedia24
//
//  Created by Borys Klykavka on 24.02.2024.
//

import UIKit

protocol ListViewControllerProtocol: AnyObject {
    func reloadData()
    func showLoadingView()
    func hideLoadingView()
    func setupSearchView()
    func setupCollectionView()
    func setupTableView()
    func setUpView()
}

final class ListViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var pageController: UIPageControl!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var presenter: ListPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        setupCollectionView()
        setupTableView()
        setupSearchView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewDidLoad()
        presenter.viewWillAppear()
    }
   
    
    @IBAction func pageControllerAction(_ sender: Any) {
        print(#function)
        self.collectionView.scrollToItem(at: IndexPath(row: (sender as AnyObject).currentPage, section: 0), at: .centeredHorizontally, animated: true)
    }
    
}

extension ListViewController: ListViewControllerProtocol, ActivityIndicatorLoading {
    
    func reloadData() {
          collectionView.reloadData()
          pageController.numberOfPages = presenter.numberOfItemsInSection()
          tableView.reloadData()
    }

    func setupSearchView() {
        navigationItem.titleView = searchBar
        searchBar.delegate = self
        searchBar.showsCancelButton = true
    }
    
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(cellType: MovieBannerCollectionViewCell.self)

        collectionView.isPagingEnabled = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.decelerationRate = .fast
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cellType: MovieListTableViewCell.self)
    }
    
    func setUpView() {
        setAccessibilityIdentifiers()
        self.navigationController?.navigationBar.tintColor = .black
    }
    
    func showLoadingView() {
        showLoading()
    }
    
    func hideLoadingView() {
        hideLoading()
    }
}





