//
//  MainMemoryViewController.swift
//  Together
//
//  Created by Duy Nguyễn on 30/03/2023.
//

import UIKit

class MainMemoryViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let imagePicker = UIImagePickerController()

    
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
    var dateStr = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        imagePicker.delegate = self

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

//        heartImage.image = UIImage(named: "heart")//
        datePickerView.layer.cornerRadius = 12
        datePicker.datePickerMode = .date
        datePickerView.isHidden = true

        if let imageUrl = Bundle.main.url(forResource: "giphy", withExtension: "gif") {
           do {
               let imageData = try Data(contentsOf: imageUrl)
               let animatedImage = UIImage.gifImageWithData(data: imageData)
               heartImage.image = animatedImage
           } catch {
               print("Error loading gif image")
           }
        }
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

        let selectedDate1 = datePicker.date
        let (years, months, weeks, days) = calculateTimeSinceSelectedDate(selectedDate1: selectedDate1)
        yearLabel.text = "\(years)"
        monthLabel.text = "\(months)"
        weekLabel.text = "\(weeks)"
        dayLabel.text = "\(days)"
        
        let horoscope = getHoroscopeFromDate(selectedDate)

               // Hiển thị cung hoàng đạo
        zodiacPerson1.text = "\(horoscope)"
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
    
    func getHoroscopeFromDate(_ dateStr: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        guard let date = dateFormatter.date(from: dateStr) else {
            return ""
        }

        let calendar = Calendar(identifier: .gregorian)
        let month = calendar.component(.month, from: date)
        let day = calendar.component(.day, from: date)
        // check zodiac sign based on day and month
        if month == 1 && day >= 20 || month == 2 && day <= 18 {
            return "Bảo Bình"
        } else if month == 2 && day >= 19 || month == 3 && day <= 20 {
            return "Song Ngư"
        } else if month == 3 && day >= 21 || month == 4 && day <= 19 {
            return "Bạch Dương"
        } else if month == 4 && day >= 20 || month == 5 && day <= 20 {
            return "Kim Ngưu"
        } else if month == 5 && day >= 21 || month == 6 && day <= 20 {
            return "Song Tử"
        } else if month == 6 && day >= 21 || month == 7 && day <= 22 {
            return "Cự Giải"
        } else if month == 7 && day >= 23 || month == 8 && day <= 22 {
            return "Sư Tử"
        } else if month == 8 && day >= 23 || month == 9 && day <= 22 {
            return "Xử Nữ"
        } else if month == 9 && day >= 23 || month == 10 && day <= 22 {
            return "Thiên Bình"
        } else if month == 10 && day >= 23 || month == 11 && day <= 21 {
            return "Bọ Cạp"
        } else if month == 11 && day >= 22 || month == 12 && day <= 21 {
            return "Nhân Mã"
        } else if month == 12 && day >= 22 || month == 12 && day <= 31 || month == 1 && day <= 19 {
            return "Ma Kết"
        } else {
            return ""
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
        let alert = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
              alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
                  self.openCamera()
              }))

              alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { _ in
                  self.openGallery(forImageView: self.personImage1)
              }))

              alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
              self.present(alert, animated: true)
    }
    
    @IBAction func changedPerson2(_ sender: Any) {
        let alert = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
           alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
               self.openCamera()
           }))

           alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { _ in
               self.openGallery(forImageView: self.personImage2)
           }))

           alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
           self.present(alert, animated: true)

    }
    
    func openCamera() {
          if UIImagePickerController.isSourceTypeAvailable(.camera) {
              imagePicker.sourceType = .camera
              present(imagePicker, animated: true, completion: nil)
          }
          else {
              let alert = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
              alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
              present(alert, animated: true, completion: nil)
          }
      }
      
      func openGallery(forImageView imageView: UIImageView) {
          imagePicker.sourceType = .photoLibrary
          imagePicker.allowsEditing = true
          present(imagePicker, animated: true, completion: {
              self.personImage1 = imageView
          })
      }
      
      func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
          
          if let pickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
              personImage1.image = nil
              personImage2.image = nil
              personImage1.contentMode = .scaleAspectFit
              personImage2.contentMode = .scaleAspectFit
              
              if personImage1 == self.personImage1 {
                  personImage1.image = pickedImage
              } else {
                  personImage2.image = pickedImage
              }
          }
          
          dismiss(animated: true, completion: nil)
      }
      
      func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
          dismiss(animated: true, completion: nil)
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

extension Date {
    var day: Int {
        return Calendar.current.component(.day, from: self)
    }
    
    var month: Int {
        return Calendar.current.component(.month, from: self)
    }
    
    var year: Int {
        return Calendar.current.component(.year, from: self)
    }
}

//extension MainMemoryViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        if let pickedImage1 = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
//            personImage1.contentMode = .scaleToFill
//            personImage1.image = pickedImage1
//        }
//
//        if let pickedImage2 = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
//                personImage2.contentMode = .scaleToFill
//                personImage2.image = pickedImage2
//
//        }
//        dismiss(animated: true, completion: nil)
//    }
//
//    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//        dismiss(animated: true, completion: nil)
//    }
//}

//extension MainMemoryViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        if let image = info[.editedImage] as? UIImage {
//            picker.dismiss(animated: true, completion: nil)
//            // Hiển thị ảnh được chọn lên imageView tương ứng
//            if picker.sourceType == .camera {
//                personImage1.image = image
//            } else {
//                personImage2.image = image
//            }
//        }
//    }
//
//    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//        picker.dismiss(animated: true, completion: nil)
//    }
//}
