#>namespace:_/load
#--------------------
# @LOAD
#--------------------

# lantern
scoreboard players set *namespace load.status 1

#settings
execute unless data storage namespace:settings {PERSIST:true} run function namespace:settings

#declare storage namespace:var
#declare storage namespace:in
#declare storage namespace:out
#declare storage namespace:const
#declare storage namespace:data
#declare storage namespace:hook

#scoreboards
scoreboard objectives add namespace-var dummy
scoreboard objectives add namespace-dirty dummy
scoreboard objectives add namespace-data dummy
#scoreboard objectives add ._namespace-private_entity_property dummy
#scoreboard objectives add .namespace-entity_property dummy