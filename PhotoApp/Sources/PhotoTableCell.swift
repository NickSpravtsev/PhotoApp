//
//  PhotoTableCell.swift
//  PhotoApp
//
//  Created by Nick Spravtsev on 04.09.2022.
//

import UIKit

class PhotoTableCell: UICollectionViewCell {

    // MARK: - Properties

    static let identifier = "PhotoTableCell"

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
