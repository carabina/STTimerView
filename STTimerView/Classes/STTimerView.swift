import CoreGraphics

@IBDesignable
class STTimerView: UIView {
    
    var currMinute : Int = 1
    var currSeconds : Int = 0
    var circleColor : UIColor = UIColor.redColor()
    lazy var timer : NSTimer = {
        return NSTimer()
    }()
    lazy var circleLayer : CAShapeLayer = {
        let circle = CAShapeLayer()
        let radius = min(self.frame.size.height, self.frame.size.width) / 2.0;
        circle.path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 2.0 * radius, height: 2.0 * radius)  , cornerRadius: radius).CGPath
        circle.position = CGPoint(x: 0, y: 0)
        circle.fillColor = self.circleColor.CGColor
        circle.strokeColor = UIColor.redColor().CGColor
        circle.lineWidth = 2;
        return circle
    }()
    lazy var timerLabel : UILabel = {
        let label = UILabel()
        label.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)
        label.textAlignment = NSTextAlignment.Center
        return label
    }()
    
    @IBInspectable var minutes: Int = 0 {
        didSet {
            self.currMinute = minutes
        }
    }
    
    @IBInspectable var backgroundCircleColor: UIColor? {
        didSet {
            self.circleColor = backgroundCircleColor!
            self.layer.addSublayer(self.circleLayer)
        }
    }
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.start()
    }
    
    func start(){
        self.layer.addSublayer(self.circleLayer)
        self.addSubview(self.timerLabel)
        self.startCircleAnimation()
        self.timer = NSTimer.scheduledTimerWithTimeInterval(1.0,
                                                            target: self,
                                                            selector: #selector(STTimerView.timerFired),
                                                            userInfo: nil,
                                                            repeats: true)
    }
    
    func stop() {
        timer.invalidate()
    }
    
    func timerFired() {
        if((currMinute > 0 || currSeconds >= 0) && currMinute >= 0){
            if(currSeconds == 0){
                currMinute -= 1;
                currSeconds = 59;
            }else if(currSeconds > 0){
                currSeconds-=1;
            }
            if(currMinute > -1){
                timerLabel.text = String(format:"%d:%02d", currMinute,currSeconds)
            }
        }else{
            self.stop()
        }
    }
    
    func startCircleAnimation(){
        let animation : CABasicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = Double(currMinute*60)
        animation.removedOnCompletion = false
        animation.fromValue = 0
        animation.toValue = 1
        animation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionLinear)
        circleLayer.addAnimation(animation, forKey: "drawCircleAnimation")
    }
    
}

