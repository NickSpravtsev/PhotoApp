//
//  MediaLibraryCell.swift
//  PhotoApp
//
//  Created by Nick Spravtsev on 08.09.2022.
//

import UIKit

class MediaLibraryCell: UICollectionViewCell {

    // MARK: - Propierties
    static let identifier = "MediaLibraryCell"

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .green
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
