//
//  OpenURL.swift
//  Common
//
//  Created by 신동규 on 8/22/24.
//

import Foundation
import SwiftUI

public func openURL(url: URL, completionHandler: ((Bool) -> Void)? = nil) {
    UIApplication.shared.open(url, completionHandler: completionHandler)
}

public func openURL(url: String, completionHandler: ((Bool) -> Void)? = nil) {
    guard let url = URL(string: url) else {
        completionHandler?(false)
        return
    }
    openURL(url: url, completionHandler: completionHandler)
}
