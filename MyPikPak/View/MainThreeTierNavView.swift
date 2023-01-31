//
//  MainThreeTierNavView.swift
//  MyPikPak
//
//  Created by Haoyu Wang on 1/29/23.
//

import SwiftUI

struct MainThreeTierNavView: View {
    @EnvironmentObject var authorizationService: AuthorizationService
    
    @State private var columnVisibility = NavigationSplitViewVisibility.all
    @State private var selectedSidebar: SidebarItem?
    
    private var title: String {
        if let selectedSidebar {
            return selectedSidebar.rawValue
        }
        return "MyPicPak"
    }
    
    
    enum SidebarItem: String, CaseIterable, Identifiable {
        case all = "All Files"
        case recently = "Recently"
        case upload = "Upload"
        case download = "Download"
        case trash = "Trash"
        case settings = "Settings"
        
        var id: Self {
            return self
        }
    }
    
    var body: some View {
        NavigationSplitView(columnVisibility: $columnVisibility) {
            List(SidebarItem.allCases, selection: $selectedSidebar) {
                leadingIconView(title: $0.rawValue)
            }
            .navigationSplitViewColumnWidth(min: 150, ideal: 150)
            
        } content: {
            Text("Content")
                .navigationTitle(title)
        } detail: {
            Text("Detail")
            Button("Sign out") {
                authorizationService.signOut()
            }
        }
        
    }
}

extension MainThreeTierNavView {
    @ViewBuilder
    func leadingIconView(title: String, image: String = "") -> some View {
        HStack(alignment: .center) {
            Color.blue
                .frame(width: 32, height: 32)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            Text(title)
                .font(.headline)
                .monospaced()
        }
        .frame(width: 40, height: 40, alignment: .center)
    }
}

struct MainThreeTierNavView_Previews: PreviewProvider {
    static var previews: some View {
        MainThreeTierNavView()
            .environmentObject(AuthorizationService.example)
    }
}
