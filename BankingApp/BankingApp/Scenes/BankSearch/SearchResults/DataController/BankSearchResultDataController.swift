//
//  BankSearchResultDataController.swift
//  BankingApp
//
//  Created by Onur Torna on 1.12.2019.
//  Copyright © 2019 Onur Torna. All rights reserved.
//

import Foundation

final class BankSearchResultDataController: BankSearchResultDataProtocol {

    func fetchBankResult(with fields: SearchBICFields,
                         requestedPageNumber: Int,
                         completion: @escaping (([BIC]?, _ pageNumber: Int?, _ totalPageNumber: Int?, _ errorMessage: String?) -> Void)) {
        APIClient.searchBic(fields: fields,
                            pageNumber: requestedPageNumber) { (response, error) in
                                completion(response?.data.bicList, response?.data.page, response?.data.pageCount, error?.ba_message)
        }
    }
}
