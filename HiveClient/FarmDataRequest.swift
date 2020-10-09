//
//  NetworkingManager.swift
//  HiveClient
//
//  Created by Smart Cash on 23.01.2020.
//  Copyright © 2020 Denis Svetlakov. All rights reserved.
//

import SwiftUI
import Combine
import SwiftKeychainWrapper


class FarmsDataRequest: ObservableObject {
    
    @Published var farmData = FarmModel (data: [])
    @Published var httpResponse: Int = 400
    init () {
        self.fetchData()
    }
    
    func fetchData () {
        let myUrl = URL (string: "https://api2.hiveos.farm/api/v2/farms")
        let accessToken: String? = KeychainWrapper.standard.string (forKey: "accessToken")
        if accessToken != nil {
            var request = URLRequest (url: myUrl!)
            request.httpMethod = "GET"
            request.addValue("Bearer \(accessToken!)", forHTTPHeaderField: "Authorization")
            URLSession.shared.dataTask(with: request) {
                if let httpResponse = $1 as? HTTPURLResponse {
                    print (httpResponse.statusCode)
                    // MARK: - HHTP Response to main queue
                    DispatchQueue.main.async {
                        self.httpResponse = httpResponse.statusCode
                    }} else {
                    assertionFailure("unexpected response")
                }
                guard let json = $0 else {
                    print ("No data in response:\($2?.localizedDescription ?? "Unknown error").")
                    return
                }
                // MARK: - Parse data
                if let decoded = try? JSONDecoder().decode(FarmModel.self, from: json){
                    // MARK: - Parsed data to main queue
                    DispatchQueue.main.async {
                        self.farmData = decoded
                    }
                } else {
                    let dataString = String(decoding: json, as: UTF8.self)
                    print("Farm data: \(dataString)")
                }
            }
            .resume()
        }
        else {
            return
        }
        return
    }
}

