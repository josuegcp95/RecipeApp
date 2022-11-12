//
//  Recipe+CoreDataClass.swift
//  FoodManChu
//
//  Created by Josue Cruz on 7/8/22.
//
//

import Foundation
import CoreData

@objc(Recipe)
public class Recipe: NSManagedObject {
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        self.created = Date()
    }
}
