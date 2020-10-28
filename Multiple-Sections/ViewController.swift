//
//  ViewController.swift
//  Multiple-Sections
//
//  Created by Tsering Lama on 10/27/20.
//

import UIKit

class ViewController: UIViewController {
    
    // 1)
    enum Section: Int, CaseIterable {
        case grid
        case single
        
        var coloumnCount: Int {
            switch self { // self represents the instance of the enum
            case .grid:
                return 4
            case .single:
                return 1
            }
        }
    }
    
    // 2)
    @IBOutlet weak var collectionView: UICollectionView! // default layout is flow
    
    typealias DataSource = UICollectionViewDiffableDataSource<Section, Int> // both has to conform to hashable
    
    private var dataSource: DataSource!
    
    // 3)
    private func createLayout() -> UICollectionViewLayout {
        
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            
            // find out what section we are working on
            guard let sectionType = Section(rawValue: sectionIndex) else {
                return nil
            }
            
            // how many coloumn
            let coloumn = sectionType.coloumnCount // 1 or 4
            
            // create layout
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupHeight = coloumn == 1 ? NSCollectionLayoutDimension.absolute(200) : NSCollectionLayoutDimension.fractionalWidth(0.25)
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: groupHeight)
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: coloumn) // 1 or 4
            
            let section = NSCollectionLayoutSection(group: group)
            
            return section
            
        }
        
        return layout
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
}

