//
//  Parser.swift
//  AnalogueWatch
//
//  Created by John K on 22/11/2019.
//  Copyright © 2019 Liquidcoder. All rights reserved.
//

import Foundation

class Parser<T: Codable> {
    
    private var data: Data
    
    init(_ data: Data) {
        self.data = data
    }
    
    func parse(onCompletion: @escaping(( Result<T, Error>)->())) {
        DispatchQueue(label: "com.liquidcoder", qos: .background, attributes: .concurrent).async {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            do{
                let results = try decoder.decode(T.self, from: self.data)
                let result: Result<T, Error> = .success(results)
                onCompletion(result)
                
            }catch let error{
                let result: Result<T, Error> = .failure(error)
                onCompletion(result)
            }
        }
    }
}

