//
//  AddMemoryViewController.swift
//  Together
//
//  Created by Duy Nguyễn on 30/03/2023.
//

import UIKit

final class AddMemoryViewController: UIViewController {
    
    var infoFromVC2: String?
    
    @IBOutlet weak var markerView: UIView!
    @IBOutlet weak var markerImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    private var dataSource = [MemoryEntity]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        reloadDataSource()
    }
    
    private func configView() {
        markerImage.layer.cornerRadius = 25
        markerImage.image = UIImage(systemName: "pencil.line")
        markerView.layer.cornerRadius = 25
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MemoryTableViewCell", bundle: nil),
                           forCellReuseIdentifier: "MemoryTableViewCell")
    }
    
    private func reloadDataSource() {
        // Goi du lieu tu Coreata len va gan cho dataSource()
        
        tableView.reloadData()
    }
    
    @IBAction func markerTapped(_ sender: Any) {
        let vc2 = storyboard?.instantiateViewController(withIdentifier: "MemoryDetailViewController") as! MemoryDetailViewController
        vc2.modalPresentationStyle = .fullScreen
        present(vc2, animated: true, completion: nil)
    }
}

extension AddMemoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemoryTableViewCell", for: indexPath) as! MemoryTableViewCell
        cell.configCell(data: dataSource[indexPath.row])
        return cell
    }
}
