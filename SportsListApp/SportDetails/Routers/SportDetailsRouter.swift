//
//  SportDetailsRouter.swift
//  SportsListApp
//
//  Created by Muhammad Salah on 10/5/21.
//

import Foundation
import UIKit


class SportDetailsRouter : SportDetailsRouterProtocol{
    static func createModule(sport: Sport) -> UIViewController{
        
        let router = SportDetailsRouter()
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(identifier: "SportDetailsViewController") as! SportDetailsViewController
        let interactor = SportDetailsInteractor()
        let presenter = SportDetailsPresenter(view: view, interactor: interactor, router: router, sport: sport)
        
        presenter.view = view
        interactor.presenter = presenter
        view.presenter = presenter

        return view
    }
}
