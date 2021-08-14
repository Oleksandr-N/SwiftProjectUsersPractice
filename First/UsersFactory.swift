//
//  UsersFactory.swift
//  First
//
//  Created by Oleksandr on 10.08.2021.
//

import Foundation

class UsersFactory {
    
    static func generateUsers() -> [User] {
        if let path = Bundle.main.path(forResource: "users", ofType: "json") {

            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)

                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let users: [User] = try decoder.decode([User].self, from: data)

                return users
            } catch {
                print(error)
                // handle error
                return []
            }
        }

        return []
    }
}
