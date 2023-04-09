//
//  MemoryTableViewCell.swift
//  Together
//
//  Created by Duy Nguyễn on 09/04/2023.
//

import UIKit

final class MemoryTableViewCell: UITableViewCell {

    @IBOutlet weak var descriptionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    private func configView() {
        
    }
    
    func configCell(data: MemoryEntity) {
        descriptionLabel.text = data.description
    }
}
