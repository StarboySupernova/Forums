//
//  AddRoomView.swift
//  Forums
//
//  Created by Simbarashe Dombodzvuku on 2/8/22.
//

import SwiftUI

struct AddRoomView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var addRoomVM = AddRoomViewModel()
   
    var body: some View {
        VStack {
            
            Form {
                TextField("Enter name", text: $addRoomVM.name)
                TextField("Enter description", text: $addRoomVM.description)
                
            }
            
            Button("Save") {
                addRoomVM.createRoom {
                    //when the room is created, this view is dismissed because presentation mode is a binding to the current view in which it appears
                    presentationMode.wrappedValue.dismiss()
                }
                
            }.buttonStyle(PrimaryButtonStyle())
            .padding()
            
            Spacer()
            
        }.navigationTitle("Add New Room")
        .embedInNavigationView()
    }
}

struct AddRoomView_Previews: PreviewProvider {
    static var previews: some View {
        AddRoomView()
    }
}

