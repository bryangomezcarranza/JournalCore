//
//  EntryDetailViewController.swift
//  JournalCoreData
//
//  Created by Bryan Gomez on 7/26/21.
//

import UIKit

class EntryDetailViewController: UIViewController {
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    
    var entry: Entry?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let title = titleTextField.text, !title.isEmpty, let body = bodyTextView.text, !body.isEmpty else { return }
        if let entry = entry {
            EntryController.shared.updateEntry(entry: entry, title: title, body: body)
        } else {
            EntryController.shared.createEntry(title: title, body: body)
        }
        navigationController?.popViewController(animated: true)
    }
    @IBAction func clearButtonTapped(_ sender: Any) {
        titleTextField.text = ""
        bodyTextView.text = ""
    }
    
    
    func updateViews() {
        guard let entry = entry else { return }
        titleTextField.text = entry.title
        bodyTextView.text = entry.bodytext
    }


}
