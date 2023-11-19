//
//  Bundle.swift
//  Moonshot
//
//  Created by Yasser Bal on 19/11/2023.
//

import Foundation
extension Bundle{
    enum decodingError:LocalizedError{
        case failedToLocate(file:String)
        
        var errorDescription: String?{
            switch self{
        
            case .failedToLocate(let file):
                return "Failed to locate \(file) in bundle."
            }
        }
    }
    
    func decode<T:Decodable>( file:String,
                              fileExtension:String?)
    throws -> T
    {
        guard let url = self.url(forResource: file, withExtension: fileExtension) else {
            throw decodingError.failedToLocate(file:file)
        }
        
        let data = try Data(contentsOf: url)
        
        let decoder = JSONDecoder()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        let loaded = try decoder.decode(T.self, from: data)
        return loaded
        
    }
    
}
