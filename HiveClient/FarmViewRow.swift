//
//  FarmPage.swift
//  HiveClient
//
//  Created by Smart Cash on 26.12.2019.
//  Copyright © 2019 Denis Svetlakov. All rights reserved.


import SwiftUI
import Combine
import SwiftKeychainWrapper


struct FarmViewRow: View {
    
    @ObservedObject var networkingManager = FarmsDataRequest()
    var body: some View {
        NavigationLink (destination: WorkersRow()){
            List {
                VStack {
                    if networkingManager.farmData.data.first?.rigsCount != 0 {
                        RigsView()
                    }
                    else {
                        AsicsView()
                    }
                }
                .navigationBarTitle("Your Farms")
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(trailing:
                                        HStack {
                                            Button(action: {self.refresh()}) {
                                                Image(systemName: "arrow.2.circlepath")
                                            }
                                        })
            }
        }
    }
    // MARK: Refresh button method
    func refresh () {
        self.networkingManager.fetchData()
    }
}
extension FarmViewRow {
    struct RigsView: View {
        @ObservedObject var networkingManager = FarmsDataRequest()
        var body: some View {
            ForEach (networkingManager.farmData.data, id: \.id) { farm in
                VStack (alignment: .leading){
                    Text ("\(farm.name)")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    Spacer()
                    HStack {
                        VStack (alignment: .leading){
                            HStack{
                                Text (String(farm.stats!.workersOnline))
                                    .font(.headline)
                                    .foregroundColor(.green)
                                if farm.stats!.workersOffline != 0 {
                                    Text (String(farm.stats!.workersOffline))
                                        .font(.headline)
                                        .foregroundColor(.red)
                                }
                            }
                            
                            Text ("WORKERS")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        VStack (alignment: .leading){
                            HStack {
                                Text (String(farm.stats!.gpusOnline))
                                    .font(.headline)
                                    .foregroundColor(.green)
                                if farm.stats!.gpusOffline != 0 {
                                    Text (String(farm.stats!.gpusOffline))
                                        .font(.headline)
                                        .foregroundColor(.red)
                                }
                            }
                            Text ("GPUs")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        if farm.stats!.gpusOverheated != 0 {
                            HStack (alignment:.bottom) {
                                Image(systemName: "flame")
                                Text (String(farm.stats!.gpusOverheated))
                                    .font(.headline)
                                    .foregroundColor(.yellow)
                            }
                        }
                        Spacer()
                        VStack(alignment: .leading)
                        {
                            Text ("\(farm.stats!.asr, specifier: "%g")%")
                                .font(.headline)
                            Text ("EFECTIVENCY")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        Text ("\(farm.stats!.powerDraw)kW")
                            .font(.headline)
                            .foregroundColor(.blue)
                            .padding()
                    }
                    Spacer()
                    HStack {
                        VStack (alignment: .leading) {
                            Text ("\(farm.money!.balance, specifier: "%.2f")$")
                                .font(.headline)
                            Text ("BALANCE")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        VStack (alignment: .leading) {
                            if farm.money!.isFree == true {
                                Text ("FREE per day")
                                    .font(.headline)
                                    .padding()
                            } else {
                                Text ("Your daily cost is \(String (format: "%g", farm.money!.dailyCost))$")
                                    .font(.headline)
                            }
                        }
                    }
                }
            }
        }
    }
}
extension FarmViewRow {
    struct AsicsView: View {
        @ObservedObject var networkingManager = FarmsDataRequest()
        var body: some View {
            ForEach (networkingManager.farmData.data, id: \.id) { farm in
                VStack (alignment: .leading){
                    Text ("\(farm.name)")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    Spacer()
                    HStack {
                        VStack (alignment: .leading){
                            HStack{
                                Text (String(farm.stats!.asicsOnline))
                                    .font(.headline)
                                    .foregroundColor(.green)
                                if farm.stats!.asicsOffline != 0 {
                                    Text (String(farm.stats!.asicsOffline))
                                        .font(.headline)
                                        .foregroundColor(.red)
                                }
                            }
                            
                            Text ("ASICS")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        VStack (alignment: .leading){
                            HStack {
                                Text (String(farm.stats!.boardsOnline))
                                    .font(.headline)
                                    .foregroundColor(.green)
                                if farm.stats!.boardsOffline != 0 {
                                    Text (String(farm.stats!.boardsOffline))
                                        .font(.headline)
                                        .foregroundColor(.red)
                                }
                            }
                            Text ("BOARDS")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        if farm.stats!.boardsOverheated != 0 {
                            HStack (alignment:.bottom) {
                                Image(systemName: "flame")
                                Text (String(farm.stats!.boardsOverheated))
                                    .font(.headline)
                                    .foregroundColor(.yellow)
                            }
                        }
                        Spacer()
                        VStack(alignment: .leading)
                        {
                            Text ("\(farm.stats!.asr)%")
                                .font(.headline)
                            Text ("EFECTIVENCY")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        Text ("\(farm.stats!.powerDraw) kW")
                            .font(.headline)
                            .foregroundColor(.blue)
                    }
                    Spacer()
                    HStack {
                        VStack (alignment: .leading) {
                            Text (String(format: "%.g", "\(farm.money!.balance)$"))
                                .font(.headline)
                            Text ("BALANCE")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
        }
    }
}

