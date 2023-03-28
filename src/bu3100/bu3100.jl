module Bu3100
#=
by default the bustec dll is found at C:\Program Files\IVI Foundation\VISA\Win64\Bin\bu3100_64.dll.  

The functionality of this library is found in C:\Program Files\IVI Foundation\VISA\Win64\bu3100\bu3100.chm or bu3100.txt.

Probably use @ccall instead of ccall for this project.
=#

using WinReg


# find path to the required dll from the registry
function __init__()
try
    if Sys.iswindows()
        bu3100path = querykey(WinReg.HKEY_LOCAL_MACHINE, 
            "SOFTWARE\\WOW6432Node\\Microsoft\\Windows\\CurrentVersion\\App Paths\\bu3424.exe", 
            "Path")
        b = splitpath(bu3100path)
        b[end] = "Bin"
        global bu3100path = joinpath(b)
    elseif Sys.islinux()
            error("Linux version not yet implemented")
    end
catch
        error("Bustec 3424 dll path not found, please check installation")
end
end

# functionality of library follows

end # module