//
//  MainView-ViewModel.swift
//  ToDoApp
//
//  Created by Jason Vo on 8/15/23.
//

import FirebaseAuth
import Foundation

class MainViewViewModel: ObservableObject {
    @Published var currentUserID: String = "" // when user signs in out out this will be triggered and updates view
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener{ [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserID = user?.uid ?? ""
            }
        }
    }
    
    public var isSignedIn: Bool  {
        return Auth.auth().currentUser != nil
    }
}
