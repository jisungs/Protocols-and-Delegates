protocol AdvancedLifeSupport{
    func performCPR()
}

class EmeregencyCallHandler {
    var delegate : AdvancedLifeSupport?
    
    func assessSituation(){
        print("Can you tell me what happened?")
        
    }
    
    func medicalEmergency(){
        delegate?.performCPR()
    }
}


struct Paramedic: AdvancedLifeSupport{
    
    init(handler: EmeregencyCallHandler){
        handler.delegate = self
    }
    
    func performCPR() {
        print("The paramadic does chest compresstions, 30 per second.")
    }
    
    
}

class Doctor: AdvancedLifeSupport{
    
    init(handler: EmeregencyCallHandler){
        handler.delegate = self
    }
    
    func performCPR() {
        print("The doctor does chest compresstions, 30 per second.")
    }
    
    func useStethescope() {
        print("Listening for heart sounds")
    }
    
    
}

class Surgen: Doctor {
    override func performCPR() {
        super.performCPR()
        print("Sings staying alive by the BeeGees")
        
    }
    
    func useElectricDrill(){
        print("Whirr... ")
    }
}

let emilio = EmeregencyCallHandler()
let pete = Paramedic(handler: emilio)

let angela = Surgen(handler: emilio)

emilio.assessSituation()
emilio.medicalEmergency()

