//
//  RoomListViewModel.swift
//  Forums
//
//  Created by Simbarashe Dombodzvuku on 2/8/22.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct RoomViewModel {
    let room: Room
    
    var name: String {
        room.name
    }
    
    var description: String {
        room.description
    }
    
    var roomId: String {
        room.id ?? ""
    }
}

class RoomListViewModel: ObservableObject {
    @Published var rooms: [RoomViewModel] = []
    let db = Firestore.firestore()
    
    func getAllRooms() {
        
        db.collection("rooms")
            .getDocuments { snapshot, error in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    if let snapshot = snapshot {
                        let rooms: [RoomViewModel] = snapshot.documents.compactMap{ doc in
                            guard var room = try? doc.data(as: Room.self) else {
                                return nil //which will be ignored by compactMap
                            }
                            
                            room.id = doc.documentID
                            return RoomViewModel(room: room)
                        }
                        
                        DispatchQueue.main.async {
                            //we use dispatchQueue because we want to set the rooms property which is marked with Published, and when something is marked with @Published it is a good idea to use DispatchQueue, setting up such properties on the main thread
                            self.rooms = rooms
                            
                        }
                    }
                }
            }
        
        
    }
    
}

