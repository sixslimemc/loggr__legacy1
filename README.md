
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

Log levels have the following meanings:
| Level | Category | Description |
|--|--|--|
| `0` | Active Debug | Debug message; Should only be utilized during active development. |
| `1` | Admin/Critical | Critical information/error that would be important for an admin to see. |
| `2` | Warning | Non-critical error or warning. |
| `3` | Information | General useful information. |

Loggr provides a single-function interface for creating log entries, aswell as a hook for external datapacks to implement logging behavior.

Loggr itself does not provide any implementation.
# Usage
#### Logging Messages
To create a log entry, run `loggr:api/log` with the following inputs under the NBT storage location `loggr:in`:
| NBT path | Type | Default Value |
|--|--|--|
| `log.message` | any | *(none)* |
| `log.source` | string | `"DEBUG"` |
| `log.level` | int (`0..3`) | `0` |

This (abstractly) creates a log containing **\<message\>**, from the **\<source\>** namespace, with log level **\<level\>**.

#### Providing Implementation
When a log entry is created, it is stored under `on_log[-1].info.entry` in NBT storage `loggr:hook` and `#loggr:hook/on_log` is executed. \
To implement behavior, add subscriber function(s) to the `#loggr:hook/on_log` function tag.

*`loggr:hook -> on_log[-1].info.entry` should be treated as read-only.*

___

<p align="center">
  <img src="https://sixslime.github.io/info/logos/temporary_documentation.svg" width="75%" alt="Temporary Documentation Tag"/>
</p>
