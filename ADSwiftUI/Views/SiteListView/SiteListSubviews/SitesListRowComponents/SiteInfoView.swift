//
//  SiteDetailsView.swift
//  UserView
//
//  Created by Sean Goldsborough on 11/1/19.
//  Copyright © 2019 Sean Goldsborough. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine

struct SiteInfoView: View {
    //var site: Site
     @State var site: Sites

    var body: some View {
        HStack{
            VStack(alignment: .leading) {
                Text(site.name!)
                    .font(.headline)
                    .foregroundColor(.primary)
                Text(site.address!)
                    .foregroundColor(.secondary)
                    .font(.body)
            }
        }
    }
}
