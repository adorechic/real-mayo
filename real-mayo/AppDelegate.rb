require 'pathname'
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
    attr_accessor :tableView
    attr_accessor :scrollView
    
    def applicationDidFinishLaunching(a_notification)
        # Insert code here to initialize your application
        size = NSSize.new(0.0, 0.0)
        scrollView.setFrame(NSRect.new(scrollView.frame.origin, size))
    end

    def text(sender)
        if @targets && !@targets.empty?
            `open "/Applications/#{@targets.first}.app"`
        end
    end
    
    def controlTextDidChange(a_notification)
        if textField.stringValue.empty?
            @targets = []
        else
            app_names = Pathname.glob('/Applications/*').
                map { |path| path.basename.to_s.gsub(/\.app\Z/, '') }
            @targets = app_names.select { |name| name =~ /#{textField.stringValue}/i }
        end
        point = NSPoint.new(15.0, textField.frame.origin.y - (20.0 * @targets.size))
        size = NSSize.new(415.0, 20.0 * @targets.size)
        
        scrollView.setFrame(NSRect.new(point, size))
        
        tableView.reloadData
        
    end
    
    def numberOfRowsInTableView(aTableView)
        # データが何行あるかを返す
        if @targets
            @targets.size
        else
            0
        end
    end
    
    def tableView(aTableView, objectValueForTableColumn: aTableColumn, row: rowIndex)
        # テーブルに表示するデータを返す
        @targets[rowIndex]
    end
end