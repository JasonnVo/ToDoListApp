//
//  ToDoAppApp.swift
//  ToDoApp
//
//  Created by Jason Vo on 8/15/23.
//

import FirebaseCore
import SwiftUI

@main
struct ToDoApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
