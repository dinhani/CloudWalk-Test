require 'spec_helper'

describe Quake::Infra::LogLineForConnect do
  line = '20:34 ClientUserinfoChanged: 2 n\Isgalamido\t\0\model\xian/default\hmodel\xian/default\g_redteam\\g_blueteam\\c1\4\c2\5\hc\100\w\0\l\0\tt\0\tl\0'

  it 'matches the example' do
    expect(Quake::Infra::LogLineForConnect.matches? line).to eq(true)
  end

  it 'parses correctly' do
    parsed = Quake::Infra::LogLineForConnect.new(line)
    expect(parsed.client_id).to eq('2')
    expect(parsed.client_name).to eq('Isgalamido')
  end
end
