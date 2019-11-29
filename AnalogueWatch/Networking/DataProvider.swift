//
//  DataProvider.swift
//  AnalogueWatch
//
//  Created by John K on 22/11/2019.
//  Copyright © 2019 Liquidcoder. All rights reserved.
//

import Foundation

class DataProvider<T: Codable> {
    
    var service: WebService
    
    init(service: WebService) {
        self.service = service
    }
    
    func provide(completion: @escaping((Result<T, Error>)->()))  {
        
        service.get { result in
            switch result{
            case .success(let data):
                let parser = Parser<T>(data)
                parser.parse(onCompletion: { parsedResult in
                    completion(parsedResult)
                })
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

