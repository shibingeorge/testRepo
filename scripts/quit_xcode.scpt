tell application "System Events"
    get system attribute "sysv"
    if result is greater than or equal to 4144 then
        if UI elements enabled then
            tell application process "Xcode"
                tell application "Xcode"
                    activate
                end tell
                
                delay 4
                
                click menu item "Stop" of menu 1 of menu bar item "Product" of menu bar 1
            end tell
        else
            beep
            display dialog "GUI Scripting is not enabled" & return & return & "Open System Preferences and check Enable Access for Assistive Devices in the Universal Access preference pane, then run this script again." with icon stop
            if button returned of result is "OK" then
                tell application "System Preferences"
                    activate
                    set current pane to pane "com.apple.preference.universalaccess"
                end tell
            end if
        end if
    else
        beep
        display dialog "This computer cannot run this script" & return & return & "The script uses GUI Scripting technology, which requires an upgrade to Mac OS X 10.3 Panther or newer." with icon caution buttons {"Quit"} default button "Quit"
    end if
    delay 2
    tell application "Xcode"
        quit
    end tell
    
end tell