//
//  SportDetailsProtocols.swift
//  SportsListApp
//
//  Created by Muhammad Salah on 10/5/21.
//

import Foundation

protocol SportDetailsViewProtocol {
    var presenter: SportDetailsPresenterProtocol! {get set}
    func showSportData(sport: Sport)
}

protocol SportDetailsInteractorInputProtocol {
    var presenter: SportDetailsInteractorOutputProtocol? {get set}
}

protocol SportDetailsInteractorOutputProtocol {
}

protocol SportDetailsPresenterProtocol {
    var view: SportDetailsViewProtocol? {get set}
    func updateViewData()
    
}

protocol SportDetailsRouterProtocol {}
