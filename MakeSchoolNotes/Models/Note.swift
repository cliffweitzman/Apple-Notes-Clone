//
//  Note.swift
//  MakeSchoolNotes
//
//  Created by Cliff Weitzman on 6/11/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import Foundation
import RealmSwift

class Note: Object {
    dynamic var title = ""
    dynamic var content = ""
    dynamic var modificationTime = NSDate()
}
