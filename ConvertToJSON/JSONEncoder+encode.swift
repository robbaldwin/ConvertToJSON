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
            let desktopURL = homeURL.appendingPathComponent("Desktop")
            let fileURL = desktopURL.appendingPathComponent("Output.json")
            
            do {
                try jsonString?.write(to: fileURL, atomically: true, encoding: .utf8)
            } catch {
                print(error.localizedDescription)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
