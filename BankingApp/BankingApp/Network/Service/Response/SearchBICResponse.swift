//
//  SearchBICResponse.swift
//  BankingApp
//
//  Created by Onur Torna on 30.11.2019.
//  Copyright © 2019 Onur Torna. All rights reserved.
//

import Foundation

struct SearchBICResponse: BaseResponse {

    /// Current page number
    let page: Int

    /// Total number of pages with given search parameters
    let pageCount: Int

    /// BIC result list
    let bicList: [BIC]

    enum CodingKeys: String, CodingKey {
        case page
        case pageCount
        case bicList = "bics"
    }
}
