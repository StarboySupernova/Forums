//
//  View+Extensions.swift
//  Forums
//
//  Created by Simbarashe Dombodzvuku on 2/8/22.
//

import Foundation
import SwiftUI

extension View {
    
    func embedInNavigationView() -> some View {
        NavigationView { self }
    }
    
}
