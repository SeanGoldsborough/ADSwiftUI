//
//  ContentView.swift
//  UserView
//
//  Created by Sean Goldsborough on 10/25/19.
//  Copyright © 2019 Sean Goldsborough. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import UIKit

struct SiteListView: View {
    
    @ObservedObject var sitesListViewModel = SitesListViewModel()

    var body: some View {
        NavigationView {
            
            List(self.sitesListViewModel.sites) { item in
                
                NavigationLink(destination: SiteDetailView(sitesDetailViewModel: SitesDetailViewModel(), name: "", email: "", isNotEditing: true, site: item)) {
                    SiteListRowView(site: item)
                }
                
            }.navigationBarTitle(Text("All Sites"))
            .navigationBarHidden(true)
            
        }.onAppear {
            self.sitesListViewModel.getData()
        }
    }
}
