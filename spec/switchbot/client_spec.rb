# frozen_string_literal: true

RSpec.describe Switchbot::Client do
  include_context :api_variables

  describe '#devices' do
    subject(:devices) { client.devices }

    before do
      stub_request(:get, 'https://api.switch-bot.com/v1.0/devices')
        .to_return(status: 200, headers: response_headers, body: fixture('devices.json'))
    end

    its([:status_code]) { should eq 100 }
    its([:message]) { should eq 'success' }

    describe 'body' do
      subject { devices[:body] }

      its([:device_list]) do
        should eq [
          {
            device_id: '500291B269BE',
            device_name: 'Living Room Humidifier',
            device_type: 'Humidifier',
            enable_cloud_service: true,
            hub_device_id: '000000000000'
          }
        ]
      end

      its([:infrared_remote_list]) do
        should eq [
          {
            device_id: '02-202008110034-13',
            device_name: 'Living Room TV',
            hub_device_id: 'FA7310762361',
            remote_type: 'TV'
          }
        ]
      end
    end
  end

  describe '#status' do
    subject { client.status(device_id: 'C271111EC0AB') }

    before do
      stub_request(:get, 'https://api.switch-bot.com/v1.0/devices/C271111EC0AB/status')
        .to_return(status: 200, headers: response_headers, body: fixture('status.json'))
    end

    its([:status_code]) { should eq 100 }
    its([:message]) { should eq 'success' }
    its([:body]) do
      should eq(
        {
          device_id: 'C271111EC0AB',
          device_type: 'Meter',
          hub_device_id: 'FA7310762361',
          humidity: 52,
          temperature: 26.1
        }
      )
    end
  end

  describe '#commands' do
    subject do
      client.commands(device_id: 'C271111EC0AB',
                      command: 'turnOn',
                      parameter: 'default',
                      command_type: 'command')
    end

    before do
      stub_request(:post, 'https://api.switch-bot.com/v1.0/devices/C271111EC0AB/commands')
        .to_return(status: 200, headers: response_headers, body: fixture('commands.json'))
    end

    its([:status_code]) { should eq 100 }
    its([:message]) { should eq 'success' }
    its([:body]) { should eq({}) }
  end

  describe '#scenes' do
    subject { client.scenes }

    before do
      stub_request(:get, 'https://api.switch-bot.com/v1.0/scenes')
        .to_return(status: 200, headers: response_headers, body: fixture('scenes.json'))
    end

    its([:status_code]) { should eq 100 }
    its([:message]) { should eq 'success' }
    its([:body]) do
      should eq(
        [
          {
            scene_id: 'T02-20200804130110',
            scene_name: 'Close Office Devices'
          },
          {
            scene_id: 'T02-202009221414-48924101',
            scene_name: 'Set Office AC to 25'
          },
          {
            scene_id: 'T02-202011051830-39363561',
            scene_name: 'Set Bedroom to 24'
          },
          {
            scene_id: 'T02-202011051831-82928991',
            scene_name: 'Turn off home devices'
          },
          {
            scene_id: 'T02-202011062059-26364981',
            scene_name: 'Set Bedroom to 26 degree'
          }
        ]
      )
    end
  end

  describe '#status' do
    subject { client.execute(scene_id: 'T02-202009221414-48924101') }

    before do
      stub_request(:post, 'https://api.switch-bot.com/v1.0/scenes/T02-202009221414-48924101/execute')
        .to_return(status: 200, headers: response_headers, body: fixture('execute.json'))
    end

    its([:status_code]) { should eq 100 }
    its([:message]) { should eq 'success' }
    its([:body]) { should eq({}) }
  end
end
