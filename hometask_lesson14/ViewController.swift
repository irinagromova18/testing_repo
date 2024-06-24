//
//  ViewController.swift
//  hometask_lesson14
//
//  Created by Ирина Громова on 07.05.2024.
//

import UIKit

class ViewController: UIViewController {
    var data: User?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var changeNameButton: UIButton!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var copyButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.layer.cornerRadius = 30
        
        nameLabel.font = UIFont.systemFont(ofSize: 21, weight: .bold)
        nameLabel.layer.cornerRadius = 5
        nameLabel.clipsToBounds = true
        nameLabel.text = data?.fullName
        
        positionLabel.font = UIFont.systemFont(ofSize: 21)
        positionLabel.layer.cornerRadius = 5
        positionLabel.clipsToBounds = true
        positionLabel.text = data?.position
        
        addressLabel.font = UIFont.systemFont(ofSize: 21)
        addressLabel.layer.cornerRadius = 5
        addressLabel.clipsToBounds = true
        addressLabel.text = data?.address
        
       }

    
    @IBAction func changeNameAction(_ sender: Any) {
        if nameLabel.text == data?.fullName {
            nameLabel.text = data?.firstName
            changeNameButton.setImage(UIImage(systemName: "arrowshape.right"), for: .normal)
        } else {
            nameLabel.text = data?.fullName
            changeNameButton.setImage(UIImage(systemName: "arrowshape.left"), for: .normal)
        }
       }
    
    @IBAction func copyAction(_ sender: Any) {
        UIPasteboard.general.string = addressLabel.text
        self.showToast(message: "Address is copied to clipboard", font: .systemFont(ofSize: 12.0))
        }
}

extension UIViewController {
    func showToast(message : String, font: UIFont) {

        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 100, y: self.view.frame.size.height - 100, width: 200, height: 50))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.font = font
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
             toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
}
