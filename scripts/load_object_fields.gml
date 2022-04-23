///load_object_fields(object,objname)
//scan an object's event code for field declarations

//i know this looks kind of nasty but we need to consider speed here, as this
//can potentially read through thousands of lines of gml when loading a room
//so it's been written for speed in most places

var i,f,reading,str,p,linec,actionc,line,fp;

i=argument0

objfields[i]=0
reading=0
f=file_text_open_read_safe(root+"objects\"+argument1+".gml") if (f) {do {
    line=file_text_read_string(f)
    file_text_readln(f)
    str=line
    if (!reading) {
        if (string_pos("#define Other_4",str)) {
            //only look for fields in room start events
            reading=1
            linec=-5
            actionc=0
        }
    } else {
        if (string_pos("#define",str)) {
            //we're done with room start
            reading=0 break
        }

        if (string_pos("/*"+qt+"/*'/**//*",str)) {
            //dnd action headers are 5 lines long
            actionc+=1
            linec=-5
        }

        linec+=1
        fp=string_pos("//field ",str)
        if (fp) {
            error="Error in action "+string(actionc)+" of Room Start event for "+qt+argument1+qt+":"+crlf+crlf+string(linec)+" | "+line+crlf+crlf
            //found a field signature; parse it
            p=string_pos(": ",str)
            if (p) {
                fieldname=string_delete_edge_spaces(string_copy(str,fp+8,p-(fp+8)))
                if (invalid_variable_name(fieldname)) {
                    show_message(error+"Field name "+qt+fieldname+qt+" contains invalid characters.")
                } else {
                    objfieldname[i,objfields[i]]=fieldname
                    str=string_delete_edge_spaces(string_delete(str,1,p+1))

                    if (string_pos("enum",str)) {
                        //enums are parsed differently due to option list
                        if (string_count("(",str)==1 && string_count(")",str)==1 && string_pos("(",str)<string_pos(")",str)) {
                            objfieldtype[i,objfields[i]]="enum"
                            //get the enum list from within the ()'s
                            str=string_delete(string_copy(str,1,string_pos(")",str)-1),1,string_pos("(",str))
                            if (str="") {
                                show_message(error+"Enum declaration has empty option list.")
                            } else {
                                objfieldargs[i,objfields[i]]=str
                                objfields[i]+=1
                            }
                        } else {
                            show_message(error+"Enum declaration missing list of options in parenthesis.")
                        }
                    } else {
                        if (invalid_field_type(str)) {
                            show_message(error+"Field type "+qt+str+qt+" is not recognized.")
                        } else {
                            objfieldtype[i,objfields[i]]=str
                            objfields[i]+=1
                        }
                    }
                }
            } else {
                //default to "value" type when no type is present
                fieldname=string_delete_edge_spaces(string_delete(str,1,fp+7))
                if (invalid_variable_name(fieldname)) {
                    show_message(error+"Field name "+qt+fieldname+qt+" contains invalid characters.")
                } else {
                    objfieldname[i,objfields[i]]=fieldname
                    objfieldtype[i,objfields[i]]="value"
                    objfields[i]+=1
                }
            }
        }
    }
} until (file_text_eof(f)) file_text_close(f)}
