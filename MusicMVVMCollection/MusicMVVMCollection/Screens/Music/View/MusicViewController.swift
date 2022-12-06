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
    
    let columnLayout = ColumnFlowLayout(
            cellsPerRow: 2,
            minimumInteritemSpacing: 10,
            minimumLineSpacing: 10,
            sectionInset: UIEdgeInsets(top: 50, left: 10, bottom: 50, right: 10)
        )
    
    
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Music"
        self.collectionView.dataSource = self
        self.collectionView.layer.cornerRadius = 25
        self.collectionView.backgroundColor = .systemMint
        
        
        
        collectionView?.collectionViewLayout = columnLayout
        collectionView?.contentInsetAdjustmentBehavior = .always
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "MusicCollectionViewCell")
       
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
                self.view.backgroundColor = .white
                
                cell.layer.cornerRadius = 25

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





extension MusicViewController: UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
        let musicSelection = DetailViewController()
//        guard case musicSelection.album = self.musicAlbumViewModel.albumTitle(for: indexPath.row) else {return}

//        musicSelection.album.text = self.musicAlbumViewModel.albumTitle(for: indexPath.row)
//        musicSelection.artist.text = self.musicAlbumViewModel.artist(for: indexPath.row)
//        self.musicAlbumViewModel.imageData(for: indexPath.row, completion: { data in
//            DispatchQueue.main.async {
//                if let data = data {
//                    musicSelection.albumImage.image = UIImage(data: data)
//                }
//            }
//        })

        
        
        
        
        
        
        self.performSegue(withIdentifier: "detailSegue", sender: indexPath.row)
        //        print(indexPath)
    }
}
