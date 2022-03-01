//
//  ContentView.swift
//  Forums
//
//  Created by Simbarashe Dombodzvuku on 2/8/22.
//

import SwiftUI

struct ContentView: View {
    @State private var isActive: Bool = false
    @State private var showUserRegistrationSheet = false
    @ObservedObject var loginVM = LoginViewModel()
    @ObservedObject var userSettings = UserSettings()
    
    var body: some View {
        VStack {
            
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
            
            Spacer()
            
            TextField("Enter username", text: $userSettings.username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
                .disableAutocorrection(true)
            TextField("Email", text: $loginVM.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .textInputAutocapitalization(.never) //because .autocapitalization will be deprecated soon
                .disableAutocorrection(true)
            SecureField("Password", text: $loginVM.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
            
            Button("Enter") {
                loginVM.login {
                    isActive = true
                }
            }.buttonStyle(PrimaryButtonStyle())
            
            Button("Don't have an account? Tap here") {
                showUserRegistrationSheet.toggle()
            }
            .sheet(isPresented: $showUserRegistrationSheet) {
                UserRegistrationView()
            }
            
            NavigationLink(
                destination: RoomListView(),
                isActive: $isActive, //if this property is true then the navigation is automatically going to happen
                label: {
                    EmptyView()
                })
            
            Spacer()
        }.padding()
            .embedInNavigationView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
