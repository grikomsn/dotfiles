function dequarantine --description 'dequarantine files or directories'
    for item in $argv
        if test -d $item # if it's a directory
            xattr -rd com.apple.quarantine $item
        else # if it's a file
            xattr -c $item
        end
    end
end
