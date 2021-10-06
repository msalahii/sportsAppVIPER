//
//  SportsListProtocols.swift
//  SportsListApp
//
//  Created by Muhammad Salah on 10/4/21.
//

import Foundation
import UIKit


protocol SportsListViewProtocol {
    var presenter: SportsListPresenterProtocol! {get set}
    func reloadTableData()
}

protocol SportsListInteractorInputProtocol {
    var presenter: SportsListInteractorOutputProtocol? {get set}
    func getSports()
}

protocol SportsListInteractorOutputProtocol : AnyObject {
    func sportsFetchedSuccessfully(sportsList: [Sport])
    func sportsListFetchingFailed(withError error: Error)
}

protocol SportsListPresenterProtocol {
    var view: SportsListViewProtocol? {get set}
    var numberOfRows: Int {get}
    func viewDidLoad()
    func configureTableCell(indexPath: IndexPath, cell: UITableViewCell)
    func onTableCellTapped(indexPath: IndexPath)
}

protocol SportsListRouterProtocol {
    func navigateToSportDetailsScreen(sport: Sport)
}
