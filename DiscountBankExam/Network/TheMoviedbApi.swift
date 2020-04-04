//
//  ThemoviedbApi.swift
//  DiscountBankExam
//
//  Created by Roei Baruch on 01/04/2020.
//  Copyright © 2020 Roei Baruch. All rights reserved.
//

import Foundation

enum TheMoviedbApi {
    case genre
    case popular(String)
    case videos(String)
}

extension TheMoviedbApi: EndpointType {
    
    var apiKey: String {
        return "d1b0b65d498ca96e39e0825e5dba99d5"
    }

    var baseURL: URL {
        return URL(string: "https://api.themoviedb.org/3/")!
    }
        
    var path: String {
        switch self {
        case .genre:
            return "genre/movie/list?api_key=\(apiKey)"
        case .popular(let page):
        return "movie/popular?api_key=\(apiKey)&language=en-US&page=\(page)"
        case .videos(let movieID):
            return "movie/\(movieID)/videos?api_key=\(apiKey)"
        }
    }
}
