//
//  BankSearchResultViewModel.swift
//  BankingApp
//
//  Created by Onur Torna on 1.12.2019.
//  Copyright © 2019 Onur Torna. All rights reserved.
//

import Foundation

// MARK: - BankSearchResultState
final class BankSearchResultState {

    enum Change {
        case itemsFetched
        case errorReceived(message: String?)
        case canLoadMoreState(canLoadMore: Bool)
    }

    /// Pre entered fields to search
    let enteredFields: SearchBICFields

    var onChange: ((BankSearchResultState.Change) -> Void)?

    var currentPageNumber = -1

    /// Indicates that more entries can be shown with pagination
    var canLoadMore = false

    /// Received service error's message
    var receivedErrorMessage: String? {
        didSet {
            onChange?(.errorReceived(message: receivedErrorMessage))
        }
    }

    /// Total BIC list that are fetched from server
    var bicList: [BIC] = [] {
        didSet {
            onChange?(.itemsFetched)
        }
    }

    init(enteredFields: SearchBICFields) {
        self.enteredFields = enteredFields
    }
}

// MARK: - BankSearchResultViewModel
final class BankSearchResultViewModel {

    private let state: BankSearchResultState
    private let dataController : BankSearchResultDataProtocol

    var stateChangeHandler: ((BankSearchResultState.Change) -> Void)? {
        get {
            return state.onChange
        }

        set {
            state.onChange = newValue
        }
    }

    /// Total number of items to show
    var numberOfItems: Int {
        return state.bicList.count
    }

    init(state: BankSearchResultState,
         dataController: BankSearchResultDataProtocol) {
        self.state = state
        self.dataController = dataController
    }

    /// Specific item at given index
    func item(at index: Int) -> BIC {
        return state.bicList[index]
    }
}

// MARK: - Network
extension BankSearchResultViewModel {

    func fetchBICResults() {

        dataController.fetchBankResult(with: state.enteredFields,
                                       requestedPageNumber: state.currentPageNumber + 1) { [weak self] (bicList, pageNumber, totalPageNumber, errorMessage) in

                                        guard let self = self else { return }

                                        if let errorMessage = errorMessage {
                                            self.state.receivedErrorMessage = errorMessage
                                            return
                                        }

                                        guard let bicList = bicList else { return }
                                        self.state.bicList.append(contentsOf: bicList)
                                        self.state.currentPageNumber = pageNumber ?? -1
                                        let totalPageNumber = totalPageNumber ?? -1
                                        self.state.canLoadMore = totalPageNumber > self.state.currentPageNumber
        }
    }
}
