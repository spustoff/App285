//
//  StrategiesViewModel.swift
//  App285
//
//  Created by IGOR on 16/12/2023.
//

import SwiftUI
import CoreData

final class StrategiesViewModel: ObservableObject {
    
    @Published var sviews: [String] = ["All", "Favorites"]
    @Published var current_sviews = "All"

    @Published var sName: String = ""
    @Published var sDescription: String = ""
    @Published var selectedGame: String = ""
    @AppStorage("CreatedGames") var CreatedGames: [String] = []
    
    @Published var strategies: [StrategiesModel] = []
    @Published var selectedStrategy: StrategiesModel?
    @Published var isDetail: Bool = false

    func addStrategy(currentGame: String, completion: @escaping () -> (Void)) {
        
        CoreDataStack.shared.modelName = "StrategiesModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let sub = NSEntityDescription.insertNewObject(forEntityName: "StrategiesModel", into: context) as! StrategiesModel
        
        sub.sName = sName
        sub.sDescription = sDescription
        sub.currentGame = currentGame
        
        CoreDataStack.shared.saveContext()
        
        completion()
    }
    
    func fetchStrategies() {
        
        CoreDataStack.shared.modelName = "StrategiesModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<StrategiesModel>(entityName: "StrategiesModel")

        do {
            
            let branch = try context.fetch(fetchRequest)
            
            self.strategies = branch
            
        } catch let error as NSError {
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.strategies = []
        }
    }

}
