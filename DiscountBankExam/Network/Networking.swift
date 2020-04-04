//
//  Networking.swift
//  DiscountBankExam
//
//  Created by Roei Baruch on 02/04/2020.
//  Copyright © 2020 Roei Baruch. All rights reserved.
//

import Foundation
import Alamofire

struct Networking {
    
    func preformNetwokTask<T: Codable>(endPoint: EndpointType, type: T.Type, success: @escaping ((_ response: T) -> Void), failure: @escaping () -> Void) {
        
        guard let url = endPoint.baseURL.appendingPathComponent(endPoint.path).absoluteString.removingPercentEncoding  else { return }
        Alamofire.request(url).responseJSON { (response) in
            if response.result.isFailure {
                failure()
            }
            
            if let data = response.data {
                let response = Response.init(data: data)
                if let decode = response.decode(type) {
                    success(decode)
                } else {
                    failure()
                }
            }
        }
    }
}

