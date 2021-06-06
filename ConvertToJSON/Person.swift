//
//  MyObject.swift
//  ConvertToJSON
//
//  Created by Rob Baldwin on 06/06/2021.
//

import Foundation

struct Person: Codable {
    var name: String
    var pets: [Pet]
}

struct Pet: Codable {
    var type: String
}

extension Person {
    static func sampleData() -> [Person] {
        [
            Person(name: "Adam", pets: []),
            Person(name: "Jane", pets: [
                    Pet(type: "Cat")
            ]),
            Person(name: "Robert", pets: [
                    Pet(type: "Cat"),
                    Pet(type: "Rabbit")
            ])
        ]
    }
}
