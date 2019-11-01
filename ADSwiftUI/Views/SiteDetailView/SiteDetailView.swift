//
//  ContentView.swift
//  SwiftUIStacks
//
//  Created by Sean Goldsborough on 10/29/19.
//  Copyright © 2019 Sean Goldsborough. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import UIKit

struct SiteDetailView: View {
    
    @ObservedObject var sitesDetailViewModel = SitesDetailViewModel()
    @ObservedObject var image = ImageLoader()
    
    @State var showingSheet = false
    @State var showingAlert = false
    @State var hasContactInfo = true
    @State var hasOtherContacts = false
    
    @State var name: String
    @State var email: String
    
    @State var isNotEditing = true
    @State var site: Sites
    
    @ObservedObject var keyboardHandler = KeyboardFollower()

    var body: some View {
        
        VStack{
            //first 3rd
            MainContactView(sitesDetailViewModel: self.sitesDetailViewModel, site: self.site, isNotEditing: self.$sitesDetailViewModel.globalBool, image: self.image, buildingName: self.site.name!, contactName: self.site.contacts?.first?.name ?? "N/A", imageName: self.site.image ?? "N/A")
            
            //second 3rd
            DetailInfoView(site: self.site, isNotEditing: self.sitesDetailViewModel.isNotEditing, sitesDetailViewModel: self.sitesDetailViewModel, showingSheet: self.showingSheet, showingAlert: self.showingAlert, hasContactInfo: self.hasOtherContacts, hasOtherContacts: self.hasOtherContacts, address: self.site.address ?? "N/A", phone: self.site.contacts?.first?.phone ?? "N/A",phoneHome: self.site.contacts?.first?.phone_home ?? "N/A", email:self.site.contacts?.first?.email ?? "N/A")

           //last 3rd
            ContactListView(sitesDetailViewModel: self.sitesDetailViewModel, site: self.site, isNotEditing: self.sitesDetailViewModel.isNotEditing, showingSheet: self.showingSheet, showingAlert: self.showingAlert)
            
        }.padding(.bottom, keyboardHandler.keyboardHeight)
                                   
        .navigationBarItems(trailing:
            Button(action: {
                print("Edit Contact tapped!")
                self.sitesDetailViewModel.toggleEdit()
                print("Edit Contact = \(self.isNotEditing)")
                print("VModel Edit Contact = \(self.sitesDetailViewModel.isNotEditing)")
            }) {
                Image(systemName: "pencil").font(.largeTitle)
            }
        )

        .onAppear {self.keyboardHandler.subscribe()}
        .onDisappear{self.keyboardHandler.unsubscribe()}
    }
}
