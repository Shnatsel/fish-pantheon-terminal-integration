function pantheon-terminal-process-completion-callback --on-event fish_postexec --description "Notify Pantheon Terminal about task completion"
    if status --is-interactive; and set --query PANTHEON_TERMINAL_ID
        dbus-send --type=method_call --session --dest=net.launchpad.pantheon-terminal /net/launchpad/pantheon_terminal org.pantheon.terminal.ProcessFinished string:$PANTHEON_TERMINAL_ID string:"$argv[1]";
    end
end
