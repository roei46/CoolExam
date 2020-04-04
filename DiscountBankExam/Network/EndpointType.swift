//
//  EndpointType.swift
//  DiscountBankExam
//
//  Created by Roei Baruch on 03/04/2020.
//  Copyright © 2020 Roei Baruch. All rights reserved.
//

import Foundation

protocol EndpointType {
    
    var baseURL: URL { get }
    
    var path: String { get }
    
}
