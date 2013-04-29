#
#  AppDelegate.rb
#  real-mayo
#
#  Created by takamichi-yoshikawa on 4/28/13.
#  Copyright 2013 adorechic. All rights reserved.
#

class AppDelegate
    attr_accessor :window
    attr_accessor :textField
    def applicationDidFinishLaunching(a_notification)
        # Insert code here to initialize your application
    end
    
    def startTimer(sender)
        if @timer.nil?
            @time = 0.0
            @timer = NSTimer
            .scheduledTimerWithTimeInterval(0.1,
                                            target: self,
                                            selector: "timerHandler:",
                                            userInfo: nil,
                                            repeats: true)
        end
    end
    
    def stopTimer(sender)
        if @timer
            @timer.invalidate
            @timer = nil
        end
    end
    
    def timerHandler(obj)
        @time += 0.1
        string = sprintf("%.1f", @time)
        textField.setStringValue(string)
    end
end

