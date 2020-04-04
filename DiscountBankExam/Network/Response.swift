//
//  Response.swift
//  DiscountBankExam
//
//  Created by Roei Baruch on 01/04/2020.
//  Copyright © 2020 Roei Baruch. All rights reserved.
//

import Foundation

struct Response {
    fileprivate var data: Data
    init(data: Data) {
        self.data = data
    }
}


extension Response {
    public func decode<T: Codable>(_ type: T.Type) -> T? {
        let jsonDecoader = JSONDecoder()
        do {
            let response = try jsonDecoader.decode(T.self, from: data)
            return response
            
        } catch {
            return nil
        }
    }
}
