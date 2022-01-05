describe Quake::Domain::Kill do
  kill_type = "MOD_MACHINEGUN"

  it "identifies a death by suicide" do
    kill = Quake::Domain::Kill.new(1, 1, kill_type)
    expect(kill.by_suicide?).to eq(true)
  end

  it "identifies a death by the world" do
    (-128..-1).each do |id|
      kill = Quake::Domain::Kill.new(id, 1, kill_type)
      expect(kill.by_world?).to eq(true)
    end

    (0..63).each do |id|
      kill = Quake::Domain::Kill.new(id, 1, kill_type)
      expect(kill.by_world?).to eq(false)
    end

    (64..128).each do |id|
      kill = Quake::Domain::Kill.new(id, 1, kill_type)
      expect(kill.by_world?).to eq(true)
    end
  end
end
