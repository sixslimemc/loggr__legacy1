#> loggr:api > log
#--------------------
# -> message: any
# => source: string = "DEBUG"
# => level: int = 0
#--------------------
# ...
#--------------------
#> logs a <message>, sent from a <source> datapack namespace, with log <level>.
#--------------------
#- example in: {source: "my_pack", message: {my_data: 4, is_cool: false}, level: 3}
#--------------------
# ...
#--------------------

#-- HOOK : loggr:on_log --
data modify storage loggr:hook on_log append value {}
data modify storage loggr:hook on_log[-1].info.entry set from storage loggr:in log
function #loggr:hook/on_log
data remove storage loggr:hook on_log[-1]
#-- > < --

data remove storage loggr:in log
