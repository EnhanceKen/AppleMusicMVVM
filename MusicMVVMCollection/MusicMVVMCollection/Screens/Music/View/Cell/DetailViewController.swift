//
//  DetailViewController.swift
//  MusicMVVMCollection
//
//  Created by Consultant on 12/6/22.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var albumImage: UIImageView!
    
    
    
    @IBOutlet weak var album: UILabel!
    @IBOutlet weak var artist: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var genre: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
