//
//  SportsListPresenter.swift
//  SportsListApp
//
//  Created by Muhammad Salah on 10/4/21.
//

import Foundation
import UIKit

class SportsListPresenter: SportsListPresenterProtocol, SportsListInteractorOutputProtocol{
    
    var view: SportsListViewProtocol?
    private let router: SportsListRouterProtocol?
    private let interactor: SportsListInteractorInputProtocol?
    private var sportsList = [Sport]()
    
    init(view: SportsListViewProtocol, interactor: SportsListInteractorInputProtocol, router: SportsListRouterProtocol) {
        self.interactor = interactor
        self.router = router
        self.view = view
    }
    
    var numberOfRows: Int {return sportsList.count}
    
    func sportsFetchedSuccessfully(sportsList: [Sport]) {
        print("Fetch SUCCESS")
        self.sportsList.append(contentsOf: sportsList)
        view?.reloadTableData()
    }
    
    func sportsListFetchingFailed(withError error: Error) {
        print("Loading Failed")
    }
    
    func configureTableCell(indexPath: IndexPath, cell: UITableViewCell) {
        cell.textLabel?.text = sportsList[indexPath.row].name
    }
    
    func viewDidLoad() {
         interactor?.getSports()
    }
    
    func onTableCellTapped(indexPath: IndexPath)
    {
        self.router?.navigateToSportDetailsScreen(sport: self.sportsList[indexPath.row])
    }
}
