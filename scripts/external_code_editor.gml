var str,tf,f;

str=argument0

tf=temp_directory+"\code.txt"

f=file_text_open_write(tf)
file_text_write_string(f,string_replace_all(str,chr(10),chr(13)+chr(10)))
file_text_close(f)

execute_program(codeeditor,tf,1)

if (file_exists(tf)) {
    str=string_replace_all(file_text_read_all(tf),chr(13),"")
    if (string_replace_all(string_replace_all(string_replace_all(str,chr(9),""),chr(10),"")," ","")="") str=""
    return str
}

return argument0