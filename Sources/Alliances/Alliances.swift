import Combine

public protocol AlliancesApp: AlliancesDelegate {
    
    var name: String { get }
    var tasks: [AlliancesApp] { get }

}
