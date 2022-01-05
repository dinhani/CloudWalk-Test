describe Quake::Infra::LogLineForConnect do
  it "matches the example" do
    line = '20:34 ClientUserinfoChanged: 2 n\Isgalamido\t\0\model\xian/default\hmodel\xian/default\g_redteam\\g_blueteam\\c1\4\c2\5\hc\100\w\0\l\0\tt\0\tl\0'
    expect(Quake::Infra::LogLineForConnect.matches? line).to eq(true)
  end
end
