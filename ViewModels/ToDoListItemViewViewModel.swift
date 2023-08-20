//
//  ToDoListItemView-ViewModel.swift
//  ToDoApp
//
//  Created by Jason Vo on 8/15/23.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

// ViewModel for a single to do list item view
class ToDoListItemViewViewModel: ObservableObject {
    init() {}
    
    func toggleIsDone(item: ToDoListItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}