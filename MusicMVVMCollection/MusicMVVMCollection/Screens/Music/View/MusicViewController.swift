//
//  ViewController.swift
//  MusicMVVMCollection
//
//  Created by Consultant on 11/30/22.
//

import UIKit

class MusicViewController: UIViewController {

    let musicCell = "MusicCollectionViewCell"
    let musicAlbumViewModel = MusicAlbumViewModel()
    
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Music"
        self.collectionView.dataSource = self
//        self.collectionView.delegate = self
//        self.collectionView.prefetchDataSource = self
        self.collectionView.register(UINib(nibName: "MusicCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: self.musicCell)
        
        if let layout = self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        
        self.musicAlbumViewModel.bind {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
            
        }
        
       self.musicAlbumViewModel.fetchPage()
    }
    
    
    
}

extension MusicViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.musicAlbumViewModel.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MusicCollectionViewCell", for: indexPath) as? MusicCollectionViewCell else {
//                print("could not make cell")
                return  UICollectionViewCell()}
            
            switch self.tabBarItem.tag {
            case 0:
                self.view.backgroundColor = .systemMint
                
                cell.albumLabel.text = self.musicAlbumViewModel.albumTitle(for: indexPath.row)
                cell.artistLabel.text = self.musicAlbumViewModel.artist(for: indexPath.row)
                self.musicAlbumViewModel.imageData(for: indexPath.row, completion: { data in
                    DispatchQueue.main.async {
                        if let data = data {
                            cell.img.image = UIImage(data: data)
                        }
                    }
                })
            case 1:

                self.view.backgroundColor = .systemPurple
                if cell.albumLabel.text == "Album Title"{
                    cell.isHidden = true
                }

            default:
                print("errr!")
            }
            return cell
        }

    }
