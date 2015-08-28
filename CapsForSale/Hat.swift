//
//  Hat.swift
//  CapsForSale
//
//  Created by Fabian Canas on 8/28/15.
//  Copyright (c) 2015 Fabian Canas. All rights reserved.
//

import UIKit

class Hat: PFObject, PFSubclassing {
    @NSManaged var text :String?
    static func parseClassName() -> String {
        return "Hat"
    }
}
