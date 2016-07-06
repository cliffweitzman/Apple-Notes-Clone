//
//  NSDate+convertToString.swift
//  MakeSchoolNotes
//
//  Created by Cliff Weitzman on 6/15/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import Foundation

extension NSDate {
  func convertToString() -> String {
    return NSDateFormatter.localizedStringFromDate(self, dateStyle: NSDateFormatterStyle.MediumStyle, timeStyle: NSDateFormatterStyle.MediumStyle)
  }
}