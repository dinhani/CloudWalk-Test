describe Quake::Infra::LogLineForKill do
  it "matches the example" do
    line = "# 20:54 Kill: 1022 2 22: <world> killed Isgalamido by MOD_TRIGGER_HURT"
    expect(Quake::Infra::LogLineForKill.matches? line).to eq(true)
  end
end
