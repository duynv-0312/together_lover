//
//  SettingViewController.swift
//  Together
//
//  Created by Duy Nguyễn on 30/03/2023.
//

import UIKit

class SettingViewController: UIViewController {
    
    @IBOutlet weak var saveData: UIButton!
    @IBOutlet weak var tableView: UITableView!
    let sectionTitles = ["Ngôn ngữ", "Màu nền", "Đánh giá ứng dụng", "Chính sách bảo mật", "Phiên bản"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    private func configView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }
}

extension SettingViewController: UITableViewDelegate, UITableViewDataSource  {
      
      func numberOfSections(in tableView: UITableView) -> Int {
          return sectionTitles.count
      }
      
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return 1
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
          cell.accessoryType = .disclosureIndicator
          // Đặt tiêu đề của cell bằng tiêu đề của section tương ứng
          cell.textLabel?.text = sectionTitles[indexPath.section]
          return cell
      }
      
      func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          switch indexPath.section {
          case 0:
              // Hiển thị alert cho người dùng chọn ngôn ngữ
                    let alert = UIAlertController(title: "Chọn ngôn ngữ", message: "Chọn ngôn ngữ mà bạn muốn sử dụng trong ứng dụng", preferredStyle: .alert)
                    let actionTiengViet = UIAlertAction(title: "Tiếng Việt", style: .default) { (_) in
                        // Lưu ngôn ngữ là tiếng Việt
                        UserDefaults.standard.set("vi", forKey: "language")
                    }
                    alert.addAction(actionTiengViet)
                    
                    let actionTiengAnh = UIAlertAction(title: "Tiếng Anh", style: .default) { (_) in
                        // Lưu ngôn ngữ là tiếng Anh
                        UserDefaults.standard.set("en", forKey: "language")
                    }
                    alert.addAction(actionTiengAnh)
                    let actionHuyBo = UIAlertAction(title: "Huỷ bỏ", style: .cancel, handler: nil)
                    alert.addAction(actionHuyBo)
                    present(alert, animated: true, completion: nil)
          case 1:
              let alert = UIAlertController(title: "Chọn theme", message: "Chọn theme mà bạn muốn sử dụng trong ứng dụng", preferredStyle: .alert)
                      let actionSang = UIAlertAction(title: "Sáng", style: .default) { (_) in
                          // Lưu theme là Sáng
                          UserDefaults.standard.set("light", forKey: "theme")
                      }
                      alert.addAction(actionSang)
                      
                      let actionToi = UIAlertAction(title: "Tối", style: .default) { (_) in
                          // Lưu theme là Tối
                          UserDefaults.standard.set("dark", forKey: "theme")
                      }
                      alert.addAction(actionToi)
                      
                      let actionTuDong = UIAlertAction(title: "Tự động ", style: .default) { (_) in
                          // Lưu theme là Tự động theo hệ thống
                          UserDefaults.standard.set("auto", forKey: "theme")
                      }
                      alert.addAction(actionTuDong)
                      
                      let actionHuyBo = UIAlertAction(title: "Huỷ bỏ", style: .cancel, handler: nil)
                      alert.addAction(actionHuyBo)
                      
                      present(alert, animated: true, completion: nil)
          case 2:
              // Chuyển sang RatingViewController
              let ratingVC = RatingViewController()
              present(ratingVC, animated: true, completion: nil)
          case 3:
              // Chuyển sang PrivacyPolicyViewController
              let privacyVC = PrivacyPolicyViewController()
              present(privacyVC, animated: true, completion: nil)
          case 4:
              // Hiển thị thông tin phiên bản
              let versionVC = VersionViewController()
//              versionVC.modalPresentationStyle = .overCurrentContext
              present(versionVC, animated: true, completion: nil)
          default:
              break
          }
      }
  }
