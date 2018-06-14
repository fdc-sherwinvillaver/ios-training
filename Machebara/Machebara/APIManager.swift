//
//  APIManager.swift
//  Machebara
//
//  Created by Lester  Padul on 13/06/2018.
//  Copyright © 2018 Lester  Padul. All rights reserved.
//

import Foundation
import Alamofire
import PromiseKit

class APIManager {
    
    static let shared = APIManager()
    
    private init() {
        
    }
    
    func fetchActorsFromApi() -> Promise<[Actor]> {
        return Promise<[Actor]> { promise in
            Alamofire.request(API_URL).responseString {
                response in
                switch(response.result){
                case .success(let responseString):
                    print(responseString)
                    let actorResponse = ActorApiResponse(JSONString:"\(responseString)")!
                    promise.fulfill(actorResponse.actors!)
                case .failure(let error):
                    print(error)
                    promise.reject(error)
                }
            }
        }
    }
}
