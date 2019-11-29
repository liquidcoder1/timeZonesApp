//
//  WebService.swift
//  AnalogueWatch
//
//  Created by John Kulimushi on 22/11/2019.
//  Copyright © 2019 Liquidcoder. All rights reserved.
//

import Foundation


class WebService {
    private var url: String
    
    init(url: String) {
        self.url = url
    }
    
    func get(completion: @escaping((Result<Data, Error>)->())) {
        guard let url = URL(string: self.url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(.failure(error!))
                return
            }
            completion(.success(data))
        }.resume()
    }
}

