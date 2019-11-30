//
//  Reusable.swift
//  BankingApp
//
//  Created by Onur Torna on 1.12.2019.
//  Copyright © 2019 Onur Torna. All rights reserved.
//

import UIKit

// MARK: - Reusable
protocol Reusable: class {
    static var reuseIdentifier: String { get }
}

extension Reusable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

// MARK: - UIViewController
extension UIViewController: Reusable { }

// MARK: - UIView
extension UIView: Reusable { }
