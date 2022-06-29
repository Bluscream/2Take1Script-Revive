#SingleInstance, force
#Include <bluscream>
global no_ui := True

isBinFile(Filename,tolerance=5) {
	file:=FileOpen(Filename,"r")
	loop, %tolerance% {
		file.RawRead(a,1)
		byte:=NumGet(&a,"Char")
		if (byte<9) or (byte>126) or ((byte<32) and (byte>13)) {
			file.Close()
			return 1
		}
	}
	file.Close()
	return 0
}

Loop Files, *.out*, R
{
    scriptlog("Delete: " . A_LoopFileShortPath)
    FileDelete, % A_LoopFileLongPath
}
Loop Files, *.lua, R
{
    if (!endswith(A_LoopFileLongPath, "c") and isBinFile(A_LoopFileLongPath)) {
        newname := A_LoopFileLongPath . "c"
        scriptlog(A_LoopFileShortPath . " > " . newname)
        FileMove, % A_LoopFileLongPath, % newname, 1
    }
}
Loop Files, *.luac, R
{
    newname := StrReplace(A_LoopFileLongPath, ".luac", ".lua")
    ; scriptlog(A_LoopFileShortPath . " > " . newname)
    cmd := ["java","-jar","""P:\Decompilers\Lua\unluac.jar""","""" . A_LoopFileLongPath . """",">","""" . newname . """"]
    cmd2 := Join(" ", cmd)
    scriptlog(cmd2)
    ; ShellRun(cmd)
    ; Run % cmd2
    RunWait, %ComSpec% /c %cmd2%, , Min
}
Loop Files, *.lua, R
{
    if (A_LoopFileSize < 1) {
        scriptlog("Delete: " . A_LoopFileShortPath)
        FileDelete, % A_LoopFileLongPath
    }
}