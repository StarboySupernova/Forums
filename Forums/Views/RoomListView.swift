//
//  RoomListView.swift
//  Forums
//
//  Created by Simbarashe Dombodzvuku on 2/8/22.
//

import SwiftUI

struct RoomListView: View {
    
    @State private var isPresented: Bool = false
    @StateObject private var roomListVM = RoomListViewModel()
   
    
    var body: some View {
        VStack {
            
            List(roomListVM.rooms, id: \.roomId){ room in
                NavigationLink(
                    //when a user clicks on a room we want to take them to the messages associated with that room, hence the use of MessageListView
                    destination: MessageListView(room: room),
                    label: {
                        RoomCell(room: room)
                    })
                
            }.listStyle(PlainListStyle())
            
            
        }
        .navigationTitle("Rooms")
        .navigationBarItems(trailing: Button(action: {
            isPresented = true
        }, label: {
            Image(systemName: "plus")
                .font(.title)
                .foregroundColor(.white)
        }))
        
        .sheet(isPresented: $isPresented, onDismiss: {
            
        }, content: {
            AddRoomView()
        })
        
        .onAppear(perform: {
            roomListVM.getAllRooms()
        })
    }
}

struct RoomListView_Previews: PreviewProvider {
    static var previews: some View {
        RoomListView()
            .embedInNavigationView()
    }
}

struct RoomCell: View {
    let room: RoomViewModel
    
    var body: some View{
        VStack(alignment: .leading, spacing: 10){
            Text(room.name)
                .font(.headline)
            Text(room.description)
        }
    }
}



