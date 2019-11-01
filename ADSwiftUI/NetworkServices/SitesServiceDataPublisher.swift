//
//  SitesServicesDataPublisher.swift
//  UserView
//
//  Created by Sean Goldsborough on 11/1/19.
//  Copyright © 2019 Sean Goldsborough. All rights reserved.
//

import Foundation
import Foundation
import Combine

public protocol SitesServiceDataPublisher {
  func publisher() -> AnyPublisher<Data, URLError>
}
