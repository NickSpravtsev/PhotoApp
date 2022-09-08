//
//  PhotoTableCell.swift
//  PhotoApp
//
//  Created by Nick Spravtsev on 04.09.2022.
//

import UIKit
import SnapKit

class PhotoTableCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static let identifier = "PhotoTableCell"
    
    var photoTableItem: AlbumItem? {
        didSet {
            cellImageView.image = UIImage(systemName: photoTableItem?.imageName ?? "xmark.octagon")
            cellNameLabel.text = photoTableItem?.name
            cellCountLabel.text = String(photoTableItem?.photoCount ?? 0)
        }
    }
    
    // MARK: - Outlets
    
    private lazy var cellImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    private lazy var cellNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemBlue
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        
        return label
    }()
    
    private lazy var cellCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        
        return label
    }()
    
    private lazy var cellChevronImageView: UIImageView = {
        let chevronImage = UIImage(systemName: "chevron.right")
        let imageView = UIImageView(image: chevronImage)
        
        return imageView
    }()
    
    lazy var cellSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        
        return view
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        contentView.addSubview(cellImageView)
        contentView.addSubview(cellNameLabel)
        contentView.addSubview(cellCountLabel)
        contentView.addSubview(cellChevronImageView)
        contentView.addSubview(cellSeparatorView)
    }
    
    private func setupLayout() {
        cellImageView.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.left.equalTo(contentView).offset(20)
            make.width.equalTo(34)
        }
        cellNameLabel.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.left.equalTo(cellImageView.snp.right).offset(10)
        }
        cellCountLabel.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.right.equalTo(contentView).offset(-40)
        }
        cellChevronImageView.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.right.equalTo(contentView).offset(-20)
        }
        cellSeparatorView.snp.makeConstraints { make in
            make.bottom.equalTo(contentView)
            make.left.equalTo(cellNameLabel)
            make.right.equalTo(contentView)
            make.height.equalTo(2)
        }
    }
    
    // MARK: - Actions
    
    func cellPressedAnimation() {
        contentView.backgroundColor = .systemGray6
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { Timer in
            self.contentView.backgroundColor = .clear
        }
    }
}
