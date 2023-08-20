//
//  User.swift
//  ToDoApp
//
//  Created by Jason Vo on 8/15/23.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
