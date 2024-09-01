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
#- example in: {source: "my_pack", message: {my_event:{data: 4, other_data: true}}, level: 3}
#- it is encouraged to provide a structured object as the <message> (like the example above) to allow for querying.
#--------------------
# ...
#--------------------

execute unless data storage loggr:in log.source run data modify storage loggr:in log.source set value "DEBUG"
execute unless data storage loggr:in log.level run data modify storage loggr:in log.level set value 0

execute store result storage loggr:in log.time.tick int 1 run time query gametime
execute store result storage loggr:in log.time.subtick_order int 1 run scoreboard players add *subtick_order -loggr 1

#-- HOOK : loggr:on_log --
data modify storage loggr:hook on_log append value {}
data modify storage loggr:hook on_log[-1].info.entry set from storage loggr:in log
function #loggr:hook/on_log
data remove storage loggr:hook on_log[-1]
#-- > < --

data remove storage loggr:in log
