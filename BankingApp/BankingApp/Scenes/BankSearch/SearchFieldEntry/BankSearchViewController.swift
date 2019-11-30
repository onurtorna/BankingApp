//
//  BankSearchViewController.swift
//  BankingApp
//
//  Created by Onur Torna on 30.11.2019.
//  Copyright © 2019 Onur Torna. All rights reserved.
//

import UIKit

final class BankSearchViewController: UIViewController {

    private enum Constant {
        static let keyboardOpenMargin: CGFloat = 20
    }

    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var searchButton: UIButton!
    @IBOutlet private weak var bankNameTextField: UITextField!
    @IBOutlet private weak var locationTextField: UITextField!
    @IBOutlet private weak var countryCodeTextField: UITextField!
    @IBOutlet private weak var blzTextField: UITextField!

    var viewModel: BankSearchViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Bank Search"
        initializeViews()
        registerForKeyboardNotifications()

        viewModel.stateChangeHandler = { [weak self] change in
            self?.stateChange(handle: change)
        }
    }

}

// MARK: - Helpers
private extension BankSearchViewController {

    func stateChange(handle change: BankSearchState.Change) {
        switch change {
        case .isEnteredFieldsValid(let isValid):
            searchButton.isEnabled = isValid
        }
    }

    func initializeViews() {
        searchButton.isEnabled = false

        bankNameTextField.placeholder = "Please enter bank name to Search (Optional)"
        locationTextField.placeholder = "Please enter address to Search (Optional)"
        countryCodeTextField.placeholder = "Please enter country code to Search (Optional)"
        blzTextField.placeholder = "Please enter BLZ to Search (Optional)"
    }
}

// MARK: - Actions
private extension BankSearchViewController {

    @IBAction func searchButtonDidTapped(_ sender: Any) {
        // TODO: To be implemented
    }

    @IBAction func textFieldEditingChanged(_ sender: UITextField) {
        let type: BankSearchViewModel.SearchField
        let value = sender.text
        switch sender {
        case bankNameTextField:
            type = .bankName
        case locationTextField:
            type = .location
        case countryCodeTextField:
            type = .countryCode
        case blzTextField:
            type = .blz
        default:
            type = .invalid
        }

        viewModel.setSearchField(value: value, type: type)
    }
}

// MARK: - Keyboard
private extension BankSearchViewController {

    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow(notification:)),
                                               name:UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide(notification:)),
                                               name:UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }

    @objc func keyboardWillShow(notification:NSNotification) {
        //give room at the bottom of the scroll view, so it doesn't cover up anything the user needs to tap
        guard let userInfo = notification.userInfo,
            let keyboardFrame: CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue else { return }

        let viewRelativeKeyboardFrame = view.convert(keyboardFrame, from: nil)
        var contentInset = scrollView.contentInset
        contentInset.bottom = viewRelativeKeyboardFrame.size.height + Constant.keyboardOpenMargin
        scrollView.contentInset = contentInset
    }

    @objc func keyboardWillHide(notification:NSNotification) {
        let contentInset = UIEdgeInsets.zero
        scrollView.contentInset = contentInset
    }
}
