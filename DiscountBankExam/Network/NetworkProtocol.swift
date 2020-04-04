//
//  NetworkProtocol.swift
//  DiscountBankExam
//
//  Created by Roei Baruch on 03/04/2020.
//  Copyright © 2020 Roei Baruch. All rights reserved.
//

import Foundation

protocol NetworkProtocol {
        func preformNetwokTask<T: Codable>(endPoint: EndpointType, type: T.Type, success: @escaping ((_ response: T) -> Void), failure: @escaping () -> Void)
}
