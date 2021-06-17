//
//  JSONEncoder+encode.swift
//  ConvertToJSON
//
//  Created by Rob Baldwin on 06/06/2021.
//

import Foundation

extension JSONEncoder {
    static func encode<T: Encodable>(from data: T) {
        do {
            let jsonEncoder = JSONEncoder()
            jsonEncoder.outputFormatting = .prettyPrinted
            let json = try jsonEncoder.encode(data)
            let jsonString = String(data: json, encoding: .utf8)
            
            // Mac: Output to file on the user's Desktop
            let homeURL = FileManager.default.homeDirectoryForCurrentUser
            let fileURL = homeURL.appendingPathComponent("Desktop/Output.json")
            
            do {
                try jsonString?.write(to: fileURL, atomically: true, encoding: .utf8)
                print("Output.json file saved to Desktop")
            } catch {
                print(error.localizedDescription)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
