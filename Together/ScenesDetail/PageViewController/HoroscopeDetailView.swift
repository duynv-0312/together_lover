//
//  HoroscopeDetailView.swift
//  Together
//
//  Created by Duy Nguyễn on 04/04/2023.
//

import UIKit



class HoroscopeDetailView: UIViewController {
    
    var horoscope: Horoscope?
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        if let horoscope = horoscope {
            nameLabel.text = horoscope.name
            dateLabel.text = horoscope.date
            descriptionLabel.text = horoscope.description
            descriptionLabel.numberOfLines = 0
        }
    }
    
    @IBAction func closeButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
