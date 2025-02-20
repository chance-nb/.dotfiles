function gradlerun
    if contains "settings.gradle" (ls);
        echo "found $(pwd)"
        gradle run --daemon
        return
    end
    pushd ..
    while true
        if contains "settings.gradle" (ls);
            echo "found $(pwd)"
            gradle run --daemon
            break
        else if test (pwd) = $HOME;
            echo "couldn't find settings.gradle"
            break
        end
        cd ..
    end
    popd
end
