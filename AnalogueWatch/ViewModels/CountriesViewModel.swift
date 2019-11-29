//
//  CountriesViewModel.swift
//  AnalogueWatch
//
//  Created by John K on 22/11/2019.
//  Copyright © 2019 Liquidcoder. All rights reserved.
//

import Foundation


class AreaLocationModel: ObservableObject {
    
    @Published
    var areaLocationMap = [String:[Location]]()
    
    init() {
            self.getCountries()
    }
    
    func getCountries() {
        if let path = Bundle.main.path(forResource: "countries", ofType: "json") {
            do {
                let fileUrl = URL(fileURLWithPath: path)
                // Getting data from JSON file using the file URL
                let data = try Data(contentsOf: fileUrl, options: .mappedIfSafe)
                
                let parser = Parser<AreaLocation>(data)
                let result = parser.parse()
                
                switch result {
                case .success(let areaLocationMap ):
                    self.areaLocationMap = areaLocationMap
                case .failure(let error):
                    print(error)
                }
            } catch let e{
                print(e)
            }
        }
    }
}
