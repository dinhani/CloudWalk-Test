describe Quake::Infra::LogLineForKill do
  line = "20:54 Kill: 1022 2 22: <world> killed Isgalamido by MOD_TRIGGER_HURT"

  it "matches the example" do
    expect(Quake::Infra::LogLineForKill.matches? line).to eq(true)
  end

  it "parses correctly" do
    parsed = Quake::Infra::LogLineForKill.new(line)
    expect(parsed.killer_id).to eq("1022")
    expect(parsed.victim_id).to eq("2")
    expect(parsed.kill_type).to eq("MOD_TRIGGER_HURT")
  end
end
