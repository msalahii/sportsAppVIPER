//
//  SportsAPI.swift
//  SportsListApp
//
//  Created by Muhammad Salah on 10/5/21.
//

import Foundation
import Moya

public enum SportsAPI{
    case fetchSportsList
}

extension SportsAPI:TargetType{
    public var baseURL: URL {
        return URL(string: "https://www.thesportsdb.com/api/v1/json/1")!
    }
    
    public var path: String {
        switch self {
        case .fetchSportsList:
            return "/all_sports.php"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .fetchSportsList:
            return .get
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        return .requestPlain
    }
    
    public var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    
    public var validationType: ValidationType {
        return .successCodes
      }
}
