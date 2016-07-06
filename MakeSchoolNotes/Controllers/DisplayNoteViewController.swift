//
//  DisplayNoteViewController.swift
//  MakeSchoolNotes
//
//  Created by Cliff Weitzman on 6/15/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit
import RealmSwift


class DisplayNoteViewController: UIViewController {

    @IBOutlet weak var noteTitleTextField: UITextField!
    @IBOutlet weak var noteContentTextView: UITextView!
    var note: Note?

    
  override func viewDidLoad() {
    super.viewDidLoad()
  }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        // 1. Nice use of let syntax. When inside if let, note is indeed = to note and is a real value, else, if it is note a real note value but nil, treat it as nil.
        if let note = note {
            // 2
            noteTitleTextField.text = note.title
            noteContentTextView.text = note.content
        } else {
            // 3
            noteTitleTextField.text = ""
            noteContentTextView.text = "Body"
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // 1: How to move a variable from one class to another
        let listNotesTableViewController = segue.destinationViewController as! ListNotesTableViewController
        
        if segue.identifier == "Save" {
            print("Save button tapped")

            // if note exists, update title and content
            if let note = note {
                // 1
                let newNote = Note()
                newNote.title = noteTitleTextField.text ?? ""
                newNote.content = noteContentTextView.text ?? "Body"
                
                RealmHelper.updateNote(note, newNote: newNote)
            } else {
                // if note does not exist, create new note
                let note = Note()
                note.title = noteTitleTextField.text ?? ""
                note.content = noteContentTextView.text ?? "Body"
                note.modificationTime = NSDate()
                // 2
                RealmHelper.addNote(note)
            }
            // 3
            listNotesTableViewController.notes = RealmHelper.retrieveNotes()
        } else if segue.identifier == "Cancel" {
            print("Cancel button tapped")
        }
    }
    
}










