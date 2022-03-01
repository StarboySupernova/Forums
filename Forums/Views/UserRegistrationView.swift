//
//  RegistrationView.swift
//  Forums
//
//  Created by Simbarashe Dombodzvuku on 2/12/22.
//

import SwiftUI

struct UserRegistrationView: View {
    @Environment(\.dismiss) var dismiss
    /*
     Important note to self: If you’re targeting iOS 14 or below, you should use @Environment(\.presentationMode) var presentationMode and `presentationMode.wrappedValue.dismiss() instead.
     */
    @StateObject private var registerVM = RegisterViewModel()
    @ObservedObject private var userSettings = UserSettings()
    
    var body: some View {
        VStack {
            Spacer()
            
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
            
            Spacer()
            
            TextField("Enter username", text: $registerVM.username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
                .disableAutocorrection(true)
            TextField("email", text: $registerVM.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
                .disableAutocorrection(true)
            SecureField("password", text: $registerVM.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Toggle(isOn: $userSettings.isPrivate, label: {
                Text("Staff Account")
            })
                .padding()//full exclusivity to be implemented in future
            Button(action: {
                //userSettings.username = registerVM.username
                registerVM.register {
                    userSettings.username = registerVM.username
                    dismiss()
                }
            }, label: {
                Text("Create Account")
            })
            
            Spacer()
        }
    }
}

struct UserRegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        UserRegistrationView()
    }
}
