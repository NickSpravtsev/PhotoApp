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
    var photoTableItem: PhotoTableItem?
    
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
        if albumItem != nil {
            title = albumItem?.name
            albumImageView.image = UIImage(named: albumItem?.imageName ?? "")
            albumImageView.contentMode = .scaleAspectFill
            countLabel.text = "Количество элементов: \(albumItem?.photoCount ?? 0)"
        } else if photoTableItem != nil {
            title = photoTableItem?.name
            albumImageView.image = UIImage(systemName: photoTableItem?.imageName ?? "")
            albumImageView.contentMode = .scaleAspectFit
            countLabel.text = "Количество элементов: \(photoTableItem?.count ?? 0)"
        }
    }
}
