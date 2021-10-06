//
//  SportsListRouter.swift
//  SportsListApp
//
//  Created by Muhammad Salah on 10/4/21.
//

import Foundation
import UIKit

class SportsListRouter: SportsListRouterProtocol{
    
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        let router = SportsListRouter()
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(identifier: "SportsListViewController") as! SportsListViewController
        let interactor = SportsListInteractor()
        let presenter = SportsListPresenter(view: view, interactor: interactor, router: router)
        interactor.presenter = presenter
        view.presenter = presenter
        router.viewController = view
        return view
    }
    
    func navigateToSportDetailsScreen(sport: Sport) {
        let sportDetailsViewController = SportDetailsRouter.createModule(sport: sport)
        viewController?.navigationController?.pushViewController(sportDetailsViewController, animated: true)
    }
}
