//
//  MainThreeTierNavView.swift
//  MyPikPak
//
//  Created by Haoyu Wang on 1/29/23.
//

import SwiftUI

struct MainThreeTierNavView: View {
    @State private var columnVisibility = NavigationSplitViewVisibility.all
    
    var body: some View {
        NavigationSplitView(columnVisibility: $columnVisibility) {
            VStack(alignment: .leading) {
                Text("All Files")
                Text("Recently Added")
                Text("Upload")
                Text("Download")
                Text("Recycle Bin")
                Spacer()
                Text("Settings")
            }
            .monospaced()
            .padding(.vertical)
            .navigationSplitViewColumnWidth(ideal: 100)
        } content: {
            EmptyView()
        } detail: {
            EmptyView()
        }

    }
}

struct MainThreeTierNavView_Previews: PreviewProvider {
    static var previews: some View {
        MainThreeTierNavView()
    }
}
