//
//  AlbumSectionHeader.swift
//  PhotoApp
//
//  Created by Nick Spravtsev on 04.09.2022.
//

import UIKit
import SnapKit

class AlbumSectionHeader: UICollectionReusableView {
    
    // MARK: - Properties
    
    static let identifier = "AlbumSectionHeader"
    
    
    // MARK: - Outlets
    
    lazy var sectionHeaderLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        
        return label
    }()
    
    lazy var sectionHeaderButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Все", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        button.addTarget(self, action: #selector(sectionHeaderButtonPressed), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var sectionSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        
        return view
    }()
    
    // MARK: - Intializers
    
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
        addSubview(sectionHeaderLabel)
        addSubview(sectionHeaderButton)
        addSubview(sectionSeparatorView)
    }
    
    private func setupLayout() {
        sectionHeaderLabel.snp.makeConstraints { make in
            make.left.equalTo(self)
            make.bottom.equalTo(self)
        }
        
        sectionHeaderButton.snp.makeConstraints { make in
            make.right.equalTo(self).offset(-28)
            make.bottom.equalTo(sectionHeaderLabel).offset(3)
        }
        
        sectionSeparatorView.snp.makeConstraints { make in
            make.height.equalTo(2)
            make.width.equalTo(self)
            make.left.equalTo(self)
            make.bottom.equalTo(sectionHeaderLabel.snp.top).offset(-10)
        }
    }

    // MARK: - Actions

    @objc private func sectionHeaderButtonPressed() {
        print("sectionHeaderButton pressed")
    }
}
