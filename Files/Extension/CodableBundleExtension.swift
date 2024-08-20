//
//  CodableBundleExtension.swift
//  Files
//
//  Created by 신동규 on 8/20/24.
//

import Foundation

extension Bundle {
    func decode<Content>(_ file: String) -> Content where Content : Decodable {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) from bundle")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle")
        }
        
        let decoder = JSONDecoder()
        
        guard let loaded = try? decoder.decode(Content.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle")
        }
        
        return loaded
    }
}
