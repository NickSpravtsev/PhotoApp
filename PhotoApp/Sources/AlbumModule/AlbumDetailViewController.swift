//
//  AlbumDetailViewController.swift
//  PhotoApp
//
//  Created by Nick Spravtsev on 07.09.2022.
//

import UIKit
import SnapKit

class AlbumDetailViewController: UIViewController {
    
    // MARK: - Propierties
    
    var albumItem: AlbumItem?
    
    // MARK: - Outlets
    
    private lazy var albumImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        
        return imageView
    }()
    
    private lazy var countLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        
        return label
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        setupHierarchy()
        setupLayout()
        fullView()
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        view.addSubview(albumImageView)
        view.addSubview(countLabel)
    }
    
    private func setupLayout() {
        albumImageView.snp.makeConstraints { make in
            make.center.equalTo(view)
            make.width.height.equalTo(200)
        }
        countLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(albumImageView.snp.bottom).offset(20)
        }
    }
    
    private func fullView() {
        title = albumItem?.name
        countLabel.text = "Количество элементов: \(albumItem?.photoCount ?? 0)"
        if albumItem?.imageType == .external {
            albumImageView.image = UIImage(named: albumItem?.imageName ?? "")
            albumImageView.contentMode = .scaleAspectFill
        } else if albumItem?.imageType == .system {
            albumImageView.image = UIImage(systemName: albumItem?.imageName ?? "")
            albumImageView.contentMode = .scaleAspectFit
        }
    }
}
