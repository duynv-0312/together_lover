//
//  SettingViewController.swift
//  Together
//
//  Created by Duy Nguyễn on 30/03/2023.
//

import UIKit

class SettingViewController: UIViewController {
    
    let data = ["Ngôn ngữ", "", "12 Cung hoàng đạo",  "Đánh giá ứng dụng", "", "Chính sách bảo mật", "Phiên bản"]
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    private func configView() {
        tableView.delegate = self
        tableView.dataSource = self

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
      
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

//class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
//    
//    @IBOutlet weak var tableView: UITableView!
//    
//    let sectionTitles = ["Section 1", "Section 2", "Section 3", "Section 4", "Section 5"]
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        tableView.delegate = self
//        tableView.dataSource = self
//    }
//    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return sectionTitles.count
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
//    }
//    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 50
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsCell", for: indexPath) as! SettingsTableViewCell
//        
//        cell.titleLabel.text = sectionTitles[indexPath.section]
//        
//        return cell
//    }
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SectionDetailViewController") as! SectionDetailViewController
//        
//        vc.sectionTitle = sectionTitles[indexPath.section]
//        
//        self.navigationController?.pushViewController(vc, animated: true)
//    }
//}
//
//class SettingsTableViewCell: UITableViewCell {
//    
//    @IBOutlet weak var titleLabel: UILabel!
//    @IBOutlet weak var button: UIButton!
//    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
//    
//    @IBAction func buttonTapped(_ sender: Any) {
//       
