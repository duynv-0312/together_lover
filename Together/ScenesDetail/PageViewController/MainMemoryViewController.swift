//
//  MainMemoryViewController.swift
//  Together
//
//  Created by Duy Nguyễn on 30/03/2023.
//

import UIKit

class MainMemoryViewController: UIViewController {
    
    @IBOutlet weak var backgroundImage2: UIImageView!
    
    @IBOutlet weak var heartView: UIView!
    @IBOutlet weak var heartImage: UIImageView!
    @IBOutlet weak var personImageView1: UIView!
    @IBOutlet weak var personImageView2: UIView!
    @IBOutlet weak var personImage1: UIImageView!
    @IBOutlet weak var personImage2: UIImageView!
    
    
    @IBOutlet weak var nameImage1: UIView!
    @IBOutlet weak var nameImage2: UIView!
    @IBOutlet weak var namePerson1: UILabel!
    @IBOutlet weak var namePerson2: UILabel!
    
    @IBOutlet weak var genderImage1: UIImageView!
    @IBOutlet weak var zodiacPerson1: UILabel!
    @IBOutlet weak var zodiacButton1: UIButton!
    
    
    @IBOutlet weak var genderImage2: UIImageView!
    @IBOutlet weak var zodiacPerson2: UILabel!
    @IBOutlet weak var zodiacButton2: UIButton!
    
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var numberOfDaysLabel: UILabel!
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var datePickerView: UIView!
    @IBOutlet weak var dateButton: UIButton!
    
    
    @IBOutlet weak var yearLabel: UILabel!
    
    @IBOutlet weak var monthLabel: UILabel!
    
    
    @IBOutlet weak var firstBirthday: UILabel!
    @IBOutlet weak var secondBirthday: UILabel!
    
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var weekLabel: UILabel!
    @IBOutlet weak var heartButton: UIButton!
    var name1: String = ""
    var name2: String = ""
    var gender1: String = ""
    var gender2: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    private func configView() {
        
        backgroundImage2.image = UIImage(named: "couple11")
        backgroundImage2.contentMode = .scaleToFill
        
        personImageView1.layer.cornerRadius = 50
        personImageView2.layer.cornerRadius = 50
        
        personImage1.layer.cornerRadius = 48
        personImage2.layer.cornerRadius = 48
        
        nameImage1.backgroundColor = .clear
        nameImage2.backgroundColor = .clear
        
        heartView.backgroundColor = .clear
        
        
        namePerson1.text = "Tôi"
        namePerson1.font = .boldSystemFont(ofSize: 20)
        namePerson1.tintColor = .white
        
        namePerson2.text = "Người ấy"
        namePerson2.font = .boldSystemFont(ofSize: 20)
        namePerson2.tintColor = .white
        
        zodiacPerson1.text = "Nhân mã"
        zodiacPerson2.text = "Nhân mã"


        heartImage.image = UIImage(named: "heart")//
        datePickerView.layer.cornerRadius = 12
        datePicker.datePickerMode = .date
        datePickerView.isHidden = true


        guard let url = Bundle.main.url(forResource: "gifff", withExtension: "gif") else {
            return
        }
        guard let gifData = try? Data(contentsOf: url) else { return }
        let gifImage = UIImage.gifImageWithData(data: gifData)
        heartImage.image = gifImage

    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        // Hide the date picker view
        datePickerView.isHidden = true

    }
    
    
    @IBAction func okButtonTapped(_ sender: Any) {
        // Get the selected date
         let dateFormatter = DateFormatter()
         dateFormatter.dateFormat = "dd/MM/yyyy"
         let selectedDate = dateFormatter.string(from: datePicker.date)
         
         dateLabel.text = selectedDate
         datePickerView.isHidden = true
        
        let number = Date.dates(from: datePicker.date, to: Date()).count
        numberOfDaysLabel.text = "\(number)"
//        let components = number.dateComponents([.year, .month, .weekOfYear, .day], from: date)
//
//        let year = components.year ?? 0
//        let month = components.month ?? 0
//        let week = components.weekOfYear ?? 0
//        let day = components.day ?? 0
        
        let selectedDate1 = datePicker.date
        let (years, months, weeks, days) = calculateTimeSinceSelectedDate(selectedDate1: selectedDate1)
        yearLabel.text = "\(years)"
        monthLabel.text = "\(months)"
        weekLabel.text = "\(weeks)"
        dayLabel.text = "\(days)"
    }
    
