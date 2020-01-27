import UIKit
import AVFoundation



class ViewController: UIViewController, AVAudioRecorderDelegate, AVAudioPlayerDelegate{
    
    

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    
    
    var maxDb = 0
    var count = 3

    
    
    var audioRecorder: AVAudioRecorder!
    var audioPlayer: AVAudioPlayer!
    var isRecording = false
    var isPlaying = false
    var timer: Timer?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        createTimer()
    }
    

    func createTimer(){

        let timer = Timer.scheduledTimer(timeInterval: 1.0,
                                         target: self,
                                         selector: #selector(self.timerAction(sender:)),
                                         userInfo: nil,
                                         repeats: true)
        timer.fire()

    }
    

       @objc func timerAction(sender:Timer){

            secondLabel.text = String(count)

            if count == 0{
                sender.invalidate()
                Record()
                DispatchQueue.main.asyncAfter(deadline: .now() + 10) {

                    self.stop()
                    
                    let score = self.updateMonitorDb()
                    self.performSegue(withIdentifier: "toFinal", sender: score)
                    
                    
                }
                
            }
        
                count -= 1
            }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let nextVC = segue.destination as! FinalViewController
            nextVC.value = sender as! String

    }
    
           
       
    
    func getURL() -> URL{
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let docsDirect = paths[0]
        let url = docsDirect.appendingPathComponent("recording.m4a")
        return url
    }
    
    @objc func updateMonitorDb() -> String{
        audioRecorder.updateMeters()
        var monitorDb = Int(audioRecorder.averagePower(forChannel: 0))
        monitorDb = monitorDb + 40
        print(monitorDb)
        
        if monitorDb >= maxDb {
            maxDb = monitorDb
            label.text = String(maxDb)
        }
        
        return String(maxDb)
    }
    
    func Record(){
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSession.Category.playAndRecord)
        try! session.setActive(true)

        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 44100,
            AVNumberOfChannelsKey: 2,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]

        audioRecorder = try! AVAudioRecorder(url: getURL(), settings: settings)
        audioRecorder.delegate = self
        audioRecorder.record()
        audioRecorder.isMeteringEnabled = true
        timerOne()
        

        isRecording = true
    }
    
    func stop() {
        audioRecorder.stop()
        isRecording = false
        self.timer?.invalidate()
    }
    

    
    func timerOne() {
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.updateMonitorDb), userInfo: nil, repeats: true)
    }
    
    


}

