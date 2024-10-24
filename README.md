
# Loggr | loggr
> Dead-simple logging framework that must be implemented externally via hook.

## Dependencies
- [load](https://github.com/sixslime/load)

# Overview
Loggr is simply a set of logging conventions paired with an interface.

#### Logging Conventions:

A 'log entry' has the following components:
| NBT path | Type | Description |
|--|--|--|
| `message` | any | The information carried by this log entry. |
| `source` | string | The datapack namespace this log entry originated from. |
| `level` | int (`0..3`) | The level/category of this log entry. |
| `time` | int | The gametime when this log entry was created. |
| `subtick_order` | int | The chronological ordering of this entry compared to other log entries created on the same tick (starting at 1).|

Log levels have the following meanings:
| Level | Category | Description |
|--|--|--|
| `0` | Active Debug | Debug message; Should only be utilized during active development. |
| `1` | Admin/Critical | Critical information/error that would be important for an admin to see. |
| `2` | Warning | Non-critical error or warning. |
| `3` | Information | General useful information. |

Loggr provides a single-function interface for creating log entries, aswell as a hook for external datapacks to implement logging behavior. \

Loggr itself does not provide any implementation.
# Usage
#### Logging Messages
To create a log entry, run `loggr:api/log` with the following inputs under the NBT storage location `loggr:in`:
| NBT path | Type | Default Value |
|--|--|--|
| `log.message` | any | *(none)* |
| `log.source` | string | `"DEBUG"` |
| `log.level` | int (`0..3`) | `0` |

This creates a log entry containing **\<message\>**, from the **\<source\>** namespace, with log level **\<level\>**. \
The `time` and `subtick_order` of the log entry are calculated automatically.

#### Providing Implementation
When a log entry is created, it is stored under `on_log[-1].info.entry` in NBT storage `loggr:hook` and `#loggr:hook/on_log` is executed. \
To implement behavior, add subscriber function(s) to the `#loggr:hook/on_log` function tag.

*`loggr:hook -> on_log[-1].info.entry` should be treated as read-only.*

## Examples

Basic log usage:
```mcfunction
# 'mypack' just spawned a boss and information about it is already stored in 'mypack:var -> boss.info'.
data merge storage loggr:in {log:{level:3, source:"mypack"}}
data modify storage loggr:in log.message.boss.spawn set from storage mypack:var boss.info
function loggr:api/log
```

Basic implementation:

`<datapack>/data/loggr/tags/function/hook/on_log.json`:
```json
{
    "values": [
        "myimpl:_/my_subscriber"
    ]
}
```
`myimpl:_/my_subscriber`:
```mcfunction
# store log entry in an array
data modify storage myimpl:data all_logs append from storage loggr:hook on_log[-1].info.entry

# send a chat message
tellraw @a "A log entry was created."
```




___

<p align="center">
  <img src="https://sixslime.github.io/info/logos/temporary_documentation.svg" width="75%" alt="Temporary Documentation Tag"/>
</p>
