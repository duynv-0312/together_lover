//
//  AddMemoryViewController.swift
//  Together
//
//  Created by Duy Nguyễn on 30/03/2023.
//

import UIKit

final class AddMemoryViewController: UIViewController {

    @IBOutlet weak var backgroundImage1: UIImageView!
    @IBOutlet weak var markerView: UIView!
    @IBOutlet weak var markerImage: UIImageView!
    @IBOutlet weak var addLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    private func configView() {
        backgroundImage1.image = UIImage(named: "couple7")
        backgroundImage1.contentMode = .scaleToFill
        addLabel.text = " Love Story "
        markerImage.layer.cornerRadius = 25
        markerImage.image = UIImage(systemName: "pencil.line")
        markerView.layer.cornerRadius = 25
        
    }
    
    @IBAction func markerTapped(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MemoryDetailViewController") as! MemoryDetailViewController
        vc.modalPresentationStyle = .fullScreen

        self.present(vc, animated: true, completion: nil)
//        self.dismiss(animated: true, completion: nil)

    }
}
