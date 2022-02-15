//
//  LoginViewModel.swift
//  Forums
//
//  Created by Simbarashe Dombodzvuku on 2/15/22.
//

import Foundation
import Firebase
import SwiftUI

class LoginViewModel: ObservableObject {
    
    var email: String = ""
    var password: String = ""
    
    func login(completion: @escaping ()-> Void){

        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                completion() //if no error we can fire the completion, indicating that the login went through
            }
        }
        
    }
    
}
