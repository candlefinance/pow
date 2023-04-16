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
    case spray, rise, none
}

final class Props: ObservableObject {
    @Published var size: CGSize = .zero
    @Published var value: String = ""
    @Published var isSoundOn: Bool = false
    @Published var type: AnimationType = .none
}

final class PowView : UIView {
    var cancellables = Set<AnyCancellable>()
    let props = Props()
    
    @objc var animationType: String = "none" {
        didSet {
            if let type = AnimationType(rawValue: animationType), type != .none {
                props.type = type
                vc.view.clipsToBounds = false
                clipsToBounds = false
            }
        }
    }
    
    @objc var size: NSDictionary? = nil {
        didSet {
            if let size,
                let width = size["width"] as? CGFloat,
                let height = size["height"] as? CGFloat {
                props.size = .init(width: width, height: height)
            }
        }
    }
    
    @objc var isSoundOn: Bool = false {
        didSet {
            props.isSoundOn = isSoundOn
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
            vc.view.heightAnchor.constraint(equalTo: heightAnchor),
            vc.view.widthAnchor.constraint(equalTo: widthAnchor),
            vc.view.leadingAnchor.constraint(equalTo: leadingAnchor),
            vc.view.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
