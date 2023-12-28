//
//  MatchesViewModel.swift
//  App285
//
//  Created by IGOR on 16/12/2023.
//

import SwiftUI
import CoreData

final class MatchesViewModel: ObservableObject {
    
    @AppStorage("matchValue") var matchValue: Int = 0

    @Published var sviews: [String] = ["All", "Favorites"]
    @Published var current_sviews = "All"
    
    @Published var matchName: String = ""
    @Published var matchPlayers: String = ""
    @Published var matchDate: String = ""
    @Published var matchStatus: String = ""
    @Published var matchProfit: String = ""
    @Published var matchBet: String = ""
    
    @Published var matches: [MatchesModel] = []
    @Published var selectedMatch: MatchesModel?
    @Published var isDetail: Bool = false
    @Published var isPaymentsDetail: Bool = false

    func addMatch(completion: @escaping () -> (Void)) {
        
        CoreDataStack.shared.modelName = "MatchesModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let sub = NSEntityDescription.insertNewObject(forEntityName: "MatchesModel", into: context) as! MatchesModel
        
        sub.matchName = matchName
        sub.matchPlayers = Int16(Int(matchPlayers) ?? 0)
        sub.matchDate = matchDate
        sub.matchStatus = matchStatus
        sub.matchProfit = Int16(Int(matchProfit) ?? 0)
        sub.matchBet = Int16(Int(matchBet) ?? 0)

        
        CoreDataStack.shared.saveContext()
        
        completion()
    }
    
    func fetchMatches() {
        
        CoreDataStack.shared.modelName = "MatchesModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<MatchesModel>(entityName: "MatchesModel")

        do {
            
            let branch = try context.fetch(fetchRequest)
            
            self.matches = branch
            
        } catch let error as NSError {
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.matches = []
        }
    }
}

