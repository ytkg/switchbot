# Switchbot

[SwitchBot API](https://github.com/OpenWonderLabs/SwitchBotAPI) client for Ruby

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'switchbot'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install switchbot

## Usage
```ruby
require 'switchbot'

client = Switchbot::Client.new('YOUR_TOKEN', 'YOUR_SECRET')
```

For v0.6.0 and below, refer to [README-v0.6.0-and-below.md](https://github.com/ytkg/switchbot/blob/main/README-v0.6.0-and-below.md).

### Get device list
GET https://api.switch-bot.com/v1.1/devices
```ruby
client.devices
#=> {:status_code=>100,
#    :body=>
#     {:device_list=>
#       [{:device_id=>"500291B269BE",
#         :device_name=>"Living Room Humidifier",
#         :device_type=>"Humidifier",
#         :enable_cloud_service=>true,
#         :hub_device_id=>"000000000000"}],
#      :infrared_remote_list=>
#       [{:device_id=>"02-202008110034-13",
#         :device_name=>"Living Room TV",
#         :remote_type=>"TV",
#         :hub_device_id=>"FA7310762361"}]},
#    :message=>"success"}
```

### Get device status
GET https://api.switch-bot.com/v1.1/devices/C271111EC0AB/status
```ruby
client.status(device_id: 'C271111EC0AB')
# or
client.device('C271111EC0AB').status
#=> {:status_code=>100,
#    :body=>
#     {:device_id=>"C271111EC0AB",
#      :device_type=>"Meter",
#      :hub_device_id=>"FA7310762361",
#      :humidity=>52,
#      :temperature=>26.1},
#    :message=>"success"}
```

### Send device control commands
POST https://api.switch-bot.com/v1.1/devices/210/commands
```ruby
client.commands(device_id: '210', command: 'turnOn')
# or
client.device('C271111EC0AB').commands(command: 'turnOn')
# or
client.device('C271111EC0AB').on
#=> {:status_code=>100,
#    :body=>{},
#    :message=>"success"}
```

### Get scene list
GET https://api.switch-bot.com/v1.1/scenes
```ruby
client.scenes
#=> {:status_code=>100,
#    :body=>
#     [{:scene_id=>"T02-20200804130110",
#       :scene_name=>"Close Office Devices"},
#      {:scene_id=>"T02-202009221414-48924101",
#       :scene_name=>"Set Office AC to 25"},
#      {:scene_id=>"T02-202011051830-39363561",
#       :scene_name=>"Set Bedroom to 24"},
#      {:scene_id=>"T02-202011051831-82928991",
#       :scene_name=>"Turn off home devices"},
#      {:scene_id=>"T02-202011062059-26364981",
#       :scene_name=>"Set Bedroom to 26 degree"}],
#    :message=>"success"}
```

### Execute manual scenes
POST https://api.switch-bot.com/v1.1/scenes/T02-202009221414-48924101/execute
```ruby
client.execute(scene_id: 'T02-202009221414-48924101')
# or
client.scene('T02-202009221414-48924101').execute
#=> {:status_code=>100,
#    :body=>{},
#    :message=>"success"}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ytkg/switchbot. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/ytkg/switchbot/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Switchbot project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/ytkg/switchbot/blob/master/CODE_OF_CONDUCT.md).
