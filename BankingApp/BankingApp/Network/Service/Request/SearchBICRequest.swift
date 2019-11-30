//
//  SearchBICRequest.swift
//  BankingApp
//
//  Created by Onur Torna on 30.11.2019.
//  Copyright © 2019 Onur Torna. All rights reserved.
//

import Alamofire

final class SearchBICRequest {

    private enum Mapping {
        static let blzKey = "blz"
        static let countryCodeKey = "countryCode"
        static let locationKey = "location"
        static let bankNameKey = "bankName"
        static let pageKey = "page"
    }

    static func generateParameters(fields: SearchBICFields, page: Int) -> Parameters {

        var parameters: Parameters = [:]
        parameters.addObjectIfExists(key: Mapping.blzKey, object: fields.blz)
        parameters.addObjectIfExists(key: Mapping.countryCodeKey, object: fields.countryCode)
        parameters.addObjectIfExists(key: Mapping.locationKey, object: fields.location)
        parameters.addObjectIfExists(key: Mapping.bankNameKey, object: fields.bankName)
        parameters.addObjectIfExists(key: Mapping.pageKey, object: page)
        return parameters
    }
}

