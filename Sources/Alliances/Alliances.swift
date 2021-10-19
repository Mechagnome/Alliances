import Foundation

public protocol AlliancesApp: AlliancesDelegate {
    
    static var bundleID: String { get }
    /// 标题
    var name: String { get }
    /// 备注
    var remark: String? { get }
    /// 子任务
    var tasks: [AlliancesApp.Type] { get }
    /// 处理路由
    func deeplink(open url: URL) -> Bool
    
    init()
}


public extension AlliancesApp {
    
    var remark: String? { nil }
    func deeplink(open url: URL) -> Bool { false }
    
}
