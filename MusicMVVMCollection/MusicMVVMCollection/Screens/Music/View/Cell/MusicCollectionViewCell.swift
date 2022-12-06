//
//  MusicCollectionViewCell.swift
//  MusicMVVMCollection
//
//  Created by Consultant on 11/30/22.
//

import UIKit

class MusicCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var albumLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
