//
//  APIRouter.swift
//  BankingApp
//
//  Created by Onur Torna on 30.11.2019.
//  Copyright © 2019 Onur Torna. All rights reserved.
//

import Alamofire

enum APIRouter {

    case searchBIC(blz: String)

    // MARK: - Request
    var request: Alamofire.DataRequest {

        var encodingMethod: ParameterEncoding = URLEncoding.default
        if method == .post {
            encodingMethod = JSONEncoding.default
        }

        return NetworkManager.sessionManager.request(url!,
                                                     method: method,
                                                     parameters: parameters,
                                                     encoding: encodingMethod,
                                                     headers: headers)
            .authenticate(user: SessionManager.shared.username,
                          password: SessionManager.shared.password)
    }

    // MARK: - HTTPMethod
    var method: HTTPMethod {

        switch self {
        case .searchBIC:
            return .get
        }
    }

    // MARK: - URL
    private var url: URL? {
        let staticUrl = Network.StaticUrl.base
        let baseUrl = URL(string: "\(staticUrl)")
        let url = baseUrl?.appendingPathComponent(path)
        return url
    }

    // MARK: - PATH
    private var path: String {

        switch self {
        case .searchBIC:
            return "searchBic"
        }
    }

    /// Mark: Headers
    private var headers: [String: String] {
        // Headers can be added here

        return [:]
    }

    private var parameters: Parameters? {
        // TODO: To be implemented
        return [:]
    }
}



