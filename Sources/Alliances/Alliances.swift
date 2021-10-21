import Foundation
import Stem

public class AlliancesConfiguration {
    
    public var folder: FilePath.Folder
    
    public var settings: [String: Any] {
        set {
            (newValue as NSDictionary).write(to: folder.file(name: "settings.plist").url, atomically: true)
        }
        get {
            guard let dict = NSDictionary(contentsOfFile: folder.file(name: "settings.plist").url.path) else {
                return [:]
            }
            return (dict as? [String : Any]) ?? [:]
        }
    }
    
    public init(folder: FilePath.Folder) {
        self.folder = folder
    }
    
    public convenience init(from configuration: AlliancesConfiguration, app: AlliancesApp.Type) {
        self.init(folder: configuration.folder.folder(name: app.appInfo.id))
        _ = try? configuration.folder.folder(name: app.appInfo.id).create()
    }
    
}

public struct AppInfo: Identifiable, Equatable, Hashable, Codable {

    public let id: String
    public let icon: URL?
    public let name: String
    public let summary: String
    
    public init(id: String, name: String, icon: URL? = nil, summary: String = "") {
        self.id = id
        self.name = name
        self.icon = icon
        self.summary = summary
    }
    
}

public protocol AlliancesApp: AlliancesDelegate {
    
    static var appInfo: AppInfo { get }
    
    var configuration: AlliancesConfiguration { get }
        
    /// 标题
    var name: String { get }
    /// 备注
    var remark: String? { get }
    /// 子任务
    var tasks: [AlliancesApp] { get }
    
    init(_ configuration: AlliancesConfiguration)
}


public extension AlliancesApp {
        
    var remark: String? { nil }
    
}
