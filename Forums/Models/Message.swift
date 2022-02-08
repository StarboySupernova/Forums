//
//  Message.swift
//  Forums
//
//  Created by Simbarashe Dombodzvuku on 2/8/22.
//

import Foundation

struct Message: Codable {
    
    var id: String?
    var text: String = ""
    var userName: String = ""
    var roomId: String = ""
    var messageDate = Date()
    
    // we need a way to convert the MessageViewState, which is the info collected from the user, into the Message model, as the viewstate cannot interact with the Firebase database. Only models can
    
    init (vs: MessageViewState) {
        text = vs.message
        userName = vs.userName
        roomId = vs.roomId
    }
    
}
