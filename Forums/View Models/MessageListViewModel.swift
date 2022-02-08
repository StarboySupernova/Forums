//
//  MessageListViewModel.swift
//  Forums
//
//  Created by Simbarashe Dombodzvuku on 2/8/22.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

//this is responsible for taking information from the user, as the UI cannot edit the model nor the ViewModel, so we need a way to collect data from the user for use in the implementation of func sendMessage
struct MessageViewState {
    let message: String
    let roomId: String
    let userName: String
}

struct MessageViewModel {
    let message: Message
    
    var messageText: String {
        message.text
    }
    
    var userName: String {
        message.userName
    }
    
    var messageId: String {
        message.id ?? ""
    }
    
}

//This represents the entire screen where the messages will be displayed

class MessageListViewModel: ObservableObject {
    // creating an instance of the firestore
    let db = Firestore.firestore()
    //when we assign messages, it generates an event
    @Published var messages : [MessageViewModel] = []
    
    func registerUpdatesForRoom(room: RoomViewModel){
        db.collection("rooms")
            .document(room.roomId)
            .collection("messages")
            .order(by: "messageDate", descending: false)
        //this ensures that whenver the messages change in that particular roomId, we will be listening to it
            .addSnapshotListener { snapshot, error in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    if let snapshot = snapshot {
                        let messages: [MessageViewModel] = snapshot.documents.compactMap { doc in
                            guard var message: Message = try? doc.data(as: Message.self) else {
                                return nil
                            }
                            message.id = doc.documentID
                            return MessageViewModel(message: message)
                        }
                        
                        DispatchQueue.main.async {
                            self.messages = messages
                        }
                        
                    }
                }
            }
        
    }
    
    func sendMessage(msg: MessageViewState, completion: @escaping () -> Void ) {
        
        let message = Message(vs: msg)
        
        do {
       _ = try db.collection("rooms")
            .document(message.roomId)
        //creates a collection inside the document with the specified roomId
            .collection("messages")
        //and inside that collection we will be creating a new document
            .addDocument(from: message, encoder: Firestore.Encoder()) { error in
                if let error = error {
                    print(error.localizedDescription)
                } else  {
                    completion()
                }
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    
}

