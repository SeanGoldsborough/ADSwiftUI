//
//  SitesListRow.swift
//  UserView
//
//  Created by Sean Goldsborough on 11/1/19.
//  Copyright © 2019 Sean Goldsborough. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import UIKit

struct SiteListRowView: View {
    var site: Sites

    var body: some View {
        HStack {
            SitePicture(imageName: site.image!)
            SiteInfoView(site: site)
        }
    }
}
