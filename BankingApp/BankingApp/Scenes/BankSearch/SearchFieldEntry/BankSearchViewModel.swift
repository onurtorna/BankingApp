//
//  BankSearchViewModel.swift
//  BankingApp
//
//  Created by Onur Torna on 30.11.2019.
//  Copyright © 2019 Onur Torna. All rights reserved.
//

import Foundation

final class BankSearchState {

    enum Change {
        case isEnteredFieldsValid(Bool)
    }

    var onChange: ((BankSearchState.Change) -> Void)?

    var searchFields = SearchBICFields()
}

final class BankSearchViewModel {

    enum SearchField {
        case invalid
        case blz
        case countryCode
        case location
        case bankName
    }

    private let state: BankSearchState

    var stateChangeHandler: ((BankSearchState.Change) -> Void)? {
        get {
            return state.onChange
        }

        set {
            state.onChange = newValue
        }
    }

    init(state: BankSearchState) {
        self.state = state
    }

    func setSearchField(value: String?, type: SearchField) {
        switch type {
        case .blz:
            state.searchFields.blz = value
        case .bankName:
            state.searchFields.bankName = value
        case .countryCode:
            state.searchFields.countryCode = value
        case .location:
            state.searchFields.location = value
        case .invalid:
            break
        }

        validateFields()
    }
}

// MARK: - Helpers
private extension BankSearchViewModel {

    /// Validates entered search fields to be sure at least one field is entered
    func validateFields() {
        let isBlzEntered = !(state.searchFields.blz?.isEmpty ?? true)
        let isBankNameEntered = !(state.searchFields.bankName?.isEmpty ?? true)
        let isLocationEntered = !(state.searchFields.location?.isEmpty ?? true)
        let isCountryCodeEntered = !(state.searchFields.countryCode?.isEmpty ?? true)
        let isValid = isBlzEntered || isBankNameEntered || isLocationEntered || isCountryCodeEntered

        state.onChange?(.isEnteredFieldsValid(isValid))
    }
}
