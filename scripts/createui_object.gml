//object mode

i=instance_create(0,96,Button)
i.spr=19
i.action="palscrolup"
i.w=160
i.h=24
i.tagmode=0

i=instance_create(0,height-136,Button)
i.spr=20
i.action="palscroldown"
i.w=160
i.h=24
i.anchor=2
i.tagmode=0

i=instance_create(8,height-104,TextField)
i.action="palette name"
i.type=3
i.anchor=2
i.dynamic=-1
i.maxlen=13
i.w=112
i.tagmode=0
if (objpal!=noone) textfield_set("palette name",ds_list_find_value(objects,objpal))

i=instance_create(120,height-104,Button)
i.anchor=2
i.spr=34
i.action="object search"
i.alt="Search..."
i.tagmode=0

i=instance_create(8,height-100+32,Button)
i.type=1
i.anchor=2
i.action="overlap check"
i.text="No overlap"
i.alt="Avoid placing instances that overlap existing#instances of the same object type"
i.tagmode=0

i=instance_create(120,height-100+60,Button)
i.action="cement"
i.alt="Glue adjacent instances of this object to reduce instance count"
i.spr=26
i.w=28
i.tagmode=0
i.anchor=2

i=instance_create(92,height-100+60,Button)
i.action="cleanup"
i.alt="Remove identical stacked instances of this object"
i.spr=29
i.w=28
i.tagmode=0
i.anchor=2

i=instance_create(64,height-100+60,Button)
i.action="parsecode"
i.alt="Parse all creation code for scaling and blend values"
i.spr=31
i.w=28
i.tagmode=0
i.anchor=2

i=instance_create(36,height-100+60,Button)
i.action="loadjmap"
i.alt="Import jtool jmap file into a compatible engine"
i.spr=32
i.w=28
i.tagmode=0
i.anchor=2

i=instance_create(8,height-100+60,Button)
i.action="replaceobj"
i.alt="Replace selected instances of an object with a different object"
i.spr=33
i.w=28
i.tagmode=0
i.anchor=2


//inspector
i=instance_create(width-160,0,TextField)
i.action="object name"
i.type=2
i.anchor=1
i.dynamic=0
i.maxlen=11
i.w=128
i.tagmode=0

i=instance_create(width-32,0,Button)
i.spr=13
i.action="copy object"
i.alt="Copy instance name"
i.anchor=1
i.dynamic=0
i.tagmode=0

//position
i=instance_create(width-160+8,64,TextField)
i.action="inst x"
i.alt="x"
i.anchor=1
i.dynamic=0
i.displen=6
i.w=72
i.tagmode=0

i=instance_create(width-80,64,TextField)
i.action="inst y"
i.alt="y"
i.anchor=1
i.dynamic=0
i.displen=6
i.w=72
i.tagmode=0

i=instance_create(width-64,100,Button)
i.action="inst snap"
i.text="Snap"
i.anchor=1
i.dynamic=0
i.w=56
i.h=24
i.tagmode=0

//scale
i=instance_create(width-160+8,164,TextField)
i.action="inst xs"
i.alt="xscale"
i.dynamic=0
i.displen=6
i.anchor=1
i.w=72
i.tagmode=0

i=instance_create(width-80,164,TextField)
i.action="inst ys"
i.alt="yscale"
i.dynamic=0
i.displen=6
i.anchor=1
i.w=72
i.tagmode=0

i=instance_create(width-160+8+8,192+8,Button)
i.action="inst flip xs"
i.text="Flip"
i.alt="Flip horizontally"
i.anchor=1
i.dynamic=0
i.w=56
i.h=24
i.tagmode=0

i=instance_create(width-80+8,192+8,Button)
i.action="inst flip ys"
i.text="Flip"
i.alt="Flip vertically"
i.anchor=1
i.dynamic=0
i.w=56
i.h=24
i.tagmode=0

//rotation
i=instance_create(width-160+8,264,TextField)
i.action="inst ang"
i.anchor=1
i.dynamic=0
i.displen=6
i.w=72
i.tagmode=0

i=instance_create(width-80+4,260+4,Button)
i.action="inst rot left"
i.alt="Rotate left"
i.spr=14
i.anchor=1
i.dynamic=0
i.tagmode=0

i=instance_create(width-80+8+32,260+4,Button)
i.action="inst rot right"
i.alt="Rotate right"
i.spr=15
i.anchor=1
i.dynamic=0
i.tagmode=0

//blend
i=instance_create(width-160+8,336,TextField)
i.action="inst col"
i.alt="colour"
i.anchor=1
i.dynamic=0
i.type=1
i.text=string(global.col_main)
i.w=72
i.tagmode=0

i=instance_create(width-160+8+72,336,TextField)
i.action="inst alpha"
i.alt="alpha"
i.anchor=1
i.dynamic=0
i.maxval=255
i.w=72
i.tagmode=0

//creation code
i=instance_create(width-160+4,376+4,Button)
i.action="inst code"
i.text="  Creation"
i.spr=31
i.anchor=1
i.dynamic=0
i.w=160-8
i.h=32-4
i.tagmode=0

i=instance_create(width-160,408+4,TextField)
i.action="inst code box"
i.alt="Quick code editor"
i.anchor=1
i.dynamic=0
i.type=4
i.multiline=1
i.maxlen=99999
i.displen=99999
i.w=160
i.h=32
i.tagmode=0
