//
//  SportsListInteractor.swift
//  SportsListApp
//
//  Created by Muhammad Salah on 10/4/21.
//

import Foundation
import Moya
import SwiftyJSON

class SportsListInteractor: SportsListInteractorInputProtocol{
    
    let provider = MoyaProvider<SportsAPI>()
    
    var presenter: SportsListInteractorOutputProtocol?
    
    func getSports() {
        provider.request(.fetchSportsList)
            { (result) in
            switch result{
            case .success(let response):
                let json = JSON(response.data)
                let sportsList: [Sport] = try! JSONDecoder().decode([Sport].self, from: json["sports"].rawData())
                self.presenter?.sportsFetchedSuccessfully(sportsList: sportsList)
            case .failure(let error):
                self.presenter?.sportsListFetchingFailed(withError: error)
            }
        }
    }
}
