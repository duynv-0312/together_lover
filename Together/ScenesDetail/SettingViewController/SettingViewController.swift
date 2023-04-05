//
//  SettingViewController.swift
//  Together
//
//  Created by Duy Nguyễn on 30/03/2023.
//

import UIKit

class SettingViewController: UIViewController {
    
    let data = ["Chọn ngày bắt đầu", "Hình nền", "Font chữ", "Màu ứng dụng", "", "12 Cung hoàng đạo", "Phiên bản Plus"," ", "Đánh giá ứng dụng", "", "Chính sách bảo mật", "Phiên bản"]


    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()

    }
    
    private func configView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ThirdTableViewCell", bundle: nil),
                           forCellReuseIdentifier: "ThirdTableViewCell")
    }
    
    @IBAction func closeSetting(_ sender: Any) {
        self.dismiss(animated: true)
    }
}

extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ThirdTableViewCell",
                                                 for: indexPath) as! ThirdTableViewCell
        cell.textSetting?.text = data[indexPath.section]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
