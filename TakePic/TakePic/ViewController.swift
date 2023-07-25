//
//  ViewController.swift
//  TakePic
//
//  Created by Caio Chaves on 24.07.23.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Properties
    private var image: UIImageView = {
        let image = UIImageView()
        image.frame = .init(x: 0, y: 0, width: 500, height: 500)
        return image
    }()
    
    private var takePicButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = UIColor.systemGray
        button.setImage(UIImage(systemName: "camera.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(UIColor.black), for: .normal)
        button.layer.cornerRadius = 25
        button.layer.shadowColor = UIColor(red: 0.078, green: 0.129, blue: 0.239, alpha: 0.25).cgColor
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.5
        button.layer.shadowOffset = CGSize(width: 0, height: 0)
        button.clipsToBounds = false
        return button
    }()
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
    }
    
    
    //MARK: Configuring layout
    private func configureLayout() {
        view.backgroundColor = .systemBackground
        
        //Adding view
        view.addSubview(image)
        view.addSubview(takePicButton)
        
        image.translatesAutoresizingMaskIntoConstraints = false
        takePicButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            // Image
            image.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            image.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            image.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            image.bottomAnchor.constraint(equalTo: takePicButton.topAnchor, constant: -100),
            
            // Take Pic Button
            takePicButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            takePicButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            takePicButton.widthAnchor.constraint(equalToConstant: 50),
            takePicButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        //Adding target
        takePicButton.addTarget(self, action: #selector(cameraDidTapped), for: .touchUpInside)
    }
    
    @objc private func cameraDidTapped() {
        
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.delegate = self
        present(vc, animated: true)
        
    }
    
}

extension ViewController:  UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
        
        self.image.image = image
        picker.dismiss(animated: true)
    }
    
    
    
}
