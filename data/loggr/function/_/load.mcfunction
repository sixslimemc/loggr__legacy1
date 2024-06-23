#>log:_/load
#--------------------
# @LOAD
#--------------------

# lantern
scoreboard players set *log load.status 1

#settings
execute unless data storage log:settings {PERSIST:true} run function log:settings

#declare storage log:var
#declare storage log:in
#declare storage log:out
#declare storage log:const
#declare storage log:data
#declare storage log:hook

#scoreboards
scoreboard objectives add log-var dummy
scoreboard objectives add log-dirty dummy
scoreboard objectives add log-data dummy
#scoreboard objectives add ._log-private_entity_property dummy
#scoreboard objectives add .log-entity_property dummy