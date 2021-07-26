//
//  Entry+Convenience.swift
//  JournalCoreData
//
//  Created by Bryan Gomez on 7/26/21.
//

import Foundation
import CoreData

extension Entry {
    @discardableResult
    convenience init(title: String, bodytext: String, timestamp: Date = Date(), context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.title = title
        self.bodytext = bodytext
        self.timestamp = timestamp
        
    }
}
