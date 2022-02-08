//
//  AddRoomViewModel.swift
//  Forums
//
//  Created by Simbarashe Dombodzvuku on 2/8/22.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class AddRoomViewModel: ObservableObject {
    
    var name: String = ""
    var description: String = ""
    let db = Firestore.firestore()
    
    func createRoom(completion: @escaping () -> Void) {
        
        let room = Room(name: name, description: description)
        
        do {
        
        _ = try db.collection("rooms")
            .addDocument(from: room, encoder: Firestore.Encoder()) { (error) in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    completion()
                }
            }
        } catch let error {
            print(error.localizedDescription)
        }
        
    }
    
}
