//
//  ViewController.swift
//  SportsListApp
//
//  Created by Muhammad Salah on 10/4/21.
//

import UIKit

class SportsListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, SportsListViewProtocol  {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var presenter: SportsListPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "All Sports"
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        tableView.isHidden = true
        setupTableView()
        presenter.viewDidLoad()
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        presenter.configureTableCell(indexPath: indexPath, cell: cell)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.onTableCellTapped(indexPath: indexPath)
    }
    
    func showLoadingIndicator() {
        
        print("Should show loading indicator")
    }
    
    func hideLoadingIndicator() {
        print("Should hide loading indicator")
    }
    
    func reloadTableData() {
        tableView.reloadData()
        activityIndicator.stopAnimating()
        tableView.isHidden = false
    }
}