    func calculateTimeSinceSelectedDate(selectedDate1: Date) -> (Int, Int, Int, Int) {
        let currentDate = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .weekOfYear, .day], from: selectedDate1, to: currentDate)
        
        let years = components.year ?? 0
        let months = components.month ?? 0
        let weeks = components.weekOfYear ?? 0
        let days = components.day ?? 0
        
        return (years, months, weeks, days)
    }
    
    @IBAction func selectDateButton(_ sender: Any) {
        datePickerView.isHidden = false
    }
    
    func numberOfDays(from date: Date) -> Int {
          let calendar = Calendar.current
          let currentDate = Date()
          let startOfDay = calendar.startOfDay(for: date)
          let days = calendar.dateComponents([.day], from: startOfDay, to: currentDate)
          return days.day ?? 0
      }
    
    func calculateZodiac(date: Date) -> String {
        let calendar = Calendar.current
        let day = calendar.component(.day, from: date)
        let month = calendar.component(.month, from: date)
        
        // check zodiac sign based on day and month
        if (month == 1 && day >= 20) || (month == 2 && day <= 18) {
            return "Aquarius"
        } else if (month == 2 && day >= 19) || (month == 3 && day <= 20) {
            return "Pisces"
        } else if (month == 3 && day >= 21) || (month == 4 && day <= 19) {
            return "Aries"
        } else if (month == 4 && day >= 20) || (month == 5 && day <= 20) {
            return "Taurus"
        } else if (month == 5 && day >= 21) || (month == 6 && day <= 21) {
            return "Gemini"
        } else if (month == 6 && day >= 22) || (month == 7 && day <= 22) {
            return "Cancer"
        } else if (month == 7 && day >= 23) || (month == 8 && day <= 22) {
            return "Leo"
        } else if (month == 8 && day >= 23) || (month == 9 && day <= 22) {
            return "Virgo"
        } else if (month == 9 && day >= 23) || (month == 10 && day <= 22) {
            return "Libra"
        } else if (month == 10 && day >= 23) || (month == 11 && day <= 21) {
            return "Scorpio"
        } else if (month == 11 && day >= 22) || (month == 12 && day <= 21) {
            return "Sagittarius"
        } else {
            return "Capricorn"
        }
    }
      
    @IBAction func buttonTapped(_ sender: Any) {
        let images = [
            UIImage(named: "heart"),
            UIImage(named: "heart"),
            UIImage(named: "heart"),
            UIImage(named: "heart"),
            UIImage(named: "heart"),
            UIImage(named: "heart"),
            UIImage(named: "heart"),
            UIImage(named: "heart"),
            UIImage(named: "heart"),
            UIImage(named: "heart")
        ]
        
        for image in images {
            let imageView = UIImageView(image: image)
            let size = CGSize(width: 50, height: 50)
            let x = CGFloat.random(in: -100...100) + heartButton.frame.midX - size.width / 2
            let y = CGFloat.random(in: -100...100) + heartButton.frame.midY - size.height / 2
            imageView.frame = CGRect(origin: CGPoint(x: x, y: y), size: size)
            view.addSubview(imageView)
            
            UIView.animate(withDuration: 4.0, animations: {
                imageView.alpha = 0
                let x = CGFloat.random(in: -300...300) + self.heartButton.frame.midX - size.width / 2
                let y = CGFloat.random(in: -300...300) + self.heartButton.frame.midY - size.height / 2
                imageView.frame = CGRect(origin: CGPoint(x: x, y: y), size: size)
            }) { (finished) in
                imageView.removeFromSuperview()
            }
        }
    }
    
    @IBAction func settingButton(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SettingViewController") as! SettingViewController
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func changedPerson1(_ sender: Any) {
        let imagePicker1 = UIImagePickerController()
         imagePicker1.delegate = self
         imagePicker1.allowsEditing = false
         let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
         let cameraAction = UIAlertAction(title: "Take Photo", style: .default) { (action) in
             imagePicker1.sourceType = .camera
             self.present(imagePicker1, animated: true, completion: nil)
         }
        
         let photoLibraryAction = UIAlertAction(title: "Choose from Library", style: .default) { (action) in
             imagePicker1.sourceType = .photoLibrary
             self.present(imagePicker1, animated: true, completion: nil)
         }
        
         let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
         alertController.addAction(cameraAction)
         alertController.addAction(photoLibraryAction)
         alertController.addAction(cancelAction)
         if let popoverController = alertController.popoverPresentationController {
             popoverController.sourceView = sender as? UIView
             popoverController.sourceRect = (sender as AnyObject).bounds
         }
         present(alertController, animated: true, completion: nil)
        
    }
    
    @IBAction func changedPerson2(_ sender: Any) {
        let imagePicker2 = UIImagePickerController()
         imagePicker2.delegate = self
         imagePicker2.allowsEditing = false
         let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
         let cameraAction = UIAlertAction(title: "Take Photo", style: .default) { (action) in
             imagePicker2.sourceType = .camera
             self.present(imagePicker2, animated: true, completion: nil)
         }
        
         let photoLibraryAction = UIAlertAction(title: "Choose from Library", style: .default) { (action) in
             imagePicker2.sourceType = .photoLibrary
             self.present(imagePicker2, animated: true, completion: nil)
         }
        
         let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
         alertController.addAction(cameraAction)
         alertController.addAction(photoLibraryAction)
         alertController.addAction(cancelAction)
         if let popoverController = alertController.popoverPresentationController {
             popoverController.sourceView = sender as? UIView
             popoverController.sourceRect = (sender as AnyObject).bounds
         }
         present(alertController, animated: true, completion: nil)
        
    }
    
    @IBAction func changedName1(_ sender: Any) {
        let alertController = UIAlertController(title: "Enter Name", message: nil, preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.placeholder = "Name"
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let saveAction = UIAlertAction(title: "Save", style: .default) { (action) in
            if let name = alertController.textFields?.first?.text {
                self.name1 = name
                self.namePerson1.text = name
            }
        }
        alertController.addAction(cancelAction)
        alertController.addAction(saveAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func changedName2(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Enter Name", message: nil, preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.placeholder = "Name"
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let saveAction = UIAlertAction(title: "Save", style: .default) { (action) in
            if let name = alertController.textFields?.first?.text {
                self.name2 = name
                self.namePerson2.text = name
            }
        }
        alertController.addAction(cancelAction)
        alertController.addAction(saveAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func changedGender1(_ sender: Any) {
        datePickerView.isHidden = false
    }
    
}

extension UIImage {
    static func gifImageWithData(data: Data) -> UIImage? {
        guard let source = CGImageSourceCreateWithData(data as CFData, nil) else {
            print("Error: Can't create image source from data")
            return nil
        }
        
        let count = CGImageSourceGetCount(source)
        var images = [UIImage]()
        
        for i in 0..<count {
            if let cgImage = CGImageSourceCreateImageAtIndex(source, i, nil) {
                images.append(UIImage(cgImage: cgImage, scale: UIScreen.main.scale, orientation: .up))
            }
        }
        
        if images.isEmpty {
            print("Error: Can't create images from GIF data")
            return nil
        }
        
        return UIImage.animatedImage(with: images, duration: durationForImageAtIndex(0, source: source))
    }
    
    static func durationForImageAtIndex(_ index: Int, source: CGImageSource!) -> TimeInterval {
        var duration = 0.1
        
        let cfProperties = CGImageSourceCopyPropertiesAtIndex(source, index, nil)
        let gifProperties: CFDictionary = unsafeBitCast(
            CFDictionaryGetValue(cfProperties, Unmanaged.passUnretained(kCGImagePropertyGIFDictionary).toOpaque()),
            to: CFDictionary.self)
        
        var delayObject: AnyObject = unsafeBitCast(
            CFDictionaryGetValue(gifProperties,
                                 Unmanaged.passUnretained(kCGImagePropertyGIFUnclampedDelayTime).toOpaque()),
            to: AnyObject.self)
        if delayObject.doubleValue == 0 {
            delayObject = unsafeBitCast(CFDictionaryGetValue(gifProperties,
                                                             Unmanaged.passUnretained(kCGImagePropertyGIFDelayTime).toOpaque()), to: AnyObject.self)
        }
        
        duration = delayObject as! TimeInterval
        
        if duration < 0.1 {
            duration = 0.1
        }
        
        return duration
    }
    
    func calculateAstrologicalSign(date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        guard let birthDate = dateFormatter.date(from: date) else { return "" }
        let calendar = Calendar.current
        let month = calendar.component(.month, from: birthDate)
        let day = calendar.component(.day, from: birthDate)
        
        switch (month, day) {
        case (3, 21..<32), (4, 1..<20):
            return "Aries"
        case (4, 20..<31), (5, 1..<21):
            return "Taurus"
        case (5, 21..<32), (6, 1..<21):
            return "Gemini"
        case (6, 21..<31), (7, 1..<23):
            return "Cancer"
        case (7, 23..<32), (8, 1..<23):
            return "Leo"
        case (8, 23..<32), (9, 1..<23):
            return "Virgo"
        case (9, 23..<31), (10, 1..<23):
            return "Libra"
        case (10, 23..<32), (11, 1..<22):
            return "Scorpio"
        case (11, 22..<31), (12, 1..<22):
            return "Sagittarius"
        case (12, 22..<32), (1, 1..<20):
            return "Capricorn"
        case (1, 20..<32), (2, 1..<19):
            return "Aquarius"
        case (2, 19..<30), (3, 1..<21):
            return "Pisces"
        default:
            return ""
        }
    }
}


extension MainMemoryViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage1 = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            personImage1.contentMode = .scaleToFill
            personImage1.image = pickedImage1
        }
        
        if let pickedImage2 = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                personImage2.contentMode = .scaleToFill
                personImage2.image = pickedImage2

        }
        dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
