//
//  SportsListRemoteDataSource.swift
//  SportsListApp
//
//  Created by Muhammad Salah on 10/5/21.
//

import Foundation
import Moya


//protocol SportsListRemoteDataSourceProtocol{
////    var provider: MoyaProvider<SportsAPI> {get}
//    func getSportsList()
//}

//: SportsListRemoteDataSourceProtocol

class SportsListRemoteDataSource
{
    let provider = MoyaProvider<SportsAPI>()
//    state = .loading
    
    func getSportsList() {
        provider.request(.fetchSportsList){ /*[weak self]*/ result in
//            guard let self = self else {return}
            switch result{
                case .success(let response):
                    do {
                        print(try response.mapJSON())
                        let sportsList: [Sport] = try! JSONDecoder().decode([Sport].self, from: response.data)
//                        self.
//                        return guard let sportsList = sportsList else {return}
                    } catch  {
                        print("Casting JSON ERROR Exception")
//                        self.state = .error
                    }
            case .failure:
//                self.state = .error
            print("Request FAILURE")
            }
        }
        }
    
    
}
