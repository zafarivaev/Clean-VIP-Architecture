//
//  TitlesService.swift
//  Clean-VIP
//
//  Created by Zafar on 5/26/20.
//  Copyright © 2020 Zafar. All rights reserved.
//

import CoreData

protocol TitlesService: class {
    func getTitles() throws -> [Title]
    func addTitle(text: String) throws -> Title
    func deleteTitle(with id: String) throws
    func getTitle(with id: String) throws -> Title?
}

class TitlesServiceImplementation: TitlesService {
    
    let persistentContainer = PersistentContainerProvider.getInstance()
    lazy var managedContext: NSManagedObjectContext = { persistentContainer.viewContext
    }()
    
    func getTitles() throws -> [Title] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Title")
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            
            if let titles = result as? [Title] {
                return titles
            } else {
                return []
            }
        } catch {
            print("Couldn't get titles")
            return []
        }
    }
    
    func addTitle(text: String) throws -> Title {
        let title = NSEntityDescription.insertNewObject(forEntityName: "Title", into: managedContext) as! Title
        title.text = text
        title.id = UUID().uuidString
        
        do {
            try managedContext.save()
        } catch {
            print("Couldn't add a title")
        }
        
        return title
    }
    
    func deleteTitle(with id: String) throws {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Title")
        fetchRequest.predicate = NSPredicate(format: "id = %@", id)
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            
            if let objectToDelete = result.first as? NSManagedObject {
                managedContext.delete(objectToDelete)
                
                do {
                    try managedContext.save()
                } catch {
                    print(error)
                }
            }
        } catch {
            print(error)
        }
    }
    
    func getTitle(with id: String) throws -> Title? {
        let predicate = NSPredicate(format: "id = %@", id)
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Title")
        fetchRequest.predicate = predicate
        
        do {
            let result = try managedContext.fetch(fetchRequest)
            
            if let title = result.first as? Title  {
                return title
            }
        } catch {
            print("Couldn't get title")
        }
        
        return nil
    }
}
