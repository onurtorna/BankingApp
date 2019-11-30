//
//  APIClient.swift
//  BankingApp
//
//  Created by Onur Torna on 30.11.2019.
//  Copyright © 2019 Onur Torna. All rights reserved.
//

import Foundation

final class APIClient { }

// MARK: - searchBIC
extension APIClient {

    static func searchBic(fields: SearchBICFields,
                          pageNumber: Int = 0,
                          completion: @escaping (SuccessResponse<SearchBICResponse>?, Error?) -> Void) {

        APIRouter.searchBIC(fields: fields, pageNumber: pageNumber)
            .request.responseJSON { (dataResponse) in

                ServiceManager.handleResponse(dataResponse,
                                              of: SearchBICResponse.self,
                                              completion: completion)
        }
    }
}
