import SwiftUI
import Pow
import Combine

@objc(PowViewManager)
class PowViewManager: RCTViewManager {
    
    override func view() -> (PowView) {
        return PowView()
    }
    
    @objc override static func requiresMainQueueSetup() -> Bool {
        return false
    }
}

enum AnimationType: String {
    case spray, rise
}

final class Props: ObservableObject {
    @Published var size: CGSize = .zero
    @Published var toggle: Bool = false
    @Published var value: String = ""
    @Published var noSound: Bool = true
    @Published var type: AnimationType = .rise
}

final class PowView : UIView {
    var cancellables = Set<AnyCancellable>()
    let props = Props()
    
    @objc var animationType: String = "rise" {
        didSet {
            if let type = AnimationType(rawValue: animationType) {
                props.type = type
            }
        }
    }
    
    @objc var size: NSDictionary? = nil {
        didSet {
            if let size {
                let width = size["width"] as! CGFloat
                let height = size["height"] as! CGFloat
                props.size = .init(width: width, height: height)
            }
        }
    }
    
    @objc var onPress: RCTDirectEventBlock? = nil {
        didSet {
            if let onPress {
                props.$toggle.sink { _ in
                    print("*******************")
                    onPress(["value": self.props.value])
                }.store(in: &cancellables)
            }
        }
    }
    
    @objc var noSound: Bool = true {
        didSet {
            props.noSound = noSound
        }
    }

    @objc var value: NSString? = nil {
        didSet {
            if let value {
                props.value = value as String
            }
        }
    }
    
    lazy var pow = PowUIView(props: props)
    
    lazy var vc = ViewController(uiView: self.pow)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(vc.view)
        vc.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            vc.view.trailingAnchor.constraint(equalTo: trailingAnchor),
            vc.view.leadingAnchor.constraint(equalTo: leadingAnchor),
            vc.view.topAnchor.constraint(equalTo: topAnchor),
            vc.view.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
