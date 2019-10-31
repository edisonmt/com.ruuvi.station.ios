import Foundation

protocol TagActionsViewOutput {
    func viewDidLoad()
    func viewDidAppear()
    func viewDidTapOnDimmingView()
    func viewDidAskToClear()
    func viewDidAskToSync()
    func viewDidAskToExport()
}