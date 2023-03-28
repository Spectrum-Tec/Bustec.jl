module Bu3424
#=
by default the bustec dll is found at C:\Program Files\IVI Foundation\VISA\Win64\Bin\bu3424.dll.  
There is probably a pointer to this path somewhere in the system

The functionality of this library is found in C:\Program Files\IVI Foundation\VISA\Win64\bu3424\bu3434.chm or bu3424.txt.

Probably use @ccall instead of ccall for this project.
=#

using WinReg

try
    if Sys.iswindows()
        bu3424path = bu3424path = querykey(WinReg.HKEY_LOCAL_MACHINE, 
            "SOFTWARE\\WOW6432Node\\Microsoft\\Windows\\CurrentVersion\\App Paths\\bu3424.exe", 
            "Path")
    elseif Sys.islinux()
            error(Linux version not yet implemented)
    end
catch
        error("Bustec 3424 dll path not found, please check installation")
end

# functionality of library follows

end # module