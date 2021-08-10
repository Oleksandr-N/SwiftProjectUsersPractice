//
//  User.swift
//  First
//
//  Created by Oleksandr on 10.08.2021.
//

import Foundation

struct User: Decodable {
    let firstName: String
    let lastName: String
    let phoneNumber: String
    let gender: String
    let picture: String
    let birthdate: TimeInterval
    
    var date: Date {
        Date(timeIntervalSince1970: birthdate)
    }

    var fullName: String  {
        firstName + " " + lastName
    }
}
