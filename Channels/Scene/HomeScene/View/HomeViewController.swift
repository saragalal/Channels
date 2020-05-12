//
//  HomeViewController.swift
//  Channels
//
//  Created by sara.galal on 3/24/20.
//  Copyright © 2020 Ibtikar. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController<HomePresenter>, HomeViewProtocol {
   
    @IBOutlet private var channelCollectionView: UICollectionView!
    private var adaptor = ChannelCollectionAdaptor()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.setUpCollectionView()

        presenter.viewDidLoad()
    }
    func setUpCollectionView() {
  
    channelCollectionView.register(TitleHeaderCollectionReusableView.nib,
                                   forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                   withReuseIdentifier: TitleHeaderCollectionReusableView.identifier)
    channelCollectionView.register(HeaderCollectionReusableView.nib,
                                   forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                   withReuseIdentifier: HeaderCollectionReusableView.identifier)
    channelCollectionView.register(EpisodeCollectionViewCell.nib,
                                   forCellWithReuseIdentifier: EpisodeCollectionViewCell.identifier)
    channelCollectionView.register(SeriesCollectionViewCell.nib,
                                   forCellWithReuseIdentifier: SeriesCollectionViewCell.identifier)
    channelCollectionView.register(CourseCollectionViewCell.nib,
                                   forCellWithReuseIdentifier: CourseCollectionViewCell.identifier)
        channelCollectionView.register(CategoryCollectionViewCell.nib,
                                       forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        channelCollectionView.collectionViewLayout = createCompositionalLayout()
        adaptor.setAdaptor(collectionView: channelCollectionView)
        
        channelCollectionView.dataSource = adaptor.dataSource
        adaptor.createDataSource()
    }
    func addEpisodes(episodes: [Media]?) {
        adaptor.addEpisodes(episodes: episodes)
    }
    func addChannels(channels: [Channels]?) {
        adaptor.addChannels(channels: channels)
    }
    func addCategories(category: [Categories]?) {
        adaptor.addCategories(category: category)
    }
}

extension HomeViewController {
    
   func createCompositionalLayout() -> UICollectionViewLayout {
            let layout = UICollectionViewCompositionalLayout { sectionIndex, _ in
                let section = self.adaptor.sections[sectionIndex]

                switch section.type {
                case .categories:
                    return self.createCategoryTableSection(using: section)
                case .episode:
                    return self.createEpisodeTableSection(using: section)
                case .course:
                    return self.createCourseSection(using: section)
                case .series:
                    return self.createSeriesTableSection(using: section)
                }
            }

            let config = UICollectionViewCompositionalLayoutConfiguration()
            config.interSectionSpacing = 10
            layout.configuration = config
            return layout
        }

        func createCourseSection(using section: Section) -> NSCollectionLayoutSection {
         let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.8),
                                                                              heightDimension:
             .fractionalHeight(1)))
  item.contentInsets = NSDirectionalEdgeInsets(top: 10.0, leading: 20.0, bottom: 16.0, trailing: 5.0)
     let group = NSCollectionLayoutGroup.horizontal(layoutSize:
        NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                               heightDimension: .fractionalHeight(0.6)),
                               subitem: item, count: 2)
     let section = NSCollectionLayoutSection(group: group)
       section.contentInsets = NSDirectionalEdgeInsets(top: 5.0, leading: 0.0, bottom: 5.0, trailing: 0.0)
       section.orthogonalScrollingBehavior = .continuous
        let layoutSectionHeader = createSectionHeaderWithImage()
        section.boundarySupplementaryItems = [layoutSectionHeader]
                          return section
        }

        func createEpisodeTableSection(using section: Section) -> NSCollectionLayoutSection {
            let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.8),
                                                                                 heightDimension:
                .fractionalHeight(1)))
               item.contentInsets = NSDirectionalEdgeInsets(top: 0.0, leading: 20.0, bottom: 16.0, trailing: 5.0)
               let group = NSCollectionLayoutGroup.horizontal(layoutSize:
                NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                       heightDimension: .fractionalHeight(0.65)),
                                       subitem: item, count: 2)
               let section = NSCollectionLayoutSection(group: group)
               section.contentInsets = NSDirectionalEdgeInsets(top: 5.0, leading: 0.0, bottom: 5.0, trailing: 0.0)
               section.orthogonalScrollingBehavior = .continuous
              let layoutSectionHeader = createSectionHeaderWithImage()
              section.boundarySupplementaryItems = [layoutSectionHeader]
               return section
        }

        func createCategoryTableSection(using section: Section) -> NSCollectionLayoutSection {
            let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                                                 heightDimension:
                .fractionalHeight(1)))
             item.contentInsets = NSDirectionalEdgeInsets(top: 10.0, leading: 5.0, bottom: 10.0, trailing: 5.0)
             let group = NSCollectionLayoutGroup.horizontal(layoutSize:
               NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                      heightDimension: .fractionalHeight(0.1)),
                                      subitem: item, count: 2)
             let section = NSCollectionLayoutSection(group: group)
             section.contentInsets = NSDirectionalEdgeInsets(top: 20.0, leading: 10.0, bottom: 20.0, trailing: 10.0)
            // section.orthogonalScrollingBehavior = .continuous
            let layoutSectionHeader = createSectionHeader()
            section.boundarySupplementaryItems = [layoutSectionHeader]
             return section
        }
    func createSeriesTableSection(using section: Section) -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.45),
                                                                             heightDimension:
          .fractionalHeight(1)))
         item.contentInsets = NSDirectionalEdgeInsets(top: 10.0, leading: 20.0, bottom: 16.0, trailing: 5.0)
         let group = NSCollectionLayoutGroup.horizontal(layoutSize:
            NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.8),
                                   heightDimension: .fractionalHeight(0.5)),
                                   subitem: item, count: 2)
         let section = NSCollectionLayoutSection(group: group)
         section.contentInsets = NSDirectionalEdgeInsets(top: 5.0, leading: 0.0, bottom: 5.0, trailing: 0.0)
         section.orthogonalScrollingBehavior = .continuous
        let layoutSectionHeader = createSectionHeaderWithImage()
        section.boundarySupplementaryItems = [layoutSectionHeader]
         return section
    }
        func createSectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
            let layoutHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.93),
                                                          heightDimension: .estimated(55))
let layoutHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutHeaderSize,
                                                               elementKind:
    UICollectionView.elementKindSectionHeader,
                                                               alignment: .top)
            return layoutHeader
        }
   func createSectionHeaderWithImage() -> NSCollectionLayoutBoundarySupplementaryItem {
               let layoutHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.93),
                                                             heightDimension: .estimated(85))
   let layoutHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutHeaderSize,
                                                                  elementKind:
       UICollectionView.elementKindSectionHeader,
                                                                  alignment: .top)
               return layoutHeader
           }
}
