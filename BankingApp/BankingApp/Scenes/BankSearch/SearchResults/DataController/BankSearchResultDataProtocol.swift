//
//  BankSearchResultDataProtocol.swift
//  BankingApp
//
//  Created by Onur Torna on 1.12.2019.
//  Copyright © 2019 Onur Torna. All rights reserved.
//

import Foundation

protocol BankSearchResultDataProtocol {

    /// Fetches banks with entered fields
    /// - Parameters:
    ///   - fields: Entered fields to filter
    ///   - requestedPageNumber: Requested next Page number
    ///   - completion: Completion block including BIC list, current ant total page number if success, error message to show if there failure
    func fetchBankResult(with fields: SearchBICFields,
                         requestedPageNumber: Int,
                         completion: @escaping (([BIC]?, _ pageNumber: Int?, _ totalPageNumber: Int?, _ errorMessage: String?) -> Void))
}
