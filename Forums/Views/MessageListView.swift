//
//  MessageListView.swift
//  Forums
//
//  Created by Simbarashe Dombodzvuku on 2/8/22.
//

import SwiftUI
import Combine

struct MessageListView: View {
    
    let room: RoomViewModel
    
    @StateObject private var messageListVM = MessageListViewModel()
    
    @State private var message: String = ""
    @AppStorage("username") private var username = ""
    @State private var cancellables: AnyCancellable?
    
    private func sendMessage () {
        
        let messageVS = MessageViewState(message: message, roomId: room.roomId, userName: username)
        
        messageListVM.sendMessage(msg: messageVS) {
            message = ""
        }
        
    }
    
    var body: some View {
        
        VStack {
            ScrollView {
                ScrollViewReader { scrollView in
                    VStack {
                       
                        ForEach(messageListVM.messages, id: \.messageId){ message in
                            HStack {
                                
                                if message.userName == username {
                                    Spacer()
                                    MessageView(messageText: message.messageText, username: message.userName, style: .primary)
                                } else {
                                    MessageView(messageText: message.messageText, username: message.userName, style: .secondary)
                                }
                                
                            }.padding()
                            .id(message.messageId)
                        }
                        
                    }.onAppear(perform: {
                        
                       cancellables = messageListVM.$messages.sink { messages in
                            if messages.count > 0 {
                                DispatchQueue.main.async {
                                    withAnimation {
                                        scrollView.scrollTo(messages[messages.endIndex - 1].messageId, anchor: .bottom) //this is the messageIdmthat will be used by the scrollview to scroll, because we have specified messageId on the HStack
                                        
                                    }
                                }
                            }
                            
                        }
                          
                    })
                }
            }
            
            Spacer()
            
            HStack {
                TextField("Write message here", text: $message)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {
                   
                    sendMessage()
                    
                }, label: {
                    Image(systemName: "paperplane.fill")
                })
            }.padding()
           
            
            .background(Color(#colorLiteral(red: 0.9483042359, green: 0.9484629035, blue: 0.9482833743, alpha: 1)))
        }
        
        
        .navigationTitle(room.name)
        
        .onAppear(perform: {
            messageListVM.registerUpdatesForRoom(room: room)
        })
    }
}

struct MessageListView_Previews: PreviewProvider {
    static var previews: some View {
        MessageListView(room: RoomViewModel(room: Room(name: "Sports", description: "This is a sports room")))
            .embedInNavigationView()
    }
}

