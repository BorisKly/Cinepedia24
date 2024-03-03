//
//  SearchTableViewCell+AccessabilityProtocol.swift
//  Cinepedia24
//
//  Created by Borys Klykavka on 28.02.2024.
//

extension SearchTableViewCell {
    func setAccessibilityIdentifiers() {
        movieTitleLabel.accessibilityIdentifier = "movieTitleLabel"
    }
}
