Config { font = "-*-Fixed-Bold-R-Normal-*-13-*-*-*-*-*-*-*"
, bgColor = "black"
, fgColor = "grey"
, position = Top
, lowerOnStart = True
, commands = [ 
               Run StdinReader
             , Run Network "wlp3s0" ["-L","0","-H","32","--normal","green","--high","red"] 10
             , Run Cpu ["-L","3","-H","50","--normal","green","--high","red"] 10
             , Run Memory ["-t","Mem: <usedratio>%"] 10
             , Run Battery ["-t","[<left>]"] 600
             , Run Date "%a %b %_d %H:%M:%S" "date" 10
             ]
, sepChar = "%"
, alignSep = "}{"
, template = "%StdinReader% | %cpu% | %memory% | %wlp3s0% | Battery: %battery% }{ <fc=#ccccff>%date%</fc>"
}
