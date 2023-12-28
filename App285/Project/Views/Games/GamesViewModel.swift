//
//  GamesViewModel.swift
//  App285
//
//  Created by IGOR on 16/12/2023.
//

import SwiftUI
import CoreData

final class GamesViewModel: ObservableObject {

    @AppStorage("CreatedGames") var CreatedGames: [String] = []
    
    @Published var gameName: String = ""
    @Published var gameDescription: String = ""
    @Published var gameTP: String = ""
    @Published var gameWR: String = ""
    
    @Published var games: [GamesModel] = []
    @Published var selectedGame: GamesModel?

    func addGame(completion: @escaping () -> (Void)) {
        
        CoreDataStack.shared.modelName = "GamesModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let sub = NSEntityDescription.insertNewObject(forEntityName: "GamesModel", into: context) as! GamesModel
        
        sub.gameName = gameName
        sub.gameTP = Int16(Int(gameTP) ?? 0)
        sub.gameDescription = gameDescription
        sub.gameWR = Int16(Int(gameWR) ?? 0)

        
        CoreDataStack.shared.saveContext()
        
        completion()
    }
    
    func fetchGames() {
        
        CoreDataStack.shared.modelName = "GamesModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<GamesModel>(entityName: "GamesModel")

        do {
            
            let branch = try context.fetch(fetchRequest)
            
            self.games = branch
//            self.subscriptions = branch
            
        } catch let error as NSError {
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.games = []
        }
    }

}

