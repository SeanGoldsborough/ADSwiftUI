//
//  SiteDetailViewModel.swift
//  UserView
//
//  Created by Sean Goldsborough on 10/27/19.
//  Copyright © 2019 Sean Goldsborough. All rights reserved.
//


import Foundation
import SwiftUI
import Combine

class SitesDetailViewModel: ObservableObject {
    
    @Published var otherContactsArray = [Contacts]()
    @Published var isNotEditing: Bool = true
    @Published var showNetworkAlert = false
    @Published var imageName = ""
    
    var globalBool: Bool = true {
        didSet {
            // This will get called
            NSLog("Did Set" + globalBool.description)
        }
    }
    
    //TODO: Add CRUD functions
    
    func updateMainContact(buildingName: String, mainContact: String) {
        print("main contact updated")
    }
    
    func updateDetailInfo(phone: String, phone_home: String, email: String) {
        print("DetailInfo updated")
    }
    
    func placePhoneCall(phoneNumber: String) {
        print("place phone call tapped!")
    }
    
    func sendEmail(email: String) {
        print("send email tapped!")
    }
    
    func createOtherContactsArray(site: Sites) {
        self.otherContactsArray = site.contacts!
    }
    
    func toggleEdit() {
        isNotEditing.toggle()
        globalBool.toggle()
    }
}
