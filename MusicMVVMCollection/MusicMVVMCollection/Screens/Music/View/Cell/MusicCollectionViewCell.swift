//
//  MusicCollectionViewCell.swift
//  MusicMVVMCollection
//
//  Created by Consultant on 11/30/22.
//

import UIKit

class MusicCollectionViewCell: UICollectionViewCell {
    let view = UICollectionViewCell()

    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var albumLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    
        
        self.img.layer.cornerRadius = 100
    }
    
    
//    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let width = view.frame.size.width - 22
//        return CGSize(width: width - 16, height: 160)
//    }
//    
    
}


