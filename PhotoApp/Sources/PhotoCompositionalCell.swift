//
//  PhotoCompositionalCell.swift
//  PhotoApp
//
//  Created by Nick Spravtsev on 03.09.2022.
//

import UIKit

class PhotoCompositionalCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static let identifier = "PhotoCompositionalCell"
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
