//
//  File.swift
//  
//
//  Created by linhey on 2021/10/18.
//

import Combine

public class AlliancesUICore {
    
    let reload = PassthroughSubject<Void, Never>()
    
    let canOpenSetting = CurrentValueSubject<Bool, Never>(true)
    let canRun = CurrentValueSubject<Bool, Never>(true)

}

public protocol AlliancesDelegate {
    
    var core: AlliancesUICore { get }
    
    var canOpenSetting: Bool { get set }
    var canRun: Bool { get set }

    func openSetting()
    func run()
    
}

public extension AlliancesDelegate {
    
    var canOpenSetting: Bool {
        set { core.canOpenSetting.send(newValue) }
        get { core.canOpenSetting.value }
    }
    
    var canRun: Bool {
        set { core.canRun.send(newValue) }
        get { core.canRun.value }
    }
    
    func reload() {
        core.reload.send()
    }
    
}
