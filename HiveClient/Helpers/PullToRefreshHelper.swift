//
//  PullToRefresh.swift
//  HiveClient
//
//  Created by Smart Cash on 12.03.2020.
//  Copyright © 2020 Denis Svetlakov. All rights reserved.
//
import UIKit
import Foundation
import SwiftUI

struct CustomScrollView : UIViewRepresentable {
    
    var width : CGFloat
    var height : CGFloat
    
    @ObservedObject var networkingManager = FarmsDataRequest()
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self, model: networkingManager)
    }
func makeUIView(context: Context) -> UIScrollView {
        let control = UIScrollView()
        control.refreshControl = UIRefreshControl()
        control.refreshControl?.addTarget(context.coordinator, action:
            #selector(Coordinator.handleRefreshControl),
                                          for: .valueChanged)
let childView = UIHostingController(rootView: FarmViewRow(networkingManager: networkingManager))
        childView.view.frame = CGRect(x: 0, y: 0, width: width, height: height)
        
        control.addSubview(childView.view)
        return control
    }
func updateUIView(_ uiView: UIScrollView, context: Context) {}
class Coordinator: NSObject {
        var control: CustomScrollView
        var model : FarmsDataRequest
init(_ control: CustomScrollView, model: FarmsDataRequest) {
            self.control = control
            self.model = model
        }
@objc func handleRefreshControl(sender: UIRefreshControl) {
            sender.endRefreshing()
            model.fetchData()
        }
    }
}
