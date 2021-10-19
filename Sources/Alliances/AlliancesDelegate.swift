//
//  File.swift
//  
//
//  Created by linhey on 2021/10/18.
//

import Combine

public class AlliancesUICore {
    
    public let reload = PassthroughSubject<Void, Never>()
    
    public let canOpenSettings = CurrentValueSubject<Bool, Never>(true)
    public let canRun = CurrentValueSubject<Bool, Never>(true)
    public let progress = CurrentValueSubject<Int, Never>(0)
    
    public init() {}

}

public protocol AlliancesDelegate {
    
    var uiCore: AlliancesUICore { get }
    
    var canOpenSettings: Bool { get set }
    var canRun: Bool { get set }

    func openSettings()
    func run() throws
    
}

public extension AlliancesDelegate {
    
    var canOpenSettings: Bool {
        set { uiCore.canOpenSettings.send(newValue) }
        get { uiCore.canOpenSettings.value }
    }
    
    var canRun: Bool {
        set { uiCore.canRun.send(newValue) }
        get { uiCore.canRun.value }
    }
    
    var progress: Int {
        set { uiCore.progress.send(newValue) }
        get { uiCore.progress.value }
    }
    
    func reload() {
        uiCore.reload.send()
    }
    
}
