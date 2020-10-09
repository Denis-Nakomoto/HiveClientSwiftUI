//
//  WorkersRow.swift
//  HiveClient
//
//  Created by Smart Cash on 20.02.2020.
//  Copyright © 2020 Denis Svetlakov. All rights reserved.
//

import SwiftUI
import SwiftKeychainWrapper

struct WorkersRow: View {
    
    var workerId = 00000
    @ObservedObject var networkingManager = FarmsDataRequest()
    @State var workersStatistics = WorkersStruct (data: [])
    var body: some View {
        List {
            ForEach (workersStatistics.data, id: \.id) { worker in
                    VStack{
                        Text("\(worker.name)")
                        Text("\(worker.platform)")
                    }
                }
        }.onAppear(){
            self.fetchData(workerId: self.networkingManager.farmData.data.first?.id ?? 00000)
        }
    }
    
    
    
    func fetchData (workerId: Int) {
            let myUrl = URL (string: "https://api2.hiveos.farm/api/v2/farms/\(workerId)/workers")
            print ("URL: \(String(describing: myUrl))")
            let accessToken: String? = KeychainWrapper.standard.string (forKey: "accessToken")
            var request = URLRequest (url: myUrl!)
            request.httpMethod = "GET"
            request.addValue("Bearer \(accessToken!)", forHTTPHeaderField: "Authorization")
            URLSession.shared.dataTask(with: request) {
                guard let json = $0 else {
                    print ("No data in response:\($2?.localizedDescription ?? "Unknown error").")
                    return
                }
                if let decoded = try? JSONDecoder().decode(WorkersStruct.self, from: json) {
                    print ("Workers \(decoded)")
                    DispatchQueue.main.async {
                        self.workersStatistics = decoded
                    }
                } else {
                    let dataString = String(decoding: json, as: UTF8.self)
                    print("Workers data: \(dataString)")
                }
            }.resume()
        }
}
//struct WorkersRow_Previews: PreviewProvider {
//    static var previews: some View {
//        WorkersRow(workersStatistics: WorkersStruct())
//    }
//}
