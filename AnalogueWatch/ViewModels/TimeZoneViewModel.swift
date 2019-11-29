//
//  TimeZoneListVM.swift
//  AnalogueWatch
//
//  Created by John K on 23/11/2019.
//  Copyright © 2019 Liquidcoder. All rights reserved.
//

import Foundation

struct TimeZoneViewModel {
        
   static func getTimeZone(for country: String, completion: @escaping((_ timezone: TimeZone)->())) {
        let url = "https://worldtimeapi.org/api/timezone/\(country).json"
        
        let webService = WebService(url: url)
        let provider = DataProvider<RemoteTimeZone>(service: webService)
        provider.provide { result in
            switch result{
            case .success(let response):
                DispatchQueue.main.async {
                    completion(TimeZone(from: response))
                }
                
            case .failure(let error):
                print("\(error)")
            }
        }
    }
}
