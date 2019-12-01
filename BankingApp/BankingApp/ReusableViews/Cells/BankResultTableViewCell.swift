//
//  BankResultTableViewCell.swift
//  BankingApp
//
//  Created by Onur Torna on 1.12.2019.
//  Copyright © 2019 Onur Torna. All rights reserved.
//

import UIKit

protocol BankResultTableViewCellDataSource {
    var _bankName: String { get }
    var _address: String { get }
    var _countryCode: String { get }
    var _blz: String { get }
}

final class BankResultTableViewCell: UITableViewCell {

    private var bankNameLabel = UILabel()
    private var addressLabel = UILabel()
    private var countryCodeLabel = UILabel()
    private var blzLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
}

// MARK: - Public
extension BankResultTableViewCell {

    func populate(with dataSource: BankResultTableViewCellDataSource) {
        bankNameLabel.text = dataSource._bankName
        addressLabel.text = dataSource._address
        countryCodeLabel.text = "Country Code: " + dataSource._countryCode
        blzLabel.text = "BLZ Code: " + dataSource._blz
    }
}

// MARK: - Helpers
private extension BankResultTableViewCell {

    func commonInit() {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = .init(top: 10, left: 20, bottom: 10, right: 20)

        addSubview(stackView)
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true

        bankNameLabel.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        countryCodeLabel.translatesAutoresizingMaskIntoConstraints = false
        blzLabel.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addArrangedSubview(bankNameLabel)
        stackView.addArrangedSubview(addressLabel)
        stackView.addArrangedSubview(countryCodeLabel)
        stackView.addArrangedSubview(blzLabel)
    }
}
