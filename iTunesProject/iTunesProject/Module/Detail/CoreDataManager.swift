//
//  DataManagerProtocol.swift
//  iTunesProject
//
//  Created by Defne Çetiner on 12.06.2023.
//

import CoreData
import iTunesAPI

class CoreDataManager {
    static let shared = CoreDataManager()
    private init() { }

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "iTunesProject")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

    func addToFavorites(track: Track) {
        let context = persistentContainer.viewContext
        let favoriteTrack = CDFavoriteTrack(context: context)
        favoriteTrack.trackId = Int64(track.trackID ?? 0)
        favoriteTrack.artistName = track.artistName
        favoriteTrack.trackName = track.trackName
        favoriteTrack.imageUrl = track.artworkUrl100
        favoriteTrack.isFavorite = true
        saveContext()
    }

    func removeFromFavorites(trackId: Int) {
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<CDFavoriteTrack>(entityName: "CDFavoriteTrack")
        fetchRequest.predicate = NSPredicate(format: "trackId == %d", trackId)
        if let result = try? context.fetch(fetchRequest), let favoriteTrack = result.first {
            context.delete(favoriteTrack)
            saveContext()
        }
    }

    func isFavorite(trackId: Int) -> Bool {
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<CDFavoriteTrack>(entityName: "CDFavoriteTrack")
        fetchRequest.predicate = NSPredicate(format: "trackId == %d", trackId)
        if let result = try? context.fetch(fetchRequest), !result.isEmpty {
            return true
        }
        return false
    }
}
