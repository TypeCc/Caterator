//
//  ViewController.swift
//  Caterator
//
//  Created by serif mete on 2.04.2023.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    //MARK: - My Variable
    private var imageView: UIImageView = UIImageView()
    private var label: UILabel = UILabel()
    private var imageUrl: String?
    private var service = DownloadService()
    
    //MARK: - My Func
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        fetchitem()
        configure()
        constraints()
    }
    
    private func configure(){
        self.label.text = "This application is a tried trial application to create a resource for myself. You can reach my personal blog page by touching the picture."
        self.label.numberOfLines = 0
        self.label.lineBreakMode = .byTruncatingTail
        self.label.textAlignment = .center
        self.label.font = .boldSystemFont(ofSize: 20)
        self.label.translatesAutoresizingMaskIntoConstraints = false
        self.imageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped))
        imageView.addGestureRecognizer(gestureRecognizer)
        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        self.imageView.contentMode = .scaleAspectFit
        DispatchQueue.main.async {
            sleep(2)
            if self.imageUrl != nil {
                guard let url = URL(string: self.imageUrl!) else { return }
                self.imageView.kf.setImage(with: url)
            }
            sleep(4)
            if self.imageUrl != nil {
                guard let url = URL(string: self.imageUrl!) else { return }
                self.imageView.kf.setImage(with: url)
            }
        }
        view.addSubview(label)
        view.addSubview(imageView)
    }
    
    @objc func imageViewTapped(sender: UITapGestureRecognizer) {
        if sender.view is UIImageView {
            if let url = URL(string: "https://serif-mete.online") {
                 UIApplication.shared.open(url, options: [:])
             }
        }
    }
    
    private func constraints() {
        let margineGuide = view.layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: margineGuide.leadingAnchor, constant: 30),
            imageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            label.leadingAnchor.constraint(equalTo: margineGuide.leadingAnchor,
                  constant: 5),
            label.trailingAnchor.constraint(equalTo: margineGuide.trailingAnchor),
            label.heightAnchor.constraint(equalToConstant: 110)
        ])
    }

   private func fetchitem(){
        service.downloadService { [weak self] result in
            guard let self = self else { return }
            guard let result = result else { return }
            self.imageUrl = result.yoastHeadJSON?.ogImage?.first?.url
            print(self.imageUrl)
        }
    }
    
}

