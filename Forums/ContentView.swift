//
//  ContentView.swift
//  Forums
//
//  Created by Simbarashe Dombodzvuku on 2/8/22.
//

import SwiftUI

struct ContentView: View {
    //@State private var usernameEntry: String = ""
    @State private var isActive: Bool = false
    //@AppStorage("username") private var username = ""
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
            
            
            //we will put some code to authenticate
            
            Button("Enter") {
                isActive = true
                //username = userSettings.username
                
            }.buttonStyle(PrimaryButtonStyle())
            
            Button("Show Sheet") {
                showUserRegistrationSheet.toggle()
            }
            .sheet(isPresented: $showUserRegistrationSheet) {
                UserRegistrationView()
            }
            
            NavigationLink(
                destination: RoomListView(),
                isActive: $isActive, //if this property is tru then the navigation is automatically going to happen
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
