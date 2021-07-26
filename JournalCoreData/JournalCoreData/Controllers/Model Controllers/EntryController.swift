//
//  EntryController.swift
//  JournalCoreData
//
//  Created by Bryan Gomez on 7/26/21.
//

import Foundation
import CoreData

class EntryController {
    static let shared = EntryController()
    var entries: [Entry] = []
    
    private lazy var fetchRequest: NSFetchRequest<Entry> = {
        let request = NSFetchRequest<Entry>(entityName: "Entry") // looking for a Medication
        request.predicate = NSPredicate(value: true) // true will fetch anything of type Medication.
        return request
    }()
    private init() {}
    
    func createEntry(title: String, body: String) {
        let entries = Entry(title: title, bodytext: body)
        self.entries.append(entries)
        CoreDataStack.saveContext()
    }
    
    func fetchEntries(){
        let entry = (try? CoreDataStack.context.fetch(self.fetchRequest)) ?? []
        print(entry.count)
        self.entries = entry
    }
    
    func updateEntry(entry: Entry, title: String, body: String) {
        entry.title = title
        entry.bodytext = body
        CoreDataStack.saveContext()
    }
    
    func delete(entry: Entry) {
        CoreDataStack.context.delete(entry)
        CoreDataStack.saveContext()
        fetchEntries() // basically load it back. 
    }
    
}
