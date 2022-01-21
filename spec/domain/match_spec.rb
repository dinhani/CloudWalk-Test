require 'spec_helper'

describe Quake::Domain::Match do
  match = Quake::Domain::Match.new

  it "starts without players" do
    expect(match.players.size).to eq(0)
  end

  it "add players when id does not exist" do
    match.update_player(1, "Renato")
    expect(match.players[1].name).to eq("Renato")
    expect(match.players.size).to eq(1)

    match.update_player("2", "CloudWalk")
    expect(match.players[2].name).to eq("CloudWalk")
    expect(match.players.size).to eq(2)
  end

  it "update name when id exists" do
    expect(match.players[1].name).to eq("Renato")
    match.update_player(1, "Dinhani")
    expect(match.players[1].name).to eq("Dinhani")
    expect(match.players.size).to eq(2)
  end

  it "add kills" do
    match.add_kill(1, 2, "MOD_SHOTGUN")
    expect(match.kills[0].killer_id).to eq(1)
    expect(match.kills[0].victim_id).to eq(2)
    expect(match.kills[0].type).to eq("MOD_SHOTGUN")

    match.add_kill(2, 1, "MOD_RAILGUN")
    expect(match.kills[1].killer_id).to eq(2)
    expect(match.kills[1].victim_id).to eq(1)
    expect(match.kills[1].type).to eq("MOD_RAILGUN")

    match.add_kill(1, 2, "MOD_SHOTGUN")
    expect(match.kills[2].killer_id).to eq(1)
    expect(match.kills[2].victim_id).to eq(2)
    expect(match.kills[2].type).to eq("MOD_SHOTGUN")

    match.add_kill(2, 2, "MOD_SUICIDE")
    expect(match.kills[3].killer_id).to eq(2)
    expect(match.kills[3].victim_id).to eq(2)
    expect(match.kills[3].type).to eq("MOD_SUICIDE")
  end

  describe Quake::Domain::MatchScore do
    it "computes the kill count correctly" do
      expect(match.score.kill_count).to eq(3)
    end

    it "computes kills by player correctly" do
      report = match.score.kills_by_player
      expect(report[1]).to eq(2)
      expect(report[2]).to eq(1)
    end

    it "computes kills by type correctly" do
      report = match.score.kills_by_type
      expect(report["MOD_SHOTGUN"]).to eq(2)
      expect(report["MOD_RAILGUN"]).to eq(1)
      expect(report["MOD_SUICIDE"]).to eq(0)
    end
  end
end
