//
//  AreaLocationViewModel.swift
//  AnalogueWatch
//
//  Created by John K. on 25/11/2019.
//  Copyright © 2019 Liquidcoder. All rights reserved.
//

import Foundation

typealias AreaLocation = [String: [Location]]


class AreaLocationViewModel: ObservableObject {
    
    
    @Published
    var areaLocationMap = AreaLocation()
    
    init() {
            self.getCountries()
    }
    
    func getCountries() {
        if let path = Bundle.main.path(forResource: "areaslocations", ofType: "json") {
            do {
                let fileUrl = URL(fileURLWithPath: path)
//              Getting data from JSON file using the file URL
                let data = try Data(contentsOf: fileUrl, options: .mappedIfSafe)
                
                let parser = Parser<AreaLocation>(data)
                parser.parse(onCompletion:{ result in
                    switch result {
                    case .success(let areaLocationMap ):
                        DispatchQueue.main.asyncAfter(deadline:  .now() + 0.5) {
                            self.areaLocationMap = areaLocationMap
                        }
                    case .failure(let error):
                        print(error)
                    }
                })
                
            } catch let e{
                print(e)
            }
        }
    }
}
