//
//  MemoryDetailViewController.swift
//  Together
//
//  Created by Duy Nguyễn on 30/03/2023.
//

import UIKit

final class MemoryDetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var selectImageView: UIView!
    @IBOutlet weak var memoryTextField: UITextField!
    @IBOutlet weak var dateView: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var numberOfYearsLabel: UILabel!
    @IBOutlet weak var numberOfDaysLabel: UILabel!
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var datePickerView: UIView!
    @IBOutlet weak var dateButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()

    }
    
    private func configView() {
        dateView.layer.cornerRadius = 4
        dateView.layer.borderWidth = 1
        dateView.layer.borderColor = UIColor.systemGray.cgColor
        
        memoryTextField.layer.cornerRadius = 4
        memoryTextField.layer.borderWidth = 1
        memoryTextField.layer.borderColor = UIColor.systemGray.cgColor
        selectImageView.layer.cornerRadius = 4
        
        datePickerView.layer.cornerRadius = 12
        datePicker.datePickerMode = .date
              // Hide the date picker view
        datePickerView.isHidden = true
        
    }
    
    @IBAction func closeButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func savedButton(_ sender: Any) {
        
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
         // Update the date label
         dateLabel.text = selectedDate
         // Hide the date picker view
         datePickerView.isHidden = true
        let number = Date.dates(from: datePicker.date, to: Date()).count
        numberOfDaysLabel.text = "\(number)"

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
      
      @objc func okButtonTapped() {
          // Get the selected date
          let dateFormatter = DateFormatter()
          dateFormatter.dateFormat = "dd/MM/yyyy"
          let selectedDate = dateFormatter.date(from: dateLabel.text ?? "") ?? Date()
          
          // Update the date label
          dateLabel.text = dateFormatter.string(from: selectedDate)
          
          // Calculate the number of days from selected date to current date
          let numberOfDays = numberOfDays(from: selectedDate)
          
          // Update the label showing the number of days
          numberOfDaysLabel.text = "\(numberOfDays) days"
          
          // Hide the date picker view
          datePickerView.isHidden = true
      }
      
      // ... các hàm và đoạn mã khác của bạn ở đây
    
    @IBAction func selectImageButton(_ sender: Any) {
        
        let imagePicker = UIImagePickerController()
         imagePicker.delegate = self
         imagePicker.allowsEditing = false
         let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
         let cameraAction = UIAlertAction(title: "Take Photo", style: .default) { (action) in
             imagePicker.sourceType = .camera
             self.present(imagePicker, animated: true, completion: nil)
         }
        
         let photoLibraryAction = UIAlertAction(title: "Choose from Library", style: .default) { (action) in
             imagePicker.sourceType = .photoLibrary
             self.present(imagePicker, animated: true, completion: nil)
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
}

extension MemoryDetailViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.contentMode = .scaleAspectFit
            imageView.image = pickedImage
        }
        dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
