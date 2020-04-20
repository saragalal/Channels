//
//  ChannelCollectionAdaptor.swift
//  Channels
//
//  Created by sara.galal on 4/11/20.
//  Copyright © 2020 Ibtikar. All rights reserved.
//

import Foundation
import UIKit
class ChannelCollectionAdaptor: NSObject {
    
    var dataSource: UICollectionViewDiffableDataSource<Section, SectionObject<LatestMedia, Media, Categories>>?
    var sections = [Section]()
    var mediaObjects = [SectionObject<LatestMedia, Media, Categories>]()
    var channelsObjects = [SectionObject<LatestMedia, Media, Categories>]()
    var categoriesObjects = [SectionObject<LatestMedia, Media, Categories>]()
    var sectionsObjects = [[SectionObject<LatestMedia, Media, Categories>]]()
    var channelsArray: [Channels]?
    var collectionView: UICollectionView!
    func setAdaptor(collectionView: UICollectionView) {
        self.collectionView = collectionView
    }
    
   func createDataSource() {
    dataSource = UICollectionViewDiffableDataSource <Section,
    SectionObject <LatestMedia,
                   Media,
                   Categories> >(collectionView: collectionView) { _, indexPath, item in
        print("diffable")
        switch self.sections[indexPath.section].type {
        case .episode:
            
            return self.configureEpisodeSection(index: indexPath, media: item.media)
        case .series:
            
            return self.configureSeriesSection(index: indexPath, channels: item.channels)
        case .course:
            
            return self.configureCourseSection(index: indexPath, channels: item.channels)
        case .categories:
            
            return self.configureCategorieSection(index: indexPath, categories: item.categories)
           }
    }
     dataSource?.supplementaryViewProvider = { [weak self] collectionView, kind, indexPath in
        switch self?.sections[indexPath.section].type {
        case .episode:
            guard let sectionHeader = self?.configureTitleHeader(kind: kind, indexPath: indexPath, type: .episode)
                else { return nil }
            return sectionHeader
        case .series:
            guard let sectionHeader = self?.configureCollectionHeader(kind: kind, indexPath: indexPath, type: .series)
                else { return nil }
            return sectionHeader
              
        case .course:
            guard let sectionHeader = self?.configureCollectionHeader(kind: kind, indexPath: indexPath, type: .course)
                else { return nil }
             return sectionHeader
        case .categories:
            guard let sectionHeader = self?.configureTitleHeader(kind: kind, indexPath: indexPath, type: .categories)
                else { return nil }
            return sectionHeader
        case .none:
        return nil
        }
    }
 }
   func reloadData() {
       var snapshot = NSDiffableDataSourceSnapshot<Section, SectionObject<LatestMedia, Media, Categories>>()
    
    snapshot.appendSections(sections)
    for section in sections {
        switch section.type {
        case .episode:
             snapshot.appendItems(mediaObjects, toSection: section)
        case .course:
            print("course")
            guard let index = sections.firstIndex(of: section) else { return }
            snapshot.appendItems(sectionsObjects[index - 1], toSection: section)
        case .categories:
            
             snapshot.appendItems(categoriesObjects, toSection: section)
        case .series:
            print("series")
            guard let index = sections.firstIndex(of: section) else { return }
            snapshot.appendItems(sectionsObjects[index - 1], toSection: section)
        }
    }

    dataSource?.apply(snapshot)
   }
    private func configureEpisodeSection(index: IndexPath, media: Media?) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EpisodeCollectionViewCell.identifier,
                                                            for: index) as? EpisodeCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: media)
        return cell
    }
    private func configureCourseSection(index: IndexPath, channels: LatestMedia?) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CourseCollectionViewCell.identifier,
                                                            for: index) as? CourseCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: channels)
        return cell
    }
    private func configureSeriesSection(index: IndexPath, channels: LatestMedia?) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SeriesCollectionViewCell.identifier,
                                                            for: index) as? SeriesCollectionViewCell
            else { return UICollectionViewCell() }
               cell.configure(with: channels)
               return cell
    }
    private func configureCategorieSection(index: IndexPath, categories: Categories?) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier,
                                                            for: index) as? CategoryCollectionViewCell
            else { return UICollectionViewCell() }
        cell.configure(with: categories)
        return cell
    }
    
    private func configureTitleHeader(kind: String,
                                      indexPath: IndexPath,
                                      type: SectionType) -> UICollectionReusableView? {
let sectionHeader = collectionView.dequeueReusableSupplementaryView(
    ofKind: kind,
    withReuseIdentifier: TitleHeaderCollectionReusableView.identifier,
    for: indexPath) as? TitleHeaderCollectionReusableView
        sectionHeader?.configure(type: type)
       
        return sectionHeader
    }
    private func configureCollectionHeader(kind: String,
                                           indexPath: IndexPath,
                                           type: SectionType) -> UICollectionReusableView? {
let sectionHeader = collectionView.dequeueReusableSupplementaryView(
    ofKind: kind,
    withReuseIdentifier: HeaderCollectionReusableView.identifier,
    for: indexPath) as? HeaderCollectionReusableView
        if indexPath.section >= 1 {
        guard let item = channelsArray?[indexPath.section - 1] else { return nil }
        sectionHeader?.configure(image: item.iconAsset?.thumbnailUrl,
                                 title: item.title,
                                 subtitle: item.mediaCount,
                                 type: type)
        }
        return sectionHeader
    }
     
    func addEpisodes(episodes: [Media]?) {
        guard let data = episodes else { return }
        for episode in data {
        let obj = SectionObject<LatestMedia, Media, Categories>(channels: nil, media: episode, categories: nil)
        self.mediaObjects.append(obj)
        }
        let section = Section(type: .episode)
        self.sections.append(section)
        //self.sectionsObjects.append(obj)
    }
    func addChannels(channels: [Channels]?) {
        guard let channels = channels else { return }
        self.channelsArray = [Channels]()
        self.channelsArray?.append(contentsOf: channels)
        //self.sectionsObjects.append(obj)
        for channel in channels {
            if channel.series?.isEmpty ?? true {
                let section = Section(type: .series)
                self.sections.append(section)
            
            } else {
                let section = Section(type: .course)
                self.sections.append(section)
       
            }
            guard let items = channel.latestMedia else { return }
            for item in items {
                let obj = SectionObject<LatestMedia, Media, Categories>(channels: item, media: nil, categories: nil)
                self.channelsObjects.append(obj)
            }
        self.sectionsObjects.append(channelsObjects)
             channelsObjects = []
        }
   }
    func addCategories(category: [Categories]?) {
        guard let data = category else { return }
        for categorie in data {
        let obj = SectionObject<LatestMedia, Media, Categories>(channels: nil, media: nil, categories: categorie)
        self.categoriesObjects.append(obj)
        }
        //self.sectionsObjects.append(obj)
        let section = Section(type: .categories)
        self.sections.append(section)
        self.reloadData()
    }
}
