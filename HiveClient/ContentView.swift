//
//  ContentView.swift
//  HiveClient
//
//  Created by Smart Cash on 26.03.2020.
//  Copyright © 2020 Denis Svetlakov. All rights reserved.
//

import SwiftUI
import SwiftKeychainWrapper

struct ContentView: View {
    @ObservedObject var networkingManager = FarmsDataRequest()
    var applicationState: Bool {
        if networkingManager.httpResponse <= 201 {
           return true
        }
        return false
    }
    
    var body: some View {
            if applicationState {
                return AnyView(FarmView())
            }
            else { return AnyView(LoginView())
            }
    }
}
