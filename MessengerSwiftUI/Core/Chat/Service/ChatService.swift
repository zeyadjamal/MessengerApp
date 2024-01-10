//
//  ChatService.swift
//  MessengerSwiftUI
//
//  Created by Zeyad Jamal on 08/01/2024.
//

import Foundation
import Firebase

struct ChatService {

    let chatParthner: User
    
         func sendMessage(_ messageText : String) {
         guard let currentUid = Auth.auth().currentUser?.uid else { return }
         let chatPertnerId = chatParthner.id
            
             let currentUserRef = FirestoreConstants.MessagesCollection.document(currentUid).collection(chatPertnerId).document()
             let chatPartnerRef = FirestoreConstants.MessagesCollection.document(chatPertnerId).collection(currentUid)
         
             let recentCurrentUserRef = FirestoreConstants.MessagesCollection.document(currentUid).collection("recent-messages").document(chatPertnerId)
             let recentPartnerRef = FirestoreConstants.MessagesCollection.document(chatPertnerId).collection("recent-messages").document(currentUid)
         let messageId = currentUserRef.documentID
         
         let message = Message(
             messageId: messageId,
             fromId: currentUid,
             told: chatPertnerId,
             messageText: messageText,
             timestamp: Timestamp())
         
         guard let messageData = try? Firestore.Encoder().encode(message) else { return}
         
         currentUserRef.setData(messageData)
         chatPartnerRef.document(messageId).setData(messageData)
             recentCurrentUserRef.setData(messageData)
             recentPartnerRef.setData(messageData)
     }
     
    func observeMEssage(completion : @escaping([Message]) -> Void ){
         guard let currentUid = Auth.auth().currentUser?.uid else { return}
         let chatPartnerId = chatParthner.id
        
        let query = FirestoreConstants.MessagesCollection.document(currentUid)
        .collection(chatPartnerId)
        .order(by : "timestamp",descending : false)
         
         query.addSnapshotListener { snapshot , _ in
             guard let changes = snapshot?.documentChanges.filter({ $0.type == .added}) else {return}
             var messages = changes.compactMap({try? $0.document.data(as : Message.self)})
             
             for (index , message) in messages.enumerated() where message.isFromCurrentUser {
                 messages[index].user = chatParthner
             }
             completion(messages)
         }
     }

}
    
