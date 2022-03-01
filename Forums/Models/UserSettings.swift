//
//  UserSettings.swift
//  Forums
//
//  Created by Simbarashe Dombodzvuku on 2/15/22.
//

import Foundation
import Combine

class UserSettings: ObservableObject {
    @Published var username: String {
        didSet{
            //using older method in lieu of @AppStorage, for learning purposes since I used @AppStorage in HIITFit
            UserDefaults.standard.set(username, forKey: "username")
        }
    }
    
    @Published var isPrivate: Bool {
        didSet {
            UserDefaults.standard.set(isPrivate, forKey: "isAccountPrivate")
        }
    }
    
    init() {
        self.username = UserDefaults.standard.object(forKey: "username") as? String ?? ""
        self.isPrivate = UserDefaults.standard.object(forKey: "isAccountPrivate") as? Bool ?? false
        //By default, we’re going to keep user account private.
    }
}
