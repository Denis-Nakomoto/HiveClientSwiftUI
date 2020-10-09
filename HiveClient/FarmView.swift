//
//  FarmViewPullToRefresh.swift
//  HiveClient
//
//  Created by Smart Cash on 12.03.2020.
//  Copyright © 2020 Denis Svetlakov. All rights reserved.
//

import SwiftUI

struct FarmView: View {
    var body: some View {
        NavigationView {
            GeometryReader{
        geometry in
                CustomScrollView(width: geometry.size.width, height: geometry.size.height)
        }
    }
}
}
