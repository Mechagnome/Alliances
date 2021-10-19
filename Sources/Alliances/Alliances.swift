import Foundation

public protocol AlliancesApp: AlliancesDelegate {
    /// 唯一标识
    static var bundleID: String { get }
        
    /// 标题
    var name: String { get }
    /// 备注
    var remark: String? { get }
    /// 子任务
    var tasks: [AlliancesApp] { get }
    /// 处理路由
    func deeplink(open url: URL) -> Bool
    
    init()
}


public extension AlliancesApp {
    
    func deeplink(open url: URL) -> Bool { false }
    var remark: String? { nil }
    
}
