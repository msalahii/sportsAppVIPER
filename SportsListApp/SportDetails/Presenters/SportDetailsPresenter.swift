//
//  SportDetailsPresenter.swift
//  SportsListApp
//
//  Created by Muhammad Salah on 10/5/21.
//

import Foundation

class SportDetailsPresenter: SportDetailsPresenterProtocol, SportDetailsInteractorOutputProtocol
{
    
    var view: SportDetailsViewProtocol?
    private var router: SportDetailsRouterProtocol?
    private var interactor: SportDetailsInteractorInputProtocol?
    private var sport: Sport
    
    init(view: SportDetailsViewProtocol, interactor: SportDetailsInteractorInputProtocol, router: SportDetailsRouterProtocol, sport: Sport) {
        self.router = router
        self.interactor = interactor
        self.view = view
        self.sport = sport
    }
    
    func updateViewData() {
        self.view?.showSportData(sport: self.sport)
    }
}
