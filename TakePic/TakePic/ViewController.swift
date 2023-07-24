//
//  ViewController.swift
//  TakePic
//
//  Created by Caio Chaves on 24.07.23.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Properties
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
    
    private var camera = UIImagePickerController()
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
        camera.delegate = self
    }
    
    
    //MARK: Configuring layout
    private func configureLayout() {
        view.backgroundColor = .systemBackground
        
        //Adding view
        view.addSubview(takePicButton)
        
        takePicButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
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
        
        guard let mediaTypes = UIImagePickerController.availableMediaTypes(for: .camera) else { return }
        
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.mediaTypes = mediaTypes
        present(vc, animated: true)
    }
    
}

extension ViewController:  UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
    }
    
}
